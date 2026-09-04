type opts = {
  folding : bool;
  propagation : bool;
  unreachable : bool;
  deadstores : bool;
}

let unpack_opts flags =
  {
    folding = flags land 1 <> 0;
    propagation = flags land 2 <> 0;
    unreachable = flags land 4 <> 0;
    deadstores = flags land 8 <> 0;
  }

let is_label = function Ir.Label _ -> true | _ -> false

let is_terminator = function
  | Ir.Jump _ | Ir.JumpIfZero _ | Ir.JumpIfNotZero _ | Ir.Return _ -> true
  | _ -> false

let instructions_to_cfg (ins : Ir.instruction list) : Cfg.graph =
  let cfg = Cfg.make_cfg () in
  let current_block = ref [] in

  let flush () =
    if !current_block <> [] then begin
      Cfg.insert_block cfg (List.rev !current_block);
      current_block := []
    end
  in

  List.iter
    (fun instr ->
      if is_label instr then begin
        flush ();
        current_block := [ instr ]
      end
      else begin
        current_block := instr :: !current_block;
        if is_terminator instr then flush ()
      end)
    ins;

  flush ();
  Cfg.add_all_edges cfg;
  cfg

let cfg_to_instructions (cfg : Cfg.graph) : Ir.instruction list =
  Hashtbl.fold (fun id node acc -> (id, node) :: acc) cfg.blocks []
  |> List.sort (fun (a, _) (b, _) -> compare a b)
  |> List.concat_map (fun (_, node) -> Cfg.get_instructions node)

let optimise (body : Ir.instruction list) (o : opts) (statics : Cfg.StringSet.t)
    : Ir.instruction list =
  let rec loop body =
    if body = [] then body
    else
      let post_folding =
        if o.folding then List.filter_map Constant_folding.apply body else body
      in

      let cfg = instructions_to_cfg post_folding in
      Debug.log (fun () ->
          Format.eprintf "=== Initial CFG ===\n%a\n" Cfg.pp_graph cfg);

      if o.unreachable then begin
        Unreachable_code_elimination.apply cfg;
        Debug.log (fun () ->
            Format.eprintf "=== After Unreachable Code Elimination ===\n%a\n"
              Cfg.pp_graph cfg)
      end;
      if o.propagation then begin
        Copy_propagation.apply cfg statics;
        Debug.log (fun () ->
            Format.eprintf "=== After Copy Propagation ===\n%a\n" Cfg.pp_graph
              cfg)
      end;
      if o.deadstores then begin
        Dead_store_elimination.apply cfg statics;
        Debug.log (fun () ->
            Format.eprintf "=== After Dead Store Elimination ===\n%a\n"
              Cfg.pp_graph cfg)
      end;
      let body_opt = cfg_to_instructions cfg in
      if body_opt = body || body_opt = [] then body_opt else loop body_opt
  in
  loop body

let optimise_func (f : Ir.top_level) (o : opts) (statics : Cfg.StringSet.t) :
    Ir.top_level =
  (* only optimise function bodies *)
  match f with
  | Function { name; global; params; body; frame } ->
      let body_opt = optimise body o statics in
      Function { name; global; params; body = body_opt; frame }
  | StaticVariable { name; global; t; init } ->
      StaticVariable { name; global; t; init }

(** Construct a set of variable names whose storage is static and whose value
    may be observed across function boundaries or translation units. *)
let collect_escaping_globals (te : Env.tenv) =
  Env.static_vars te
  |> List.map (fun (name, _, _, _) -> name)
  |> Cfg.StringSet.of_list

let optimise_prog (Program p : Ir.prog) (o : opts) (te : Env.tenv) : Ir.prog =
  let statics = collect_escaping_globals te in
  let compiled_funcs = List.map (function f -> optimise_func f o statics) p in
  Ir.Program compiled_funcs
