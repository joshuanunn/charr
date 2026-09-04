type operand_width = Byte | Long | Quad

let emit_cc (o : Asm.cond_code) : string =
  match o with
  | E -> "e"
  | NE -> "ne"
  | G -> "g"
  | GE -> "ge"
  | L -> "l"
  | LE -> "le"

let width_of_asm_type : Asm.assembly_type -> operand_width = function
  | Longword -> Long
  | Quadword -> Quad

let suffix_of_asm_type : Asm.assembly_type -> string = function
  | Longword -> "l"
  | Quadword -> "q"

let reg_name (s : operand_width) (r : Asm.reg) : string =
  match (s, r) with
  | Byte, AX -> "%al"
  | Long, AX -> "%eax"
  | Quad, AX -> "%rax"
  | Byte, CX -> "%cl"
  | Long, CX -> "%ecx"
  | Quad, CX -> "%rcx"
  | Byte, DX -> "%dl"
  | Long, DX -> "%edx"
  | Quad, DX -> "%rdx"
  | Byte, DI -> "%dil"
  | Long, DI -> "%edi"
  | Quad, DI -> "%rdi"
  | Byte, SI -> "%sil"
  | Long, SI -> "%esi"
  | Quad, SI -> "%rsi"
  | Byte, R8 -> "%r8b"
  | Long, R8 -> "%r8d"
  | Quad, R8 -> "%r8"
  | Byte, R9 -> "%r9b"
  | Long, R9 -> "%r9d"
  | Quad, R9 -> "%r9"
  | Byte, R10 -> "%r10b"
  | Long, R10 -> "%r10d"
  | Quad, R10 -> "%r10"
  | Byte, R11 -> "%r11b"
  | Long, R11 -> "%r11d"
  | Quad, R11 -> "%r11"
  | _, SP -> "%rsp"

let emit_op (s : operand_width) (o : Asm.operand) : string =
  match o with
  | Reg r -> reg_name s r
  | Stack i -> Printf.sprintf "%d(%%rbp)" i
  | Imm i -> Printf.sprintf "$%Ld" i
  | Data s -> Printf.sprintf "%s(%%rip)" s
  | Pseudo s ->
      failwith
        (Printf.sprintf
           "internal error: pseudo-register '%s' not lowered before emission" s)

let format_instruction (i : string) (o : string) : string =
  let ins = Printf.sprintf "    %s" i in
  Printf.sprintf "%-16s%s" ins o

let format_bare_instruction (i : string) : string = Printf.sprintf "    %s" i
let format_label (l : string) : string = Printf.sprintf ".L%s:" l
let format_function (f : string) : string = Printf.sprintf "%s:" f

(** Emit a two-operand instruction, each operand printed at its own size *)
let emit_two_operand (mnemonic : string) (src_size : operand_width)
    (dst_size : operand_width) (src : Asm.operand) (dst : Asm.operand) : string
    =
  let ops =
    Printf.sprintf "%s, %s" (emit_op src_size src) (emit_op dst_size dst)
  in
  format_instruction mnemonic ops

(** common case: both operands share [typ]'s width *)
let emit_typed_binop (mnemonic_base : string) (typ : Asm.assembly_type)
    (src : Asm.operand) (dst : Asm.operand) : string =
  let width = width_of_asm_type typ in
  emit_two_operand (mnemonic_base ^ suffix_of_asm_type typ) width width src dst

let emit_typed_unop (mnemonic_base : string) (typ : Asm.assembly_type)
    (operand : Asm.operand) : string =
  format_instruction
    (mnemonic_base ^ suffix_of_asm_type typ)
    (emit_op (width_of_asm_type typ) operand)

let emit_unary_op = function Asm.BwNot -> "not" | Asm.Neg -> "neg"

let emit_binary_op = function
  | Asm.Add -> "add"
  | Asm.Sub -> "sub"
  | Asm.Mult -> "imul"
  | Asm.BwAnd -> "and"
  | Asm.BwXor -> "xor"
  | Asm.BwOr -> "or"

let static_init_directive : Ctype.static_init -> string * string = function
  | IntInit 0l -> (".zero", "4")
  | LongInit 0L -> (".zero", "8")
  | IntInit i -> (".long", Int32.to_string i)
  | LongInit i -> (".quad", Int64.to_string i)

let is_zero_init : Ctype.static_init -> bool = function
  | IntInit 0l | LongInit 0L -> true
  | _ -> false

let emit_instruction (i : Asm.instruction) : string list =
  match i with
  | Mov { typ; src; dst } -> [ emit_typed_binop "mov" typ src dst ]
  | Movsx { src; dst } -> [ emit_two_operand "movslq" Long Quad src dst ]
  | Ret ->
      [
        format_instruction "movq" "%rbp, %rsp";
        format_instruction "popq" "%rbp";
        format_bare_instruction "ret";
      ]
  | Unary { op; typ; dst } -> [ emit_typed_unop (emit_unary_op op) typ dst ]
  | Binary { op; typ; src; dst } ->
      [ emit_typed_binop (emit_binary_op op) typ src dst ]
  | Cmp { typ; src; dst } -> [ emit_typed_binop "cmp" typ src dst ]
  | Idiv { typ; src } -> [ emit_typed_unop "idiv" typ src ]
  | Cdq typ ->
      let mnemonic =
        match typ with Asm.Longword -> "cdq" | Asm.Quadword -> "cqo"
      in
      [ format_bare_instruction mnemonic ]
  | Shl { typ; src; dst } ->
      let width = width_of_asm_type typ in
      [ emit_two_operand ("shl" ^ suffix_of_asm_type typ) Byte width src dst ]
  | Sar { typ; src; dst } ->
      let width = width_of_asm_type typ in
      [ emit_two_operand ("sar" ^ suffix_of_asm_type typ) Byte width src dst ]
  | Jmp l -> [ format_instruction "jmp" (Printf.sprintf ".L%s" l) ]
  | JmpCC (c, l) ->
      [
        format_instruction
          (Printf.sprintf "j%s" (emit_cc c))
          (Printf.sprintf ".L%s" l);
      ]
  | SetCC (c, o) ->
      [
        format_instruction
          (Printf.sprintf "set%s" (emit_cc c))
          (Printf.sprintf "%s" (emit_op Byte o));
      ]
  | Label l -> [ format_label l ]
  | Push o ->
      [ format_instruction "pushq" (Printf.sprintf "%s" (emit_op Quad o)) ]
  | Call l -> [ format_instruction "call" (l ^ "@PLT") ]

let emit_top_level (f : Asm.top_level) : string list =
  match f with
  | Function { name; global; instructions; _ } ->
      let global_directive =
        if global then [ format_instruction ".globl" name ] else []
      in
      let prologue =
        [
          format_bare_instruction ".text";
          format_function name;
          format_instruction "pushq" "%rbp";
          format_instruction "movq" "%rsp, %rbp";
        ]
      in
      let ins =
        instructions |> List.concat_map (fun instr -> emit_instruction instr)
      in
      global_directive @ prologue @ ins
  | StaticVariable { name; global; alignment; init } ->
      let global_directive =
        if global then [ format_instruction ".globl" name ] else []
      in
      let directive, value = static_init_directive init in
      let region = if is_zero_init init then ".bss" else ".data" in
      global_directive
      @ [
          format_bare_instruction region;
          format_instruction ".align" (string_of_int alignment);
          format_function name;
          format_instruction directive value;
        ]

let emit_prog (Asm.Program p) : string =
  let footer =
    [ format_instruction ".section" ".note.GNU-stack,\"\",@progbits\n" ]
  in
  let emit_funcs =
    List.map (function f -> String.concat "\n" (emit_top_level f)) p
  in
  String.concat "\n" (emit_funcs @ footer)
