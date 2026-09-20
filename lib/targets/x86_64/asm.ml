type reg = AX | CX | DX | DI | SI | R8 | R9 | R10 | R11 | SP [@@deriving show]
type cond_code = E | NE | G | GE | L | LE | A | AE | B | BE [@@deriving show]
type assembly_type = Longword | Quadword [@@deriving show]

type operand =
  | Imm of int64
  | Reg of reg
  | Pseudo of string
  | Stack of int
  | Data of string
[@@deriving show]

type unary_operator = BwNot | Neg [@@deriving show]

type binary_operator = Add | Sub | Mult | BwAnd | BwXor | BwOr
[@@deriving show]

type instruction =
  | Mov of { typ : assembly_type; src : operand; dst : operand }
  | Movsx of { src : operand; dst : operand }
  | MovZeroExtend of { src : operand; dst : operand }
  | Unary of { op : unary_operator; typ : assembly_type; dst : operand }
  | Binary of {
      op : binary_operator;
      typ : assembly_type;
      src : operand;
      dst : operand;
    }
  | Cmp of { typ : assembly_type; src : operand; dst : operand }
  | Idiv of { typ : assembly_type; src : operand }
  | Div of { typ : assembly_type; src : operand }
  | Cdq of assembly_type
  | Shl of { typ : assembly_type; src : operand; dst : operand }
  | Sar of { typ : assembly_type; src : operand; dst : operand }
  | Shr of { typ : assembly_type; src : operand; dst : operand }
  | Jmp of string
  | JmpCC of cond_code * string
  | SetCC of cond_code * operand
  | Label of string
  | Push of operand
  | Call of string
  | Ret
[@@deriving show]

type top_level =
  | Function of {
      name : string;
      global : bool;
      instructions : instruction list;
    }
  | StaticVariable of {
      name : string;
      global : bool;
      alignment : int;
      init : Ctype.static_init;
    }
[@@deriving show]

type prog = Program of top_level list [@@deriving show]

module Frame = struct
  (** Tracks stack offsets to assign concrete stack slots. *)

  type t = {
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

  let make = { offset = 0; stack_offsets = Hashtbl.create 16 }

  (** Look up the stack offset for a variable name. *)
  let get_offset_opt f name = Hashtbl.find_opt f.stack_offsets name

  (** Set the stack offset for a variable name, using create or replace. *)
  let set_offset f name offset =
    Hashtbl.replace f.stack_offsets name offset;
    f.offset <- offset
end
