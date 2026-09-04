type reg = AX | CX | DX | DI | SI | R8 | R9 | R10 | R11 | SP [@@deriving show]
type cond_code = E | NE | G | GE | L | LE [@@deriving show]
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
  | Unary of { op : unary_operator; typ : assembly_type; dst : operand }
  | Binary of {
      op : binary_operator;
      typ : assembly_type;
      src : operand;
      dst : operand;
    }
  | Cmp of { typ : assembly_type; src : operand; dst : operand }
  | Idiv of { typ : assembly_type; src : operand }
  | Cdq of assembly_type
  | Shl of { typ : assembly_type; src : operand; dst : operand }
  | Sar of { typ : assembly_type; src : operand; dst : operand }
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
      frame : Env.lenv;
    }
  | StaticVariable of {
      name : string;
      global : bool;
      alignment : int;
      init : Ctype.static_init;
    }
[@@deriving show]

type prog = Program of top_level list [@@deriving show]
