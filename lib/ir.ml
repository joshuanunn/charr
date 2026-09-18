type unary_operator =
  | Negate
  | BwNot
  | Not
  | PreIncrement
  | PreDecrement
  | PostIncrement
  | PostDecrement
[@@deriving show]

type binary_operator =
  | Add
  | Subtract
  | Multiply
  | Divide
  | Remainder
  | BwLeftShift
  | BwRightShift
  | BwAnd
  | BwXor
  | BwOr
  | Equal
  | NotEqual
  | LessOrEqual
  | GreaterOrEqual
  | LessThan
  | GreaterThan
[@@deriving show]

type value = Constant of Ctype.const | Var of string [@@deriving show]

type instruction =
  | Return of value
  | SignExtend of { src : value; dst : value }
  | Truncate of { src : value; dst : value }
  | ZeroExtend of { src : value; dst : value }
  | Unary of { op : unary_operator; src : value; dst : value }
  | Binary of { op : binary_operator; src1 : value; src2 : value; dst : value }
  | Copy of { src : value; dst : value }
  | Jump of { target : string }
  | JumpIfZero of { condition : value; target : string }
  | JumpIfNotZero of { condition : value; target : string }
  | Label of string
  | FunCall of { fun_name : string; args : value list; dst : value }
[@@deriving show]

module Frame = struct
  (** Tracks stack offsets for IR-level temporary values and declared variables.
      Used during IR generation and code lowering to assign concrete stack
      slots. *)

  type t = {
    namespace : string;  (** Allow unique global labels using a namespace *)
    mutable counter : int;  (** Counter for generating unique names *)
    mutable offset : int;  (** Current top-of-stack offset *)
    stack_offsets : (string, int) Hashtbl.t;
        (** Map from variable names to stack offsets *)
  }

  let pp fmt (f : t) =
    (* Convert and sort entries by offset *)
    let entries =
      Hashtbl.fold
        (fun name offset acc -> (offset, name) :: acc)
        f.stack_offsets []
      |> List.sort (fun (o1, _) (o2, _) -> compare o2 o1)
    in
    let max_name_len =
      List.fold_left (fun m (_, name) -> max m (String.length name)) 0 entries
    in
    Format.fprintf fmt "@[<v>";
    Format.fprintf fmt "Frame.t {@;<2 2>@[<v>";
    Format.fprintf fmt "namespace = \"%s\";@," f.namespace;
    Format.fprintf fmt "counter = %d;@," f.counter;
    Format.fprintf fmt "offset = %d;@," f.offset;
    Format.fprintf fmt "@[<v>stack slots = {@,";
    List.iter
      (fun (offset, name) ->
        Format.fprintf fmt "  %-*s -> %d,@," max_name_len name offset)
      entries;
    Format.fprintf fmt "}}@]";
    Format.fprintf fmt "@]";
    Format.fprintf fmt "@]" (* close outer box *)

  (** Pretty printer for t, as not fully supported by ppx_deriving show. *)
  let show_frame f = Format.asprintf "%a" pp f

  let make namespace =
    { namespace; counter = 0; offset = 0; stack_offsets = Hashtbl.create 16 }

  (** Declare a new temporary value in a Frame.t. Generate a name unique within
      the translation unit with function namespace and internal counter. *)
  let declare_tmp f =
    let fid = f.namespace ^ ".tmp." ^ string_of_int f.counter in
    f.counter <- f.counter + 1;
    fid

  (** Declare a unique label name for control-flow constructs. As labels are
      global in the final assembly code, labels must be namespaced by function.
  *)
  let declare_label f name =
    let eid = f.namespace ^ "." ^ name ^ "." ^ string_of_int f.counter in
    f.counter <- f.counter + 1;
    eid

  (** Look up the stack offset for a variable name. Returns Some offset or None.
  *)
  let get_offset_opt f name = Hashtbl.find_opt f.stack_offsets name

  (** Set the stack offset for a variable name, using create or replace. *)
  let set_offset f name offset =
    Hashtbl.replace f.stack_offsets name offset;
    f.offset <- offset
end

type top_level =
  | Function of {
      name : string;
      global : bool;
      params : string list;
      body : instruction list;
      frame : Frame.t;
    }
  | StaticVariable of {
      name : string;
      global : bool;
      t : Ctype.t;
      init : Ctype.static_init;
    }
[@@deriving show]

type prog = Program of top_level list [@@deriving show]

let get_value_type (o : value) (te : Analysis.Tenv.t) : Ctype.t =
  match o with
  | Constant c -> Ctype.const_type c
  | Var i -> (
      match Analysis.Tenv.find te (Ast.Identifier i) with
      | Some ti -> ti.c_type
      | None ->
          failwith ("internal error: '" ^ i ^ "' not found in type environment")
      )
