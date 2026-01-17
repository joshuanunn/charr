(** Define control-flow graph data structures. Used in IR optimisation for copy
    propagation, unreachable code elimination and dead store elimination.*)

type node_id = Entry | Exit | Block of int

module NodeIdSet = Set.Make (struct
  type t = node_id

  let compare = compare
end)

module StringSet = Set.Make (String)

module CopySet = Set.Make (struct
  type t = Ir.instruction

  let compare = compare
end)

module InstrMap = Map.Make (struct
  type t = node_id * int (* block_id, instruction index *)

  let compare = compare
end)

type basic_block = {
  id : int;
  mutable instructions : Ir.instruction list;
  mutable predecessors : NodeIdSet.t;
  mutable successors : NodeIdSet.t;
  mutable reaching_copies : CopySet.t;
  mutable live_variables : StringSet.t;
}

type node =
  | BasicBlock of basic_block
  | EntryNode of { mutable successors : NodeIdSet.t }
  | ExitNode of { mutable predecessors : NodeIdSet.t }

type graph = {
  entry : node;
  exit : node;
  blocks : (int, node) Hashtbl.t;
  mutable counter : int; (* Counter for generating block ID *)
}

(** Create a new, empty control-flow graph *)
let make_cfg () : graph =
  let entry = EntryNode { successors = NodeIdSet.empty } in
  let exit = ExitNode { predecessors = NodeIdSet.empty } in
  let blocks = Hashtbl.create 16 in

  { entry; exit; blocks; counter = 0 }

let blocks_sorted blocks =
  Hashtbl.fold (fun id node acc -> (id, node) :: acc) blocks []
  |> List.sort (fun (a, _) (b, _) -> compare a b)
  |> List.map snd

let insert_block (cfg : graph) (ins : Ir.instruction list) : unit =
  let id = cfg.counter in
  let block =
    BasicBlock
      {
        id;
        instructions = ins;
        predecessors = NodeIdSet.empty;
        successors = NodeIdSet.empty;
        reaching_copies = CopySet.empty;
        live_variables = StringSet.empty;
      }
  in
  Hashtbl.add cfg.blocks id block;
  cfg.counter <- cfg.counter + 1;
  ()

let get_node (cfg : graph) (id : node_id) : node =
  match id with
  | Entry -> cfg.entry
  | Exit -> cfg.exit
  | Block i -> Hashtbl.find cfg.blocks i

let get_instructions = function
  | BasicBlock r -> r.instructions
  | EntryNode _ | ExitNode _ ->
      failwith "only BasicBlock nodes contain instructions"

let with_basicblock (cfg : graph) (id : node_id) f =
  match get_node cfg id with
  | BasicBlock r -> f r
  | _ -> failwith "expected BasicBlock"

let add_successor (cfg : graph) from succ =
  match get_node cfg from with
  | EntryNode r -> r.successors <- NodeIdSet.add succ r.successors
  | BasicBlock r -> r.successors <- NodeIdSet.add succ r.successors
  | ExitNode _ -> failwith "ExitNodes cannot have successors"

let add_predecessor (cfg : graph) from pred =
  match get_node cfg from with
  | ExitNode r -> r.predecessors <- NodeIdSet.add pred r.predecessors
  | BasicBlock r -> r.predecessors <- NodeIdSet.add pred r.predecessors
  | EntryNode _ -> failwith "EntryNodes cannot have predecessors"

let add_edge (cfg : graph) from_id to_id =
  add_successor cfg from_id to_id;
  add_predecessor cfg to_id from_id

let remove_successor (cfg : graph) from succ =
  match get_node cfg from with
  | EntryNode r -> r.successors <- NodeIdSet.remove succ r.successors
  | BasicBlock r -> r.successors <- NodeIdSet.remove succ r.successors
  | ExitNode _ -> failwith "ExitNodes cannot have successors"

let remove_predecessor (cfg : graph) from pred =
  match get_node cfg from with
  | ExitNode r -> r.predecessors <- NodeIdSet.remove pred r.predecessors
  | BasicBlock r -> r.predecessors <- NodeIdSet.remove pred r.predecessors
  | EntryNode _ -> failwith "EntryNodes cannot have predecessors"

(** Build a map from labels to block IDs *)
let build_label_map (cfg : graph) : (string, int) Hashtbl.t =
  let tbl = Hashtbl.create 16 in
  Hashtbl.iter
    (fun id node ->
      match node with
      | BasicBlock { instructions; _ } -> (
          match instructions with
          | Ir.Label l :: _ -> Hashtbl.add tbl l id
          | _ -> ())
      | _ -> ())
    cfg.blocks;
  tbl

let get_block_by_label (label_map : (string, int) Hashtbl.t) (label : string) :
    int =
  Hashtbl.find label_map label

let add_all_edges (cfg : graph) : unit =
  let max_id = cfg.counter - 1 in
  (* Build edge from Entry node to first block *)
  add_edge cfg Entry (Block 0);

  (* Construct lookup from instruction target Label to CFG block ID *)
  let label_map = build_label_map cfg in

  Hashtbl.iter
    (fun id node ->
      match node with
      | BasicBlock { instructions; _ } ->
          (* Get reference to current node and next (default) node. If last
          node, then next_id is Exit node *)
          let node_id = Block id in
          let next_id = if id = max_id then Exit else Block (id + 1) in
          (* To build edge, use last instruction in node to choose edges *)
          begin match List.rev instructions with
          | [] -> add_edge cfg node_id next_id
          | last_instr :: _ -> begin
              match last_instr with
              (* Return instructions always link to Exit node *)
              | Ir.Return _ -> add_edge cfg node_id Exit
              (* Unconditional Jump has only a single link *)
              | Ir.Jump { target } ->
                  let target_id = get_block_by_label label_map target in
                  add_edge cfg node_id (Block target_id)
              (* Conditional Jumps have two possible links *)
              | Ir.JumpIfZero { target; _ } | Ir.JumpIfNotZero { target; _ } ->
                  let target_id = get_block_by_label label_map target in
                  add_edge cfg node_id (Block target_id);
                  add_edge cfg node_id next_id
              (* All other instructions "fall through" to default node *)
              | _ -> add_edge cfg node_id next_id
            end
          end
      | _ -> ())
    cfg.blocks

let reachable_nodes (cfg : graph) : NodeIdSet.t =
  let visited = ref NodeIdSet.empty in

  let rec dfs id =
    if NodeIdSet.mem id !visited then ()
    else begin
      visited := NodeIdSet.add id !visited;
      match get_node cfg id with
      | EntryNode { successors } | BasicBlock { successors; _ } ->
          NodeIdSet.iter dfs successors
      | ExitNode _ -> ()
    end
  in

  (* Start with Entry *)
  dfs Entry;
  !visited

let block_is_reachable reachable id = NodeIdSet.mem (Block id) reachable

let keep_only_reachable reachable edges =
  NodeIdSet.filter (fun nid -> NodeIdSet.mem nid reachable) edges

let remove_unreachable_blocks (cfg : graph) : unit =
  let reachable = reachable_nodes cfg in

  (* Remove unreachable blocks *)
  Hashtbl.filter_map_inplace
    (fun id node -> if block_is_reachable reachable id then Some node else None)
    cfg.blocks;

  (* Update edges *)
  Hashtbl.iter
    (fun _ node ->
      match node with
      | BasicBlock r ->
          r.predecessors <- keep_only_reachable reachable r.predecessors;
          r.successors <- keep_only_reachable reachable r.successors
      | EntryNode r ->
          r.successors <- keep_only_reachable reachable r.successors
      | ExitNode _ -> ())
    cfg.blocks;

  (* Finally clean up edges on ExitNode *)
  match cfg.exit with
  | ExitNode r -> r.predecessors <- keep_only_reachable reachable r.predecessors
  | _ -> ()

let is_jump = function
  | Ir.Jump _ | Ir.JumpIfZero _ | Ir.JumpIfNotZero _ -> true
  | _ -> false

let remove_leading_label instrs =
  match instrs with Ir.Label _ :: rest -> rest | _ -> instrs

let remove_last_instruction instrs =
  match List.rev instrs with _ :: rest_rev -> List.rev rest_rev | [] -> []

let pairwise lst =
  let rec aux acc = function
    | x :: (y :: _ as tl) -> aux ((x, y) :: acc) tl
    | _ -> List.rev acc
  in
  aux [] lst

(** Remove redundant jump instructions. Any conditional or unconditional jump
    instructions at the end of a basic block, which target the (default) next
    block can be removed as these have no effect. Any associated redundant
    labels will be removed in the next step.*)
let remove_redundant_jumps (cfg : graph) : unit =
  List.iter
    (fun (block, next_block) ->
      match (block, next_block) with
      | BasicBlock r, BasicBlock r_next -> (
          match List.rev r.instructions with
          | last :: _ when is_jump last ->
              let default_succ = Block r_next.id in
              let keep_jump =
                NodeIdSet.exists (fun succ -> succ <> default_succ) r.successors
              in
              if not keep_jump then
                r.instructions <- remove_last_instruction r.instructions
          | _ -> ())
      | _ -> ())
    (pairwise (blocks_sorted cfg.blocks))

let has_exact_predecessor preds p =
  NodeIdSet.cardinal preds = 1 && NodeIdSet.mem p preds

(** Remove redundant labels. Sort basic blocks by ID, then delete any Label
    instruction at the start of a block if it's only entered by "falling
    through" from the previous block, rather than via an explicit jump. The
    Label at the start of sorted_blocks[i] can be deleted if its only
    predecessor is sorted_blocks[i - 1]. The Label at the start of
    sorted_blocks[0] is deleted if its only predecessor is Entry.*)
let remove_redundant_labels (cfg : graph) : unit =
  let sorted_blocks = blocks_sorted cfg.blocks in

  (* Handle first block *)
  (match sorted_blocks with
  | BasicBlock r :: _ ->
      if has_exact_predecessor r.predecessors Entry then
        r.instructions <- remove_leading_label r.instructions
  | _ -> ());

  (* Handle remaining blocks *)
  List.iter
    (fun (prev_block, block) ->
      match (prev_block, block) with
      | BasicBlock r_prev, BasicBlock r ->
          if has_exact_predecessor r.predecessors (Block r_prev.id) then
            r.instructions <- remove_leading_label r.instructions
      | _ -> ())
    (pairwise sorted_blocks)

let is_empty_block = function
  | BasicBlock { instructions = []; _ } -> true
  | _ -> false

let empty_blocks (cfg : graph) : NodeIdSet.t =
  Hashtbl.fold
    (fun id node acc ->
      if is_empty_block node then NodeIdSet.add (Block id) acc else acc)
    cfg.blocks NodeIdSet.empty

let splice_out_block (cfg : graph) (id : node_id) =
  (* Get the predecessors and successors of the block being removed *)
  let predecessors, successors =
    with_basicblock cfg id (fun r -> (r.predecessors, r.successors))
  in

  (* Rewire CFG to skip over this block *)
  NodeIdSet.iter (fun pred -> remove_successor cfg pred id) predecessors;
  NodeIdSet.iter (fun succ -> remove_predecessor cfg succ id) successors;

  (* Add edges between the removed blocks successors and predecessors *)
  NodeIdSet.iter
    (fun pred -> NodeIdSet.iter (fun succ -> add_edge cfg pred succ) successors)
    predecessors

(** Remove any empty blocks *)
let remove_empty_blocks (cfg : graph) : unit =
  (* Identify empty block nodes *)
  let empties = empty_blocks cfg in
  (* Update edges to route around empty block nodes *)
  NodeIdSet.iter
    (function Block id -> splice_out_block cfg (Block id) | _ -> ())
    empties;
  (* Finally, remove the empty block nodes *)
  Hashtbl.filter_map_inplace
    (fun id node ->
      if NodeIdSet.mem (Block id) empties then None else Some node)
    cfg.blocks

let get_block_copies (n : node) : CopySet.t =
  match n with
  | BasicBlock r ->
      List.fold_left
        (fun acc instr ->
          match instr with Ir.Copy _ -> CopySet.add instr acc | _ -> acc)
        CopySet.empty r.instructions
  | EntryNode _ | ExitNode _ -> CopySet.empty

(** Construct a preliminary set of all copy instructions across all blocks. *)
let find_all_copy_instructions (blocks : node list) : CopySet.t =
  List.fold_left
    (fun acc block ->
      match block with
      | BasicBlock _ -> CopySet.union acc (get_block_copies block)
      | _ -> acc)
    CopySet.empty blocks

(** Meet operator for reaching copies analysis. Computes the set of copy
    instructions that reach the beginning of a basic block by taking the
    intersection of the reaching copies at the end of all predecessor blocks. If
    the block has Entry as a predecessor, the result is the empty set. *)
let meet (cfg : graph) (id : node_id) (all_copies : CopySet.t) =
  let predecessors = with_basicblock cfg id (fun r -> r.predecessors) in

  (* If Entry is a predecessor, the meet is empty *)
  if NodeIdSet.mem Entry predecessors then CopySet.empty
  else
    NodeIdSet.fold
      (fun pred_id incoming_copies ->
        match pred_id with
        | Block _ ->
            let pred_out_copies =
              with_basicblock cfg pred_id (fun r -> r.reaching_copies)
            in
            CopySet.inter incoming_copies pred_out_copies
        | Entry -> failwith "already handled Entry case"
        | Exit -> failwith "malformed control-flow graph")
      predecessors all_copies

(** Meet operator for liveness analysis. Calculates if variables are live at the
    end of a basic block, by looking backwards and taking the union of live
    variables present at the start of all successor blocks. It is assumed that
    all_copies static variables are live at the Exit node. *)
let meet_live (cfg : graph) (id : node_id) (all_static_vars : StringSet.t) =
  let successors = with_basicblock cfg id (fun r -> r.successors) in

  NodeIdSet.fold
    (fun succ_id acc ->
      match succ_id with
      | Entry -> failwith "malformed control-flow graph"
      | Block _ ->
          let live_vars =
            with_basicblock cfg succ_id (fun r -> r.live_variables)
          in
          StringSet.union acc live_vars
      | Exit -> StringSet.union acc all_static_vars)
    successors StringSet.empty

(** Special case where x = y reaches y = x, which has no effect. *)
let is_inverse_copy instr copies =
  match instr with
  | Ir.Copy { src; dst } ->
      CopySet.mem (Ir.Copy { src = dst; dst = src }) copies
  | _ -> false

(** Kill any copies to or from x, following x = y. *)
let kill_copy_dest dst copies =
  CopySet.filter
    (fun c ->
      match c with
      | Ir.Copy { src; dst = d } -> src <> dst && d <> dst
      | _ -> true)
    copies

(** Kill any live variables which are written to. *)
let kill_live_dest dst live_vars =
  match dst with Ir.Var n -> StringSet.remove n live_vars | _ -> live_vars

(** Add live variables. *)
let add_live_var src live_vars =
  match src with Ir.Var n -> StringSet.add n live_vars | _ -> live_vars

(** Check if variable is static. *)
let is_static (value : Ir.value) (static_names : StringSet.t) : bool =
  match value with Ir.Var name -> StringSet.mem name static_names | _ -> false

(** Kill copies to or from variables with static storage duration or any copies
    to or from the destination of the result from the function call. *)
let kill_for_fun_call dst static_names copies =
  CopySet.filter
    (fun c ->
      match c with
      | Ir.Copy { src; dst = d } ->
          not
            (is_static src static_names || is_static d static_names || src = dst
           || d = dst)
      | _ -> true)
    copies

(** Transfer function for reaching copies analysis. Given the set of copies that
    reach the beginning of a basic block, iterates over the block’s
    instructions, annotating each instruction with the copies that reach just
    before it and updating the current reaching copies. At the end of the block,
    records the set of copies that reach the block’s exit. *)
let transfer (cfg : graph) (id : node_id) initial_reaching_copies static_names
    instr_info =
  let current_reaching_copies = ref initial_reaching_copies in
  let block_instructions = with_basicblock cfg id (fun r -> r.instructions) in

  List.iteri
    (fun idx instruction ->
      (* Annotate instruction with all reaching copies to just before instruction *)
      instr_info := InstrMap.add (id, idx) !current_reaching_copies !instr_info;

      (* Update reaching copies *)
      match instruction with
      | Ir.Copy { dst; _ } ->
          if not (is_inverse_copy instruction !current_reaching_copies) then begin
            current_reaching_copies :=
              !current_reaching_copies |> kill_copy_dest dst
              |> CopySet.add instruction
          end
      | Ir.FunCall { dst; _ } ->
          current_reaching_copies :=
            kill_for_fun_call dst static_names !current_reaching_copies
      | Ir.Unary { dst; _ } | Ir.Binary { dst; _ } ->
          current_reaching_copies := kill_copy_dest dst !current_reaching_copies
      | _ -> ())
    block_instructions;

  (* Finally, update block (end) reaching copies with surviving copies *)
  with_basicblock cfg id (fun r ->
      r.reaching_copies <- !current_reaching_copies)

(** Transfer function for liveness analysis. Given the set of variables that are
    live at the end of a basic block, iterates over the block’s instructions in
    reverse order, annotating each instruction with the set of variables that
    are live immediately after it executes. As each instruction is processed,
    the current live-variable set is updated by killing variables written by the
    instruction and generating variables read by it. Function calls are treated
    conservatively by marking all static variables as live. At the end of the
    block, records the set of variables that are live at the block’s entry. *)
let transfer_live (cfg : graph) (id : node_id) end_live_variables static_names
    instr_info =
  let live_variables = ref end_live_variables in
  let block_instructions = with_basicblock cfg id (fun r -> r.instructions) in
  let len = List.length block_instructions in
  List.iteri
    (fun rev_idx instruction ->
      (* Annotate instruction with all live variables to just after instruction *)
      let idx = len - 1 - rev_idx in
      instr_info := InstrMap.add (id, idx) !live_variables !instr_info;

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
          live_variables := StringSet.union static_names !live_variables
      | Ir.Jump _ | Ir.Label _ -> ())
    (List.rev block_instructions);

  (* Finally, update block (start) live variables *)
  with_basicblock cfg id (fun r -> r.live_variables <- !live_variables)

(** Add successors of processed block to worklist, if not already present *)
let update_worklist (cfg : graph) (id : node_id) worklist =
  let successors = with_basicblock cfg id (fun r -> r.successors) in
  NodeIdSet.fold
    (fun succ wl ->
      match succ with
      | Exit -> wl
      | Entry -> failwith "malformed control-flow graph"
      | Block _ -> NodeIdSet.add succ wl)
    successors worklist

(** Add predecessors of processed block to worklist, if not already present *)
let update_worklist_backward (cfg : graph) (id : node_id) worklist =
  let predecessors = with_basicblock cfg id (fun r -> r.predecessors) in
  NodeIdSet.fold
    (fun pred wl ->
      match pred with
      | Exit -> failwith "malformed control-flow graph"
      | Entry -> wl
      | Block _ -> NodeIdSet.add pred wl)
    predecessors worklist

(** Preliminary annotation of reaching copies for each block. Sort basic blocks
    by ID, then annotate each block with the set of cumulative copy instructions
    which are assumed to have reached the end of each block. Entry and Exit
    nodes are not annotated. *)
let find_reaching_copies (cfg : graph) (static_names : StringSet.t) =
  let sorted_blocks = blocks_sorted cfg.blocks in
  let all_copies = find_all_copy_instructions sorted_blocks in

  (* Preliminary annotation of all BasicBlocks with copies from all blocks and
  build a set of work items to process. *)
  let worklist = ref NodeIdSet.empty in
  List.iter
    (fun block ->
      match block with
      | BasicBlock r ->
          r.reaching_copies <- all_copies;
          worklist := NodeIdSet.add (Block r.id) !worklist
      | _ -> ())
    sorted_blocks;

  let instr_info = ref InstrMap.empty in

  (* Iteratively resolve reaching copies for each block *)
  while not (NodeIdSet.is_empty !worklist) do
    (* Remove first block from worklist *)
    let block =
      match NodeIdSet.min_elt !worklist with
      | Block _ as b -> b
      | _ -> failwith "worklist contains non-block node"
    in
    worklist := NodeIdSet.remove block !worklist;

    let old_annotation =
      with_basicblock cfg block (fun r -> r.reaching_copies)
    in

    (* Apply meet and transfer functions to block *)
    let incoming_copies = meet cfg block all_copies in
    transfer cfg block incoming_copies static_names instr_info;

    (* Update worklist *)
    if old_annotation <> with_basicblock cfg block (fun r -> r.reaching_copies)
    then begin
      worklist := update_worklist cfg block !worklist
    end
  done;
  !instr_info

(** Replace a value operand using reaching copies information. If the operand is
    a variable and there exists a reaching copy that assigns to it, the operand
    is replaced with the copy’s source. Constants and operands without a
    defining reaching copy are returned unchanged. *)
let replace_operand (op : Ir.value) (copies : CopySet.t) : Ir.value =
  match op with
  | Ir.Constant _ -> op
  | Ir.Var _ -> (
      match
        CopySet.find_first_opt
          (function Ir.Copy { dst; _ } when dst = op -> true | _ -> false)
          copies
      with
      | Some (Ir.Copy { src; _ }) -> src
      | _ -> op)

(** Rewrite a single IR instruction using the set of reaching copies that apply
    immediately before it. Source operands are replaced where possible using
    copy propagation. Redundant Copy instructions whose effect is already
    guaranteed by reaching copies are removed by returning None. *)
let rewrite_instruction (instr : Ir.instruction) (copies : CopySet.t) :
    Ir.instruction option =
  match instr with
  | Ir.Copy { src; dst } ->
      let redundant =
        CopySet.exists
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

let rewrite_block (block_id : int) (instrs : Ir.instruction list)
    (instr_info : CopySet.t InstrMap.t) : Ir.instruction list =
  instrs
  |> List.mapi (fun idx instr ->
      let copies = InstrMap.find (Block block_id, idx) instr_info in
      rewrite_instruction instr copies)
  |> List.filter_map Fun.id

(** Rewrite all basic blocks in a control-flow graph using instruction-level
    reaching copies information. Each instruction is rewritten or removed
    according to copy propagation rules, and the instructions within each basic
    block are updated in place. *)
let rewrite_cfg (cfg : graph) (instr_info : CopySet.t InstrMap.t) =
  Hashtbl.iter
    (fun _ node ->
      match node with
      | BasicBlock r ->
          r.instructions <- rewrite_block r.id r.instructions instr_info
      | _ -> ())
    cfg.blocks

let is_dead_store instr live_variables =
  match instr with
  | Ir.FunCall _ -> false
  | Ir.Copy { dst; _ } | Ir.Unary { dst; _ } | Ir.Binary { dst; _ } -> (
      match dst with
      | Ir.Var n -> not (StringSet.mem n live_variables)
      | _ -> false)
  | _ -> false

let rewrite_block_live (block_id : int) (instrs : Ir.instruction list)
    (instr_info : StringSet.t InstrMap.t) : Ir.instruction list =
  instrs
  |> List.mapi (fun idx instr ->
      let live_vars = InstrMap.find (Block block_id, idx) instr_info in
      match is_dead_store instr live_vars with
      | true -> None
      | false -> Some instr)
  |> List.filter_map Fun.id

(** Rewrite all basic blocks in a control-flow graph using instruction-level
    liveness analysis information. Instructions representing dead stores are
    removed, and the instructions within each basic block updated in place. *)
let rewrite_cfg_live (cfg : graph) (instr_info : StringSet.t InstrMap.t) =
  Hashtbl.iter
    (fun _ node ->
      match node with
      | BasicBlock r ->
          r.instructions <- rewrite_block_live r.id r.instructions instr_info
      | _ -> ())
    cfg.blocks

let remove_dead_stores (cfg : graph) (static_names : StringSet.t) =
  (* Annotate all BasicBlocks with empty set to create work items to process. *)
  let worklist = ref NodeIdSet.empty in
  List.iter
    (fun block ->
      match block with
      | BasicBlock r ->
          r.live_variables <- StringSet.empty;
          worklist := NodeIdSet.add (Block r.id) !worklist
      | _ -> ())
    (blocks_sorted cfg.blocks);

  let instr_info = ref InstrMap.empty in

  (* Iteratively resolve liveness analysis for each block *)
  while not (NodeIdSet.is_empty !worklist) do
    (* Remove first block from worklist *)
    let block =
      match NodeIdSet.min_elt !worklist with
      | Block _ as b -> b
      | _ -> failwith "worklist contains non-block node"
    in
    worklist := NodeIdSet.remove block !worklist;

    let old_annotation =
      with_basicblock cfg block (fun r -> r.live_variables)
    in

    (* Apply meet and transfer functions to block *)
    let incoming_vars = meet_live cfg block static_names in
    transfer_live cfg block incoming_vars static_names instr_info;

    (* Update worklist *)
    if old_annotation <> with_basicblock cfg block (fun r -> r.live_variables)
    then begin
      worklist := update_worklist_backward cfg block !worklist
    end
  done;
  !instr_info

let string_of_node_id = function
  | Entry -> "ENTRY"
  | Exit -> "EXIT"
  | Block i -> "B" ^ string_of_int i

let pp_instruction_line fmt ins =
  Format.fprintf fmt "    %s\n" (Ir.show_instruction ins)

let pp_copyset fmt copies =
  CopySet.elements copies |> List.iter (pp_instruction_line fmt)

let pp_node fmt = function
  | EntryNode { successors } ->
      Format.fprintf fmt "EntryNode\n";
      Format.fprintf fmt "  successors: [%s]\n\n"
        (NodeIdSet.elements successors
        |> List.map string_of_node_id |> String.concat ", ")
  | ExitNode { predecessors } ->
      Format.fprintf fmt "ExitNode\n";
      Format.fprintf fmt "  predecessors: [%s]\n"
        (NodeIdSet.elements predecessors
        |> List.map string_of_node_id |> String.concat ", ")
  | BasicBlock
      { id; instructions; predecessors; successors; reaching_copies; _ } ->
      Format.fprintf fmt "BasicBlock B%d\n" id;
      Format.fprintf fmt "  instructions:\n";
      List.iter (pp_instruction_line fmt) instructions;
      Format.fprintf fmt "  predecessors: [%s]\n"
        (NodeIdSet.elements predecessors
        |> List.map string_of_node_id |> String.concat ", ");
      Format.fprintf fmt "  successors: [%s]\n"
        (NodeIdSet.elements successors
        |> List.map string_of_node_id |> String.concat ", ");
      Format.fprintf fmt "  reaching_copies:\n";
      pp_copyset fmt reaching_copies

let pp_graph fmt { entry; exit; blocks; counter } =
  Format.fprintf fmt "=== CFG ===\n";
  pp_node fmt entry;

  List.iter
    (fun node ->
      pp_node fmt node;
      Format.fprintf fmt "\n")
    (blocks_sorted blocks);

  pp_node fmt exit;

  Format.fprintf fmt "\ncounter = %d\n" counter

let show_graph g = Format.asprintf "%a" pp_graph g
