(** Kill any live variables which are written to. *)
let kill_live_dest dst live_vars =
  match dst with Ir.Var n -> Cfg.StringSet.remove n live_vars | _ -> live_vars

(** Add live variables. *)
let add_live_var src live_vars =
  match src with Ir.Var n -> Cfg.StringSet.add n live_vars | _ -> live_vars

(** Meet operator for liveness analysis. Calculates if variables are live at the
    end of a basic block, by looking backwards and taking the union of live
    variables present at the start of all successor blocks. It is assumed that
    all_copies static variables are live at the Exit node. *)
let meet (cfg : Cfg.graph) (id : Cfg.node_id)
    (all_static_vars : Cfg.StringSet.t) =
  let successors = Cfg.with_basicblock cfg id (fun r -> r.successors) in

  Cfg.NodeIdSet.fold
    (fun succ_id acc ->
      match succ_id with
      | Cfg.Entry -> failwith "malformed control-flow graph"
      | Cfg.Block _ ->
          let live_vars =
            Cfg.with_basicblock cfg succ_id (fun r -> r.live_variables)
          in
          Cfg.StringSet.union acc live_vars
      | Cfg.Exit -> Cfg.StringSet.union acc all_static_vars)
    successors Cfg.StringSet.empty

(** Transfer function for liveness analysis. Given the set of variables that are
    live at the end of a basic block, iterates over the block’s instructions in
    reverse order, annotating each instruction with the set of variables that
    are live immediately after it executes. As each instruction is processed,
    the current live-variable set is updated by killing variables written by the
    instruction and generating variables read by it. Function calls are treated
    conservatively by marking all static variables as live. At the end of the
    block, records the set of variables that are live at the block’s entry. *)
let transfer (cfg : Cfg.graph) (id : Cfg.node_id) end_live_variables
    static_names instr_info =
  let live_variables = ref end_live_variables in
  let block_instructions =
    Cfg.with_basicblock cfg id (fun r -> r.instructions)
  in
  let len = List.length block_instructions in
  List.iteri
    (fun rev_idx instruction ->
      (* Annotate instruction with all live variables to just after instruction *)
      let idx = len - 1 - rev_idx in
      instr_info := Cfg.InstrMap.add (id, idx) !live_variables !instr_info;

      (* Update live variables *)
      match instruction with
      | Ir.Binary { src1; src2; dst; _ } ->
          live_variables := kill_live_dest dst !live_variables;
          live_variables := add_live_var src1 !live_variables;
          live_variables := add_live_var src2 !live_variables
      | Ir.Unary { src; dst; _ } ->
          live_variables := kill_live_dest dst !live_variables;
          live_variables := add_live_var src !live_variables
      | Ir.Return value -> live_variables := add_live_var value !live_variables
      | Ir.Copy { src; dst } ->
          live_variables := kill_live_dest dst !live_variables;
          live_variables := add_live_var src !live_variables
      | Ir.JumpIfZero { condition; _ } ->
          live_variables := add_live_var condition !live_variables
      | Ir.JumpIfNotZero { condition; _ } ->
          live_variables := add_live_var condition !live_variables
      | Ir.FunCall { args; dst; _ } ->
          live_variables := kill_live_dest dst !live_variables;
          List.iter
            (fun v -> live_variables := add_live_var v !live_variables)
            args;
          live_variables := Cfg.StringSet.union static_names !live_variables
      | Ir.SignExtend { src; dst } ->
          live_variables := kill_live_dest dst !live_variables;
          live_variables := add_live_var src !live_variables
      | Ir.Truncate { src; dst } ->
          live_variables := kill_live_dest dst !live_variables;
          live_variables := add_live_var src !live_variables
      | Ir.Jump _ | Ir.Label _ -> ())
    (List.rev block_instructions);

  (* Finally, update block (start) live variables *)
  Cfg.with_basicblock cfg id (fun r -> r.live_variables <- !live_variables)

let is_dead_store instr live_variables =
  match instr with
  | Ir.FunCall _ -> false
  | Ir.Copy { dst; _ }
  | Ir.Unary { dst; _ }
  | Ir.Binary { dst; _ }
  | Ir.SignExtend { dst; _ }
  | Ir.Truncate { dst; _ } -> (
      match dst with
      | Ir.Var n -> not (Cfg.StringSet.mem n live_variables)
      | _ -> false)
  | _ -> false

let rewrite_block (block_id : int) (instrs : Ir.instruction list)
    (instr_info : Cfg.StringSet.t Cfg.InstrMap.t) : Ir.instruction list =
  instrs
  |> List.mapi (fun idx instr ->
      let live_vars = Cfg.InstrMap.find (Cfg.Block block_id, idx) instr_info in
      match is_dead_store instr live_vars with
      | true -> None
      | false -> Some instr)
  |> List.filter_map Fun.id

(** Rewrite all basic blocks in a control-flow graph using instruction-level
    liveness analysis information. Instructions representing dead stores are
    removed, and the instructions within each basic block updated in place. *)
let rewrite_cfg (cfg : Cfg.graph) (instr_info : Cfg.StringSet.t Cfg.InstrMap.t)
    =
  Hashtbl.iter
    (fun _ node ->
      match node with
      | Cfg.BasicBlock r ->
          r.instructions <- rewrite_block r.id r.instructions instr_info
      | _ -> ())
    cfg.blocks

(** Add predecessors of processed block to worklist, if not already present *)
let update_worklist (cfg : Cfg.graph) (id : Cfg.node_id) worklist =
  let predecessors = Cfg.with_basicblock cfg id (fun r -> r.predecessors) in
  Cfg.NodeIdSet.fold
    (fun pred wl ->
      match pred with
      | Cfg.Exit -> failwith "malformed control-flow graph"
      | Cfg.Entry -> wl
      | Cfg.Block _ -> Cfg.NodeIdSet.add pred wl)
    predecessors worklist

let remove_dead_stores (cfg : Cfg.graph) (static_names : Cfg.StringSet.t) =
  (* Annotate all BasicBlocks with empty set to create work items to process. *)
  let worklist = ref Cfg.NodeIdSet.empty in
  List.iter
    (fun block ->
      match block with
      | Cfg.BasicBlock r ->
          r.live_variables <- Cfg.StringSet.empty;
          worklist := Cfg.NodeIdSet.add (Block r.id) !worklist
      | _ -> ())
    (Cfg.blocks_sorted cfg.blocks);

  let instr_info = ref Cfg.InstrMap.empty in

  (* Iteratively resolve liveness analysis for each block *)
  while not (Cfg.NodeIdSet.is_empty !worklist) do
    (* Remove first block from worklist *)
    let block =
      match Cfg.NodeIdSet.min_elt !worklist with
      | Block _ as b -> b
      | _ -> failwith "worklist contains non-block node"
    in
    worklist := Cfg.NodeIdSet.remove block !worklist;

    let old_annotation =
      Cfg.with_basicblock cfg block (fun r -> r.live_variables)
    in

    (* Apply meet and transfer functions to block *)
    let incoming_vars = meet cfg block static_names in
    transfer cfg block incoming_vars static_names instr_info;

    (* Update worklist *)
    if
      not
        (Cfg.StringSet.equal old_annotation
           (Cfg.with_basicblock cfg block (fun r -> r.live_variables)))
    then begin
      worklist := update_worklist cfg block !worklist
    end
  done;
  !instr_info

let apply (cfg : Cfg.graph) (statics : Cfg.StringSet.t) : unit =
  let live_variables = remove_dead_stores cfg statics in
  rewrite_cfg cfg live_variables
