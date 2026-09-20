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

module Namespace = struct
  type t = {
    namespace : string;  (** Allow unique global labels using a namespace *)
    mutable counter : int;  (** Counter for generating unique names *)
  }
  [@@deriving show]

  let make namespace = { namespace; counter = 0 }

  let next_id t =
    let id = t.counter in
    t.counter <- t.counter + 1;
    id

  (** Generate a unique temporary variable name within namespace. *)
  let generate_tmp t = t.namespace ^ ".tmp." ^ string_of_int (next_id t)

  (** Generate a unique label name within namespace. *)
  let generate_label t name =
    t.namespace ^ "." ^ name ^ "." ^ string_of_int (next_id t)
end

type top_level =
  | Function of {
      name : string;
      global : bool;
      params : string list;
      body : instruction list;
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
