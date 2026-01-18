let reachable_nodes (cfg : Cfg.graph) : Cfg.NodeIdSet.t =
  let visited = ref Cfg.NodeIdSet.empty in

  let rec dfs id =
    if Cfg.NodeIdSet.mem id !visited then ()
    else begin
      visited := Cfg.NodeIdSet.add id !visited;
      match Cfg.get_node cfg id with
      | Cfg.EntryNode { successors } | Cfg.BasicBlock { successors; _ } ->
          Cfg.NodeIdSet.iter dfs successors
      | Cfg.ExitNode _ -> ()
    end
  in

  (* Start with Entry *)
  dfs Cfg.Entry;
  !visited

let block_is_reachable reachable id = Cfg.NodeIdSet.mem (Cfg.Block id) reachable

let keep_only_reachable reachable edges =
  Cfg.NodeIdSet.filter (fun nid -> Cfg.NodeIdSet.mem nid reachable) edges

let remove_unreachable_blocks (cfg : Cfg.graph) : unit =
  let reachable = reachable_nodes cfg in

  (* Remove unreachable blocks *)
  Hashtbl.filter_map_inplace
    (fun id node -> if block_is_reachable reachable id then Some node else None)
    cfg.blocks;

  (* Update edges *)
  Hashtbl.iter
    (fun _ node ->
      match node with
      | Cfg.BasicBlock r ->
          r.predecessors <- keep_only_reachable reachable r.predecessors;
          r.successors <- keep_only_reachable reachable r.successors
      | Cfg.EntryNode r ->
          r.successors <- keep_only_reachable reachable r.successors
      | Cfg.ExitNode _ -> ())
    cfg.blocks;

  (* Finally clean up edges on ExitNode *)
  match cfg.exit with
  | Cfg.ExitNode r ->
      r.predecessors <- keep_only_reachable reachable r.predecessors
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
let remove_redundant_jumps (cfg : Cfg.graph) : unit =
  List.iter
    (fun (block, next_block) ->
      match (block, next_block) with
      | Cfg.BasicBlock r, Cfg.BasicBlock r_next -> (
          match List.rev r.instructions with
          | last :: _ when is_jump last ->
              let default_succ = Cfg.Block r_next.id in
              let keep_jump =
                Cfg.NodeIdSet.exists
                  (fun succ -> succ <> default_succ)
                  r.successors
              in
              if not keep_jump then
                r.instructions <- remove_last_instruction r.instructions
          | _ -> ())
      | _ -> ())
    (pairwise (Cfg.blocks_sorted cfg.blocks))

let has_exact_predecessor preds p =
  Cfg.NodeIdSet.cardinal preds = 1 && Cfg.NodeIdSet.mem p preds

(** Remove redundant labels. Sort basic blocks by ID, then delete any Label
    instruction at the start of a block if it's only entered by "falling
    through" from the previous block, rather than via an explicit jump. The
    Label at the start of sorted_blocks[i] can be deleted if its only
    predecessor is sorted_blocks[i - 1]. The Label at the start of
    sorted_blocks[0] is deleted if its only predecessor is Entry.*)
let remove_redundant_labels (cfg : Cfg.graph) : unit =
  let sorted_blocks = Cfg.blocks_sorted cfg.blocks in

  (* Handle first block *)
  (match sorted_blocks with
  | Cfg.BasicBlock r :: _ ->
      if has_exact_predecessor r.predecessors Cfg.Entry then
        r.instructions <- remove_leading_label r.instructions
  | _ -> ());

  (* Handle remaining blocks *)
  List.iter
    (fun (prev_block, block) ->
      match (prev_block, block) with
      | Cfg.BasicBlock r_prev, Cfg.BasicBlock r ->
          if has_exact_predecessor r.predecessors (Cfg.Block r_prev.id) then
            r.instructions <- remove_leading_label r.instructions
      | _ -> ())
    (pairwise sorted_blocks)

let is_empty_block = function
  | Cfg.BasicBlock { instructions = []; _ } -> true
  | _ -> false

let empty_blocks (cfg : Cfg.graph) : Cfg.NodeIdSet.t =
  Hashtbl.fold
    (fun id node acc ->
      if is_empty_block node then Cfg.NodeIdSet.add (Cfg.Block id) acc else acc)
    cfg.blocks Cfg.NodeIdSet.empty

let splice_out_block (cfg : Cfg.graph) (id : Cfg.node_id) =
  (* Get the predecessors and successors of the block being removed *)
  let predecessors, successors =
    Cfg.with_basicblock cfg id (fun r -> (r.predecessors, r.successors))
  in

  (* Rewire CFG to skip over this block *)
  Cfg.NodeIdSet.iter (fun pred -> Cfg.remove_successor cfg pred id) predecessors;
  Cfg.NodeIdSet.iter (fun succ -> Cfg.remove_predecessor cfg succ id) successors;

  (* Add edges between the removed blocks successors and predecessors *)
  Cfg.NodeIdSet.iter
    (fun pred ->
      Cfg.NodeIdSet.iter (fun succ -> Cfg.add_edge cfg pred succ) successors)
    predecessors

(** Remove any empty blocks *)
let remove_empty_blocks (cfg : Cfg.graph) : unit =
  (* Identify empty block nodes *)
  let empties = empty_blocks cfg in
  (* Update edges to route around empty block nodes *)
  Cfg.NodeIdSet.iter
    (function Cfg.Block id -> splice_out_block cfg (Cfg.Block id) | _ -> ())
    empties;
  (* Finally, remove the empty block nodes *)
  Hashtbl.filter_map_inplace
    (fun id node ->
      if Cfg.NodeIdSet.mem (Cfg.Block id) empties then None else Some node)
    cfg.blocks

let apply (cfg : Cfg.graph) : unit =
  remove_unreachable_blocks cfg;
  remove_redundant_jumps cfg;
  remove_redundant_labels cfg;
  remove_empty_blocks cfg
