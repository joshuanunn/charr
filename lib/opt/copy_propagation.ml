let get_block_copies (n : Cfg.node) : Cfg.CopySet.t =
  match n with
  | Cfg.BasicBlock r ->
      List.fold_left
        (fun acc instr ->
          match instr with Ir.Copy _ -> Cfg.CopySet.add instr acc | _ -> acc)
        Cfg.CopySet.empty r.instructions
  | Cfg.EntryNode _ | Cfg.ExitNode _ -> Cfg.CopySet.empty

(** Construct a preliminary set of all copy instructions across all blocks. *)
let find_all_copy_instructions (blocks : Cfg.node list) : Cfg.CopySet.t =
  List.fold_left
    (fun acc block ->
      match block with
      | Cfg.BasicBlock _ -> Cfg.CopySet.union acc (get_block_copies block)
      | _ -> acc)
    Cfg.CopySet.empty blocks

(** Special case where x = y reaches y = x, which has no effect. *)
let is_inverse_copy instr copies =
  match instr with
  | Ir.Copy { src; dst } ->
      Cfg.CopySet.mem (Ir.Copy { src = dst; dst = src }) copies
  | _ -> false

(** Kill any copies to or from x, following x = y. *)
let kill_copy_dest dst copies =
  Cfg.CopySet.filter
    (fun c ->
      match c with
      | Ir.Copy { src; dst = d } -> src <> dst && d <> dst
      | _ -> true)
    copies

(** Check if variable is static. *)
let is_static (value : Ir.value) (static_names : Cfg.StringSet.t) : bool =
  match value with
  | Ir.Var name -> Cfg.StringSet.mem name static_names
  | _ -> false

(** Kill copies to or from variables with static storage duration or any copies
    to or from the destination of the result from the function call. *)
let kill_for_fun_call dst static_names copies =
  Cfg.CopySet.filter
    (fun c ->
      match c with
      | Ir.Copy { src; dst = d } ->
          not
            (is_static src static_names || is_static d static_names || src = dst
           || d = dst)
      | _ -> true)
    copies

(** Meet operator for reaching copies analysis. Computes the set of copy
    instructions that reach the beginning of a basic block by taking the
    intersection of the reaching copies at the end of all predecessor blocks. If
    the block has Entry as a predecessor, the result is the empty set. *)
let meet (cfg : Cfg.graph) (id : Cfg.node_id) (all_copies : Cfg.CopySet.t) =
  let predecessors = Cfg.with_basicblock cfg id (fun r -> r.predecessors) in

  (* If Entry is a predecessor, the meet is empty *)
  if Cfg.NodeIdSet.mem Cfg.Entry predecessors then Cfg.CopySet.empty
  else
    Cfg.NodeIdSet.fold
      (fun pred_id incoming_copies ->
        match pred_id with
        | Cfg.Block _ ->
            let pred_out_copies =
              Cfg.with_basicblock cfg pred_id (fun r -> r.reaching_copies)
            in
            Cfg.CopySet.inter incoming_copies pred_out_copies
        | Cfg.Entry -> failwith "already handled Entry case"
        | Cfg.Exit -> failwith "malformed control-flow Cfg.graph")
      predecessors all_copies

(** Transfer function for reaching copies analysis. Given the set of copies that
    reach the beginning of a basic block, iterates over the block’s
    instructions, annotating each instruction with the copies that reach just
    before it and updating the current reaching copies. At the end of the block,
    records the set of copies that reach the block’s exit. *)
let transfer (cfg : Cfg.graph) (id : Cfg.node_id) initial_reaching_copies
    static_names instr_info =
  let current_reaching_copies = ref initial_reaching_copies in
  let block_instructions =
    Cfg.with_basicblock cfg id (fun r -> r.instructions)
  in

  List.iteri
    (fun idx instruction ->
      (* Annotate instruction with all reaching copies to just before instruction *)
      instr_info :=
        Cfg.InstrMap.add (id, idx) !current_reaching_copies !instr_info;

      (* Update reaching copies *)
      match instruction with
      | Ir.Copy { dst; _ } ->
          if not (is_inverse_copy instruction !current_reaching_copies) then begin
            current_reaching_copies :=
              !current_reaching_copies |> kill_copy_dest dst
              |> Cfg.CopySet.add instruction
          end
      | Ir.FunCall { dst; _ } ->
          current_reaching_copies :=
            kill_for_fun_call dst static_names !current_reaching_copies
      | Ir.Unary { dst; _ }
      | Ir.Binary { dst; _ }
      | Ir.SignExtend { dst; _ }
      | Ir.Truncate { dst; _ } ->
          current_reaching_copies := kill_copy_dest dst !current_reaching_copies
      | _ -> ())
    block_instructions;

  (* Finally, update block (end) reaching copies with surviving copies *)
  Cfg.with_basicblock cfg id (fun r ->
      r.reaching_copies <- !current_reaching_copies)

(** Replace a value operand using reaching copies information. If the operand is
    a variable and there exists a reaching copy that assigns to it, the operand
    is replaced with the copy’s source. Constants and operands without a
    defining reaching copy are returned unchanged. *)
let replace_operand (op : Ir.value) (copies : Cfg.CopySet.t) : Ir.value =
  match op with
  | Ir.Constant _ -> op
  | Ir.Var _ -> (
      match
        Cfg.CopySet.find_first_opt
          (function Ir.Copy { dst; _ } when dst = op -> true | _ -> false)
          copies
      with
      | Some (Ir.Copy { src; _ }) -> src
      | _ -> op)

(** Rewrite a single IR instruction using the set of reaching copies that apply
    immediately before it. Source operands are replaced where possible using
    copy propagation. Redundant Copy instructions whose effect is already
    guaranteed by reaching copies are removed by returning None. *)
let rewrite_instruction (instr : Ir.instruction) (copies : Cfg.CopySet.t) :
    Ir.instruction option =
  match instr with
  | Ir.Copy { src; dst } ->
      let redundant =
        Cfg.CopySet.exists
          (function
            | Ir.Copy { src = s; dst = d } ->
                (s = src && d = dst) || (s = dst && d = src)
            | _ -> false)
          copies
      in
      if redundant then None
      else
        let new_src = replace_operand src copies in
        Some (Ir.Copy { src = new_src; dst })
  | Ir.Unary { op; src; dst } ->
      let new_src = replace_operand src copies in
      Some (Ir.Unary { op; src = new_src; dst })
  | Ir.Binary { op; src1; src2; dst } ->
      let new_src1 = replace_operand src1 copies in
      let new_src2 = replace_operand src2 copies in
      Some (Ir.Binary { op; src1 = new_src1; src2 = new_src2; dst })
  | Ir.Return v -> Some (Ir.Return (replace_operand v copies))
  | Ir.JumpIfZero { condition; target } ->
      let new_condition = replace_operand condition copies in
      Some (Ir.JumpIfZero { condition = new_condition; target })
  | Ir.JumpIfNotZero { condition; target } ->
      let new_condition = replace_operand condition copies in
      Some (Ir.JumpIfNotZero { condition = new_condition; target })
  | Ir.FunCall { fun_name; args; dst } ->
      let new_args = List.map (fun a -> replace_operand a copies) args in
      Some (Ir.FunCall { fun_name; args = new_args; dst })
  | Ir.Label _ | Ir.Jump _ -> Some instr
  | Ir.SignExtend { src; dst } ->
      let new_src = replace_operand src copies in
      Some (Ir.SignExtend { src = new_src; dst })
  | Ir.Truncate { src; dst } ->
      let new_src = replace_operand src copies in
      Some (Ir.Truncate { src = new_src; dst })

let rewrite_block (block_id : int) (instrs : Ir.instruction list)
    (instr_info : Cfg.CopySet.t Cfg.InstrMap.t) : Ir.instruction list =
  instrs
  |> List.mapi (fun idx instr ->
      let copies = Cfg.InstrMap.find (Block block_id, idx) instr_info in
      rewrite_instruction instr copies)
  |> List.filter_map Fun.id

(** Rewrite all basic blocks in a control-flow Cfg.graph using instruction-level
    reaching copies information. Each instruction is rewritten or removed
    according to copy propagation rules, and the instructions within each basic
    block are updated in place. *)
let rewrite_cfg (cfg : Cfg.graph) (instr_info : Cfg.CopySet.t Cfg.InstrMap.t) =
  Hashtbl.iter
    (fun _ node ->
      match node with
      | Cfg.BasicBlock r ->
          r.instructions <- rewrite_block r.id r.instructions instr_info
      | _ -> ())
    cfg.blocks

(** Add successors of processed block to worklist, if not already present *)
let update_worklist (cfg : Cfg.graph) (id : Cfg.node_id) worklist =
  let successors = Cfg.with_basicblock cfg id (fun r -> r.successors) in
  Cfg.NodeIdSet.fold
    (fun succ wl ->
      match succ with
      | Exit -> wl
      | Entry -> failwith "malformed control-flow Cfg.graph"
      | Block _ -> Cfg.NodeIdSet.add succ wl)
    successors worklist

(** Preliminary annotation of reaching copies for each block. Sort basic blocks
    by ID, then annotate each block with the set of cumulative copy instructions
    which are assumed to have reached the end of each block. Entry and Exit
    nodes are not annotated. *)
let find_reaching_copies (cfg : Cfg.graph) (static_names : Cfg.StringSet.t) =
  let sorted_blocks = Cfg.blocks_sorted cfg.blocks in
  let all_copies = find_all_copy_instructions sorted_blocks in

  (* Preliminary annotation of all BasicBlocks with copies from all blocks and
    build a set of work items to process. *)
  let worklist = ref Cfg.NodeIdSet.empty in
  List.iter
    (fun block ->
      match block with
      | Cfg.BasicBlock r ->
          r.reaching_copies <- all_copies;
          worklist := Cfg.NodeIdSet.add (Block r.id) !worklist
      | _ -> ())
    sorted_blocks;

  let instr_info = ref Cfg.InstrMap.empty in

  (* Iteratively resolve reaching copies for each block *)
  while not (Cfg.NodeIdSet.is_empty !worklist) do
    (* Remove first block from worklist *)
    let block =
      match Cfg.NodeIdSet.min_elt !worklist with
      | Block _ as b -> b
      | _ -> failwith "worklist contains non-block node"
    in
    worklist := Cfg.NodeIdSet.remove block !worklist;

    let old_annotation =
      Cfg.with_basicblock cfg block (fun r -> r.reaching_copies)
    in

    (* Apply meet and transfer functions to block *)
    let incoming_copies = meet cfg block all_copies in
    transfer cfg block incoming_copies static_names instr_info;

    (* Update worklist *)
    if
      old_annotation
      <> Cfg.with_basicblock cfg block (fun r -> r.reaching_copies)
    then begin
      worklist := update_worklist cfg block !worklist
    end
  done;
  !instr_info

let apply (cfg : Cfg.graph) (statics : Cfg.StringSet.t) : unit =
  let reaching_copies = find_reaching_copies cfg statics in
  rewrite_cfg cfg reaching_copies
