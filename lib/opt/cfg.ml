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

let string_of_node_id = function
  | Entry -> "ENTRY"
  | Exit -> "EXIT"
  | Block i -> "B" ^ string_of_int i

let pp_instruction_line fmt ins =
  Format.fprintf fmt "    %s\n" (Ir.show_instruction ins)

let pp_copyset fmt copies =
  CopySet.elements copies |> List.iter (pp_instruction_line fmt)

let pp_stringset fmt set =
  StringSet.elements set |> List.sort String.compare |> String.concat ", "
  |> Format.fprintf fmt "[%s]"

let pp_nodeidset fmt set =
  NodeIdSet.elements set |> List.map string_of_node_id |> String.concat ", "
  |> Format.fprintf fmt "[%s]"

let pp_node fmt = function
  | EntryNode { successors } ->
      Format.fprintf fmt "EntryNode\n";
      Format.fprintf fmt "  successors: ";
      pp_nodeidset fmt successors;
      Format.fprintf fmt "\n\n"
  | ExitNode { predecessors } ->
      Format.fprintf fmt "ExitNode\n";
      Format.fprintf fmt "  predecessors: ";
      pp_nodeidset fmt predecessors;
      Format.fprintf fmt "\n"
  | BasicBlock
      {
        id;
        instructions;
        predecessors;
        successors;
        reaching_copies;
        live_variables;
      } ->
      Format.fprintf fmt "BasicBlock B%d\n" id;

      Format.fprintf fmt "  instructions:\n";
      List.iter (pp_instruction_line fmt) instructions;

      Format.fprintf fmt "  predecessors: ";
      pp_nodeidset fmt predecessors;
      Format.fprintf fmt "\n";

      Format.fprintf fmt "  successors: ";
      pp_nodeidset fmt successors;
      Format.fprintf fmt "\n";

      Format.fprintf fmt "  reaching_copies:\n";
      pp_copyset fmt reaching_copies;

      Format.fprintf fmt "  live_variables: ";
      pp_stringset fmt live_variables;
      Format.fprintf fmt "\n"

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
