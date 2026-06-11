type size = Byte | Long | Quad | General

let emit_cc (o : Asm.cond_code) : string =
  match o with
  | E -> "e"
  | NE -> "ne"
  | G -> "g"
  | GE -> "ge"
  | L -> "l"
  | LE -> "le"

let emit_op (s : size) (o : Asm.operand) : string =
  let reg64 = function
    | Asm.AX -> "%rax"
    | Asm.BX -> "%rbx"
    | Asm.CX -> "%rcx"
    | Asm.DX -> "%rdx"
    | Asm.DI -> "%rdi"
    | Asm.SI -> "%rsi"
    | Asm.R8 -> "%r8"
    | Asm.R9 -> "%r9"
    | Asm.R10 -> "%r10"
    | Asm.R11 -> "%r11"
    | Asm.R12 -> "%r12"
    | Asm.R13 -> "%r13"
    | Asm.R14 -> "%r14"
    | Asm.R15 -> "%r15"
    | _ -> failwith "not a valid 64-bit integer register"
  in
  let reg32 = function
    | Asm.AX -> "%eax"
    | Asm.BX -> "%ebx"
    | Asm.CX -> "%ecx"
    | Asm.DX -> "%edx"
    | Asm.DI -> "%edi"
    | Asm.SI -> "%esi"
    | Asm.R8 -> "%r8d"
    | Asm.R9 -> "%r9d"
    | Asm.R10 -> "%r10d"
    | Asm.R11 -> "%r11d"
    | Asm.R12 -> "%r12d"
    | Asm.R13 -> "%r13d"
    | Asm.R14 -> "%r14d"
    | Asm.R15 -> "%r15d"
    | _ -> failwith "not a valid 32-bit integer register"
  in
  let reg8 = function
    | Asm.AX -> "%al"
    | Asm.BX -> "%bl"
    | Asm.CX -> "%cl"
    | Asm.DX -> "%dl"
    | Asm.DI -> "%dil"
    | Asm.SI -> "%sil"
    | Asm.R8 -> "%r8b"
    | Asm.R9 -> "%r9b"
    | Asm.R10 -> "%r10b"
    | Asm.R11 -> "%r11b"
    | Asm.R12 -> "%r12b"
    | Asm.R13 -> "%r13b"
    | Asm.R14 -> "%r14b"
    | Asm.R15 -> "%r15b"
    | _ -> failwith "not a valid 8-bit integer register"
  in
  let general_purpose = function
    | Asm.SP -> "%rsp"
    | Asm.BP -> "%rbp"
    | Asm.XMM0 -> "%xmm0"
    | Asm.XMM1 -> "%xmm1"
    | Asm.XMM2 -> "%xmm2"
    | Asm.XMM3 -> "%xmm3"
    | Asm.XMM4 -> "%xmm4"
    | Asm.XMM5 -> "%xmm5"
    | Asm.XMM6 -> "%xmm6"
    | Asm.XMM7 -> "%xmm7"
    | Asm.XMM8 -> "%xmm8"
    | Asm.XMM9 -> "%xmm9"
    | Asm.XMM10 -> "%xmm10"
    | Asm.XMM11 -> "%xmm11"
    | Asm.XMM12 -> "%xmm12"
    | Asm.XMM13 -> "%xmm13"
    | Asm.XMM14 -> "%xmm14"
    | Asm.XMM15 -> "%xmm15"
    | _ -> failwith "not a valid general-purpose register"
  in
  match o with
  | Reg r -> (
      match s with
      | Byte -> reg8 r
      | Long -> reg32 r
      | Quad -> reg64 r
      | General -> general_purpose r)
  | Stack i -> Printf.sprintf "%d(%%rbp)" i
  | Imm i -> Printf.sprintf "$%d" i
  | Data s -> Printf.sprintf "%s(%%rip)" s
  | Pseudo s -> failwith ("Pseudo operand " ^ s ^ " has not been lowered")

let emit_unary_op (o : Asm.unary_operator) : string =
  match o with BwNot -> "notl" | Neg -> "negl"

let emit_binary_op (o : Asm.binary_operator) : string =
  match o with
  | Add -> "addl"
  | Sub -> "subl"
  | Mult -> "imull"
  | BwAnd -> "andl"
  | BwXor -> "xorl"
  | BwOr -> "orl"

let format_instruction (i : string) (o : string) : string =
  let ins = Printf.sprintf "    %s" i in
  Printf.sprintf "%-16s%s" ins o

let format_label (l : string) : string = Printf.sprintf ".L%s:" l
let format_function (f : string) : string = Printf.sprintf "%s:" f

let emit_instruction (i : Asm.instruction) : string list =
  match i with
  | Mov (src, dst) ->
      let ops = Printf.sprintf "%s, %s" (emit_op Long src) (emit_op Long dst) in
      [ format_instruction "movl" ops ]
  | Ret ->
      [
        format_instruction "movq" "%rbp, %rsp";
        format_instruction "popq" "%rbp";
        format_instruction "ret" "";
      ]
  | Unary { op; dst } ->
      [ format_instruction (emit_unary_op op) (emit_op Long dst) ]
  | Binary { op; src; dst } ->
      let ops = Printf.sprintf "%s, %s" (emit_op Long src) (emit_op Long dst) in
      [ format_instruction (emit_binary_op op) ops ]
  | Cmp (op1, op2) ->
      let ops = Printf.sprintf "%s, %s" (emit_op Long op1) (emit_op Long op2) in
      [ format_instruction "cmpl" ops ]
  | Idiv o -> [ format_instruction "idivl" (emit_op Long o) ]
  | Cdq -> [ format_instruction "cdq" "" ]
  | Shl (src, dst) ->
      let ops = Printf.sprintf "%s, %s" (emit_op Byte src) (emit_op Long dst) in
      [ format_instruction "shll" ops ]
  | Sar (src, dst) ->
      let ops = Printf.sprintf "%s, %s" (emit_op Byte src) (emit_op Long dst) in
      [ format_instruction "sarl" ops ]
  | Jmp l ->
      let ops = Printf.sprintf ".L%s" l in
      [ format_instruction "jmp" ops ]
  | JmpCC (c, l) ->
      let ins = Printf.sprintf "j%s" (emit_cc c) in
      let ops = Printf.sprintf ".L%s" l in
      [ format_instruction ins ops ]
  | SetCC (c, o) ->
      let ins = Printf.sprintf "set%s" (emit_cc c) in
      let ops = Printf.sprintf "%s" (emit_op Byte o) in
      [ format_instruction ins ops ]
  | Label l -> [ format_label l ]
  | AllocateStack n ->
      let ops = Printf.sprintf "$%d, %%rsp" n in
      [ format_instruction "subq" ops ]
  | DeallocateStack n ->
      let ops = Printf.sprintf "$%d, %%rsp" n in
      [ format_instruction "addq" ops ]
  | Push o ->
      let ops = Printf.sprintf "%s" (emit_op Quad o) in
      [ format_instruction "pushq" ops ]
  | Pop _ -> failwith "TBC"
  | Call l -> [ format_instruction "call" (l ^ "@PLT") ]

let emit_top_level (f : Asm.top_level) : string list =
  match f with
  | Function { name; global; instructions; _ } ->
      let global_directive =
        if global then [ format_instruction ".globl" name ] else []
      in
      let prologue =
        [
          format_instruction ".text" "";
          format_function name;
          format_instruction "pushq" "%rbp";
          format_instruction "movq" "%rsp, %rbp";
        ]
      in
      let ins =
        instructions |> List.concat_map (fun instr -> emit_instruction instr)
      in
      global_directive @ prologue @ ins
  | StaticVariable { name; global; init } -> (
      let global_directive =
        if global then [ format_instruction ".globl" name ] else []
      in
      match init with
      | 0 ->
          global_directive
          @ [
              format_instruction ".bss" "";
              format_instruction ".align" "4";
              format_function name;
              format_instruction ".zero" "4";
            ]
      | i ->
          global_directive
          @ [
              format_instruction ".data" "";
              format_instruction ".align" "4";
              format_function name;
              format_instruction ".long" (string_of_int i);
            ])

let emit_prog (Asm.Program p) : string =
  let footer =
    [ format_instruction ".section" ".note.GNU-stack,\"\",@progbits\n" ]
  in
  let emit_funcs =
    List.map (function f -> String.concat "\n" (emit_top_level f)) p
  in
  String.concat "\n" (emit_funcs @ footer)
