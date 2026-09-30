(** Converts a validated Ir.prog into a listing view for for the interactive web
    UI display. *)

open Listing_view

let op_of_value : Charr.Ir.value -> op = function
  | Constant c -> imm (Ctype_view.const_str c)
  | Var s -> var s

let unop_str : Charr.Ir.unary_operator -> string = function
  | Negate -> "Negate"
  | BwNot -> "BwNot"
  | Not -> "Not"
  | PreIncrement -> "PreIncrement"
  | PreDecrement -> "PreDecrement"
  | PostIncrement -> "PostIncrement"
  | PostDecrement -> "PostDecrement"

let binop_str : Charr.Ir.binary_operator -> string = function
  | Add -> "Add"
  | Subtract -> "Subtract"
  | Multiply -> "Multiply"
  | Divide -> "Divide"
  | Remainder -> "Remainder"
  | BwLeftShift -> "BwLeftShift"
  | BwRightShift -> "BwRightShift"
  | BwAnd -> "BwAnd"
  | BwXor -> "BwXor"
  | BwOr -> "BwOr"
  | Equal -> "Equal"
  | NotEqual -> "NotEqual"
  | LessOrEqual -> "LessOrEqual"
  | GreaterOrEqual -> "GreaterOrEqual"
  | LessThan -> "LessThan"
  | GreaterThan -> "GreaterThan"

let row_of_instruction : Charr.Ir.instruction -> row = function
  | Return v -> instr "Return" [ op_of_value v ]
  | SignExtend { src; dst } ->
      instr "SignExtend" [ op_of_value src ] ~result:(op_of_value dst)
  | Truncate { src; dst } ->
      instr "Truncate" [ op_of_value src ] ~result:(op_of_value dst)
  | ZeroExtend { src; dst } ->
      instr "ZeroExtend" [ op_of_value src ] ~result:(op_of_value dst)
  | Unary { op; src; dst } ->
      instr
        ("Unary " ^ unop_str op)
        [ op_of_value src ]
        ~result:(op_of_value dst)
  | Binary { op; src1; src2; dst } ->
      instr
        ("Binary " ^ binop_str op)
        [ op_of_value src1; op_of_value src2 ]
        ~result:(op_of_value dst)
  | Copy { src; dst } ->
      instr "Copy" [ op_of_value src ] ~result:(op_of_value dst)
  | Jump { target } -> instr "Jump" [ label_ref target ]
  | JumpIfZero { condition; target } ->
      instr "JumpIfZero" [ op_of_value condition; label_ref target ]
  | JumpIfNotZero { condition; target } ->
      instr "JumpIfNotZero" [ op_of_value condition; label_ref target ]
  | Label l -> Label l
  | FunCall { fun_name; args; dst } ->
      instr ("FunCall " ^ fun_name)
        (List.map op_of_value args)
        ~result:(op_of_value dst)

let block_of_top_level : Charr.Ir.top_level -> block = function
  | Function { name; global; params; body } ->
      {
        name = "Function " ^ name;
        global;
        params = List.map var params;
        badge = None;
        rows = List.map row_of_instruction body;
      }
  | StaticVariable { name; global; t; init } ->
      {
        name = "StaticVariable " ^ name;
        global;
        params = [];
        badge =
          Some
            (Printf.sprintf "%s = %s" (Ctype_view.type_str t)
               (Ctype_view.static_init_str init));
        rows = [];
      }

let of_prog (Charr.Ir.Program top_levels : Charr.Ir.prog) : listing =
  List.map block_of_top_level top_levels
