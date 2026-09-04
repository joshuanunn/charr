let get_value_type (o : Ir.value) (te : Env.tenv) : Ctype.t =
  match o with
  | Constant c -> Ctype.const_type c
  | Var i -> (
      match Env.find te (Ast.Identifier i) with
      | Some ti -> ti.c_type
      | None ->
          failwith ("internal error: '" ^ i ^ "' not found in type environment")
      )

let get_assembly_type_of_ctype (t : Ctype.t) : Asm.assembly_type =
  match t with
  | Int -> Asm.Longword
  | Long -> Asm.Quadword
  | FunType _ -> failwith "internal error: no assembly type for function type"

let get_assembly_type (o : Ir.value) (te : Env.tenv) : Asm.assembly_type =
  get_assembly_type_of_ctype (get_value_type o te)

let get_assembly_alignment (t : Ctype.t) : int =
  match t with
  | Int -> 4
  | Long -> 8
  | FunType _ ->
      failwith "internal error: no assembly alignment for function type"

let compile_val (o : Ir.value) : Asm.operand =
  match o with
  | Constant (ConstInt n) -> Imm (Int64.of_int32 n)
  | Constant (ConstLong n) -> Imm n
  | Var i -> Pseudo i

let split_at n lst =
  let rec aux i acc l =
    match (i, l) with
    | 0, _ -> (List.rev acc, l)
    | _, [] -> (List.rev acc, [])
    | i, x :: xs -> aux (i - 1) (x :: acc) xs
  in
  aux n [] lst

let rec copy_args_to_regs regs args te =
  match (regs, args) with
  | r :: regs', a :: args' ->
      let instr =
        Asm.Mov
          { typ = get_assembly_type a te; src = compile_val a; dst = Reg r }
      in
      instr :: copy_args_to_regs regs' args' te
  | _ -> [] (* stop when either list is exhausted *)

let is_reg_or_imm = function Asm.Reg _ | Asm.Imm _ -> true | _ -> false

(** [build_stack_pushes stack_args t_env] generates the list of assembly
    instructions to push stack-passed arguments for a function call, following
    System V ABI.

    The incoming [stack_args] list is ordered left-to-right as written, but the
    System V ABI requires that the stack arguments be pushed right-to-left, i.e.
    the last stack argument is pushed first.

    For each argument:
    - If already a register or immediate or its type is Quadword, simply emit:
      push <arg>
    - Otherwise, ABI requires register push, so emit: mov <arg>, %ax push %ax

    - If the operand is already a register or immediate, or its assembly type is
      Quadword, emit directly: push <arg> (x86-64 [push] accepts a 64-bit
      register/memory operand or a sign-extended imm32, so a Quadword value in
      memory can be pushed as-is)
    - Otherwise (a Longword value sitting in memory), ABI requires that it must
      go through a register first: mov <arg>, %eax; push %rax *)
let build_stack_pushes args te =
  let reversed = List.rev args in
  List.concat_map
    (fun a ->
      let op = compile_val a in
      let op_typ = get_assembly_type a te in
      if is_reg_or_imm op || op_typ = Asm.Quadword then [ Asm.Push op ]
      else
        [
          Asm.Mov { typ = Asm.Longword; src = op; dst = Reg AX };
          Asm.Push (Reg AX);
        ])
    reversed

(** Use System V calling convention to generate instructions to copy parameters
    into pseudoregisters to simplify handling. This is done by moving Reg(DI)
    into a pseudoregister for the first parameter, the second from Reg(SI), etc
    up to the sixth parameter. Any further parameters are copied in steps of 8
    bytes from Stack(16), Stack(24), etc. The System V calling convention is
    show in the table below.

    {v
          | Arg index | Location defined by caller |
          | --------- | -------------------------- |
          | 0         | Reg(DI)                    |
          | 1         | Reg(SI)                    |
          | 2         | Reg(DX)                    |
          | 3         | Reg(CX)                    |
          | 4         | Reg(R8)                    |
          | 5         | Reg(R9)                    |
          | 6         | 16(%rbp)                   |
          | 7         | 24(%rbp)                   |
          | 8         | 32(%rbp)                   |
          | …         | (16 + 8*(i-6))(%rbp)       |
    v}

    Note that a register's *width* when moved (e.g. %edi vs %rdi) depends on the
    parameter's assembly type (e.g. Longword or Quadword), and is resolved at
    code emission. Similarly, each parameter is assigned a Pseudo destination
    here; its concrete stack offset (and slot size/alignment, which also depend
    on its type) isn't decided until pseudoregister replacement, in
    Codegen_lower.

    **)
let copy_args_to_stack (params : string list) (te : Env.tenv) :
    Asm.instruction list =
  let reg_order = [ Asm.DI; Asm.SI; Asm.DX; Asm.CX; Asm.R8; Asm.R9 ] in

  let rec build i params acc =
    match params with
    | [] -> List.rev acc
    | param :: rest ->
        let dst = Asm.Pseudo param in
        let dst_typ = get_assembly_type (Ir.Var param) te in
        let instr =
          if i < 6 then
            (* Copy first 6 params from registers to new stack slot *)
            Asm.Mov { typ = dst_typ; src = Reg (List.nth reg_order i); dst }
          else
            (* Copy further params from caller stack -> new stack slot *)
            let offset = 16 + (8 * (i - 6)) in
            Asm.Mov { typ = dst_typ; src = Asm.Stack offset; dst }
        in
        build (i + 1) rest (instr :: acc)
  in
  build 0 params []

let compile_unary_op (uop : Ir.unary_operator) : Asm.unary_operator =
  match uop with
  | BwNot -> BwNot
  | Negate -> Neg
  | _ -> failwith "Cannot compile IR unary operator to ASM unary"

let compile_binary_op (bop : Ir.binary_operator) : Asm.binary_operator =
  match bop with
  | Add -> Add
  | Subtract -> Sub
  | Multiply -> Mult
  | BwAnd -> BwAnd
  | BwXor -> BwXor
  | BwOr -> BwOr
  | _ -> failwith "Cannot compile IR binary operator to ASM binary"

let compile_cc (bop : Ir.binary_operator) : Asm.cond_code =
  match bop with
  | Equal -> E
  | NotEqual -> NE
  | LessOrEqual -> LE
  | GreaterOrEqual -> GE
  | LessThan -> L
  | GreaterThan -> G
  | _ -> failwith "Cannot compile IR binary operator to ASM cond code"

let compile_instruction (s : Ir.instruction) (te : Env.tenv) :
    Asm.instruction list =
  match s with
  | Return v ->
      [
        Mov { typ = get_assembly_type v te; src = compile_val v; dst = Reg AX };
        Ret;
      ]
  | SignExtend { src; dst } ->
      [ Movsx { src = compile_val src; dst = compile_val dst } ]
  | Truncate { src; dst } ->
      [
        Mov { typ = Asm.Longword; src = compile_val src; dst = compile_val dst };
      ]
  | Unary { op; src; dst } -> (
      let src_val = compile_val src in
      let dst_val = compile_val dst in
      let src_typ = get_assembly_type src te in
      let dst_typ = get_assembly_type dst te in
      match op with
      (* Logical Not operator *)
      | Not ->
          [
            Cmp { typ = src_typ; src = Imm 0L; dst = src_val };
            Mov { typ = dst_typ; src = Imm 0L; dst = dst_val };
            SetCC (E, dst_val);
          ]
      (* Other unary operators *)
      | _ ->
          [
            Mov { typ = src_typ; src = src_val; dst = dst_val };
            Unary { op = compile_unary_op op; typ = src_typ; dst = dst_val };
          ])
  | Binary { op; src1; src2; dst } -> (
      let src1_val = compile_val src1 in
      let src2_val = compile_val src2 in
      let dst_val = compile_val dst in
      let src1_typ = get_assembly_type src1 te in
      let src2_typ = get_assembly_type src2 te in
      let dst_typ = get_assembly_type dst te in
      match op with
      (* Division *)
      | Divide ->
          [
            Mov { typ = src1_typ; src = src1_val; dst = Reg AX };
            Cdq src1_typ;
            Idiv { typ = src1_typ; src = src2_val };
            Mov { typ = src1_typ; src = Reg AX; dst = dst_val };
          ]
      | Remainder ->
          [
            Mov { typ = src1_typ; src = src1_val; dst = Reg AX };
            Cdq src1_typ;
            Idiv { typ = src1_typ; src = src2_val };
            Mov { typ = src1_typ; src = Reg DX; dst = dst_val };
          ]
      (* Relational operators *)
      | Equal | NotEqual | LessOrEqual | GreaterOrEqual | LessThan | GreaterThan
        ->
          [
            Cmp { typ = src1_typ; src = src2_val; dst = src1_val };
            Mov { typ = dst_typ; src = Imm 0L; dst = dst_val };
            SetCC (compile_cc op, dst_val);
          ]
      (* Bitwise left and right shifts *)
      | BwLeftShift -> (
          match src2_val with
          (* special case: shift using an immediate operand *)
          | Imm _ ->
              [
                Mov { typ = src1_typ; src = src1_val; dst = dst_val };
                Shl { typ = src1_typ; src = src2_val; dst = dst_val };
              ]
          (* otherwise: shift using value in cl register *)
          | _ ->
              [
                Mov { typ = src1_typ; src = src1_val; dst = dst_val };
                Mov { typ = src2_typ; src = src2_val; dst = Reg CX };
                Shl { typ = src1_typ; src = Reg CX; dst = dst_val };
              ])
      | BwRightShift -> (
          match src2_val with
          (* special case: shift using an immediate operand *)
          | Imm _ ->
              [
                Mov { typ = src1_typ; src = src1_val; dst = dst_val };
                Sar { typ = src1_typ; src = src2_val; dst = dst_val };
              ]
          (* otherwise: shift using value in cl register *)
          | _ ->
              [
                Mov { typ = src1_typ; src = src1_val; dst = dst_val };
                Mov { typ = src2_typ; src = src2_val; dst = Reg CX };
                Sar { typ = src1_typ; src = Reg CX; dst = dst_val };
              ])
      (* Everything else *)
      | Add | Subtract | Multiply | BwAnd | BwXor | BwOr ->
          let maybe_mov =
            if src1_val = dst_val then []
            else [ Asm.Mov { typ = src1_typ; src = src1_val; dst = dst_val } ]
          in
          maybe_mov
          @ [
              Binary
                {
                  op = compile_binary_op op;
                  typ = src1_typ;
                  src = src2_val;
                  dst = dst_val;
                };
            ])
  | Jump { target } -> [ Jmp target ]
  | JumpIfZero { condition; target } ->
      [
        Cmp
          {
            typ = get_assembly_type condition te;
            src = Imm 0L;
            dst = compile_val condition;
          };
        JmpCC (E, target);
      ]
  | JumpIfNotZero { condition; target } ->
      [
        Cmp
          {
            typ = get_assembly_type condition te;
            src = Imm 0L;
            dst = compile_val condition;
          };
        JmpCC (NE, target);
      ]
  | Copy { src; dst } ->
      [
        Mov
          {
            typ = get_assembly_type src te;
            src = compile_val src;
            dst = compile_val dst;
          };
      ]
  | Label i -> [ Label i ]
  | FunCall { fun_name; args; dst } ->
      (* Adjust stack alignment by padding with 8 bytes if odd number of args *)
      let register_args, stack_args = split_at 6 args in
      let odd_stack = List.length stack_args mod 2 = 1 in
      let stack_padding = if odd_stack then 8L else 0L in
      let pad_stack =
        if odd_stack then
          (* Allocate stack *)
          [
            Asm.Binary
              {
                op = Asm.Sub;
                typ = Asm.Quadword;
                src = Asm.Imm stack_padding;
                dst = Asm.Reg SP;
              };
          ]
        else []
      in
      (* Pass args in registers *)
      let reg_order = [ Asm.DI; Asm.SI; Asm.DX; Asm.CX; Asm.R8; Asm.R9 ] in
      let pass_register_args = copy_args_to_regs reg_order register_args te in
      (* Pass remaining args on stack *)
      let pass_stack_args = build_stack_pushes stack_args te in
      (* Emit function call *)
      let emit_call = [ Asm.Call fun_name ] in
      (* Adjust stack pointer *)
      let adj_bytes =
        Int64.add (Int64.of_int (8 * List.length stack_args)) stack_padding
      in
      let dealloc_stack =
        if adj_bytes <> 0L then
          (* Deallocate stack *)
          [
            Asm.Binary
              {
                op = Asm.Add;
                typ = Asm.Quadword;
                src = Asm.Imm adj_bytes;
                dst = Asm.Reg SP;
              };
          ]
        else []
      in
      (* Retrieve return value *)
      let ret_value =
        [
          Asm.Mov
            {
              typ = get_assembly_type dst te;
              src = Reg AX;
              dst = compile_val dst;
            };
        ]
      in
      pad_stack @ pass_register_args @ pass_stack_args @ emit_call
      @ dealloc_stack @ ret_value

let compile_func (f : Ir.top_level) (te : Env.tenv) : Asm.top_level =
  match f with
  | Function fn ->
      let args_ins = copy_args_to_stack fn.params te in
      let body_ins =
        List.map (fun i -> compile_instruction i te) fn.body |> List.flatten
      in
      let instructions = args_ins @ body_ins in
      (* let stack_size = 4 * List.length fn.params in *)
      Function
        { name = fn.name; global = fn.global; instructions; frame = fn.frame }
  | StaticVariable { name; global; t; init } ->
      StaticVariable
        { name; global; alignment = get_assembly_alignment t; init }

let build_backend_symtab (te : Env.tenv) : Asm_symtab.t =
  let ae = Asm_symtab.make () in
  Hashtbl.iter
    (fun name (entry : Env.type_entry) ->
      match entry.attrs with
      | FunAttr { defined; _ } -> Asm_symtab.add_fun ae name defined
      | StaticAttr _ ->
          Asm_symtab.add_obj ae name
            (get_assembly_type_of_ctype entry.c_type)
            true
      | LocalAttr ->
          Asm_symtab.add_obj ae name
            (get_assembly_type_of_ctype entry.c_type)
            false)
    te.typed_idents;
  ae

let compile_prog (Program p : Ir.prog) (te : Env.tenv) : Asm.prog * Asm_symtab.t
    =
  let compiled_funcs = List.map (fun f -> compile_func f te) p in
  (Asm.Program compiled_funcs, build_backend_symtab te)
