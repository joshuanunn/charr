(** Converts a Targets.X86_64.Asm.prog into a listing view for for the
    interactive web UI display. *)

open Listing_view

let width_badge : Charr.Targets.X86_64.Asm.assembly_type -> string = function
  | Longword -> "long"
  | Quadword -> "quad"

let reg_str : Charr.Targets.X86_64.Asm.reg -> string = function
  | AX -> "AX"
  | CX -> "CX"
  | DX -> "DX"
  | DI -> "DI"
  | SI -> "SI"
  | R8 -> "R8"
  | R9 -> "R9"
  | R10 -> "R10"
  | R11 -> "R11"
  | SP -> "SP"

let cc_str : Charr.Targets.X86_64.Asm.cond_code -> string = function
  | E -> "E"
  | NE -> "NE"
  | G -> "G"
  | GE -> "GE"
  | L -> "L"
  | LE -> "LE"
  | A -> "A"
  | AE -> "AE"
  | B -> "B"
  | BE -> "BE"

let unop_str : Charr.Targets.X86_64.Asm.unary_operator -> string = function
  | BwNot -> "BwNot"
  | Neg -> "Neg"

let binop_str : Charr.Targets.X86_64.Asm.binary_operator -> string = function
  | Add -> "Add"
  | Sub -> "Sub"
  | Mult -> "Mult"
  | BwAnd -> "BwAnd"
  | BwXor -> "BwXor"
  | BwOr -> "BwOr"

let op_of_operand : Charr.Targets.X86_64.Asm.operand -> op = function
  | Imm i -> imm ("$" ^ Int64.to_string i)
  | Reg r -> reg (reg_str r)
  | Pseudo s -> var s
  | Stack i -> mem (Printf.sprintf "stack[%d]" i)
  | Data s -> mem s

let row_of_instruction : Charr.Targets.X86_64.Asm.instruction -> row = function
  | Mov { typ; src; dst } ->
      instr "Mov" ~badge:(width_badge typ)
        [ op_of_operand src; op_of_operand dst ]
  | Movsx { src; dst } -> instr "Movsx" [ op_of_operand src; op_of_operand dst ]
  | MovZeroExtend { src; dst } ->
      instr "MovZeroExtend" [ op_of_operand src; op_of_operand dst ]
  | Unary { op; typ; dst } ->
      instr (unop_str op) ~badge:(width_badge typ) [ op_of_operand dst ]
  | Binary { op; typ; src; dst } ->
      instr (binop_str op) ~badge:(width_badge typ)
        [ op_of_operand src; op_of_operand dst ]
  | Cmp { typ; src; dst } ->
      instr "Cmp" ~badge:(width_badge typ)
        [ op_of_operand src; op_of_operand dst ]
  | Idiv { typ; src } ->
      instr "Idiv" ~badge:(width_badge typ) [ op_of_operand src ]
  | Div { typ; src } ->
      instr "Div" ~badge:(width_badge typ) [ op_of_operand src ]
  | Cdq typ -> instr "Cdq" ~badge:(width_badge typ) []
  | Shl { typ; src; dst } ->
      instr "Shl" ~badge:(width_badge typ)
        [ op_of_operand src; op_of_operand dst ]
  | Sar { typ; src; dst } ->
      instr "Sar" ~badge:(width_badge typ)
        [ op_of_operand src; op_of_operand dst ]
  | Shr { typ; src; dst } ->
      instr "Shr" ~badge:(width_badge typ)
        [ op_of_operand src; op_of_operand dst ]
  | Jmp l -> instr "Jmp" [ label_ref l ]
  | JmpCC (cc, l) -> instr ("JmpCC " ^ cc_str cc) [ label_ref l ]
  | SetCC (cc, o) -> instr ("SetCC " ^ cc_str cc) [ op_of_operand o ]
  | Label l -> Label l
  | Push o -> instr "Push" [ op_of_operand o ]
  | Call l -> instr ("Call " ^ l) []
  | Ret -> instr "Ret" []

let block_of_top_level : Charr.Targets.X86_64.Asm.top_level -> block = function
  | Function { name; global; instructions } ->
      {
        name = "Function " ^ name;
        global;
        params = [];
        badge = None;
        rows = List.map row_of_instruction instructions;
      }
  | StaticVariable { name; global; alignment; init } ->
      {
        name = "StaticVariable " ^ name;
        global;
        params = [];
        badge =
          Some
            (Printf.sprintf "align %d = %s" alignment
               (Ctype_view.static_init_str init));
        rows = [];
      }

let of_prog
    (Charr.Targets.X86_64.Asm.Program top_levels :
      Charr.Targets.X86_64.Asm.prog) : listing =
  List.map block_of_top_level top_levels
