let is_mem_operand = function Asm.Stack _ | Asm.Data _ -> true | _ -> false

let fits_int32 (n : int64) : bool =
  n >= Int64.of_int32 Int32.min_int && n <= Int64.of_int32 Int32.max_int

(** Truncate to the low 32 bits, sign-extend back to int64. This is what the
    assembler does, but it emits a warning. We can apply ourselves to avoid the
    warning. *)
let truncate_to_int32 (n : int64) : int64 = Int64.of_int32 (Int64.to_int32 n)

let binary_mem_mem_fix (op : Asm.binary_operator) (typ : Asm.assembly_type)
    (src : Asm.operand) (dst : Asm.operand) : Asm.instruction list =
  [ Mov { typ; src; dst = Reg R10 }; Binary { op; typ; src = Reg R10; dst } ]

(** [fixup_instruction i] rewrites the instruction [i] if it is invalid in
    x86-64, such as a move from one stack location to another. In such cases, it
    inserts an intermediate move through a temporary register (e.g., R10). All
    other instructions are returned unchanged. *)
let fixup_instruction (i : Asm.instruction) : Asm.instruction list =
  match i with
  (* movq cannot move an out-of-range immediate directly into memory *)
  | Mov { typ = Quadword; src = Imm n; dst }
    when is_mem_operand dst && not (fits_int32 n) ->
      [
        Mov { typ = Quadword; src = Imm n; dst = Reg R10 };
        Mov { typ = Quadword; src = Reg R10; dst };
      ]
  (* movl truncates an oversized immediate to 32 bits with an assembler
     warning; truncate it ourselves to avoid the warning *)
  | Mov { typ = Longword; src = Imm n; dst } when not (fits_int32 n) ->
      [ Mov { typ = Longword; src = Imm (truncate_to_int32 n); dst } ]
  (* mov cannot use memory addresses as both source and destination *)
  | Mov { typ; src; dst } when is_mem_operand src && is_mem_operand dst ->
      [ Mov { typ; src; dst = Reg R10 }; Mov { typ; src = Reg R10; dst } ]
  (* movsx cannot use memory address as destination or constant as source*)
  | Movsx { src = Imm d; dst } when is_mem_operand dst ->
      [
        Mov { typ = Longword; src = Imm d; dst = Reg R10 };
        Movsx { src = Reg R10; dst = Reg R11 };
        Mov { typ = Quadword; src = Reg R11; dst };
      ]
  (* movsx cannot use memory addresses as a destination *)
  | Movsx { src; dst } when is_mem_operand dst ->
      [
        Movsx { src; dst = Reg R11 }; Mov { typ = Quadword; src = Reg R11; dst };
      ]
  (* movsx cannot use a constant value as a source *)
  | Movsx { src = Imm d; dst } ->
      [
        Mov { typ = Longword; src = Imm d; dst = Reg R10 };
        Movsx { src = Reg R10; dst };
      ]
  (* 1. cmpq cannot use an out-of-range immediate as its source; if dst is
        also a constant, stage both through registers *)
  | Cmp { typ = Quadword; src = Imm n; dst } when not (fits_int32 n) -> (
      let load_src = Asm.Mov { typ = Quadword; src = Imm n; dst = Reg R10 } in
      match dst with
      | Imm d ->
          [
            load_src;
            Mov { typ = Quadword; src = Imm d; dst = Reg R11 };
            Cmp { typ = Quadword; src = Reg R10; dst = Reg R11 };
          ]
      | _ -> [ load_src; Cmp { typ = Quadword; src = Reg R10; dst } ])
  (* 2. cmp cannot use memory addresses as both source and destination *)
  | Cmp { typ; src; dst } when is_mem_operand src && is_mem_operand dst ->
      [ Mov { typ; src; dst = Reg R10 }; Cmp { typ; src = Reg R10; dst } ]
  (* 3. cmp cannot use a constant as its destination, for any type *)
  | Cmp { typ; src = s; dst = Imm d } ->
      [
        Mov { typ; src = Imm d; dst = Reg R11 };
        Cmp { typ; src = s; dst = Reg R11 };
      ]
  (* imulq (quadword): src cannot be an out-of-range immediate, and dst
     cannot be memory or a constant *)
  | Binary { op = Mult; typ = Quadword; src = Imm n; dst }
    when not (fits_int32 n) -> (
      let load_src = Asm.Mov { typ = Quadword; src = Imm n; dst = Reg R10 } in
      match dst with
      | Stack _ | Data _ | Imm _ ->
          [
            load_src;
            Mov { typ = Quadword; src = dst; dst = Reg R11 };
            Binary { op = Mult; typ = Quadword; src = Reg R10; dst = Reg R11 };
            Mov { typ = Quadword; src = Reg R11; dst };
          ]
      | _ ->
          [ load_src; Binary { op = Mult; typ = Quadword; src = Reg R10; dst } ]
      )
  (* mul cannot have memory address or constant as destination *)
  | Binary { op = Mult; typ; src; dst } -> (
      match dst with
      | Stack _ | Data _ | Imm _ ->
          [
            Mov { typ; src = dst; dst = Reg R11 };
            Binary { op = Mult; typ; src; dst = Reg R11 };
            Mov { typ; src = Reg R11; dst };
          ]
      | _ -> [ i ])
  (* other binary ops that cannot use memory addresses as both src and dest *)
  | Binary { op; typ; src; dst } when is_mem_operand src && is_mem_operand dst
    ->
      binary_mem_mem_fix op typ src dst
  (* addq/subq (quadword) cannot use an out-of-range immediate as a source *)
  | Binary { op = (Add | Sub) as op; typ = Quadword; src = Imm n; dst }
    when not (fits_int32 n) ->
      [
        Mov { typ = Quadword; src = Imm n; dst = Reg R10 };
        Binary { op; typ = Quadword; src = Reg R10; dst };
      ]
  (* div cannot operate on constant values *)
  | Idiv { typ; src = Imm c } ->
      [ Mov { typ; src = Imm c; dst = Reg R10 }; Idiv { typ; src = Reg R10 } ]
  | Push (Imm n) when not (fits_int32 n) ->
      [ Mov { typ = Quadword; src = Imm n; dst = Reg R10 }; Push (Reg R10) ]
  | _ -> [ i ]

(** [fixup_func f] rewrites any invalid instructions in the function [f] by
    applying [fixup_instruction] to each instruction. It also prepends a stack
    allocation instruction based on the function frame, if necessary. This may
    expand a single instruction into multiple valid ones. *)
let fixup_func (f : Asm.top_level) : Asm.top_level =
  match f with
  | Function fn ->
      let fixed_func_instrs =
        fn.instructions
        |> List.concat_map (fun instr -> fixup_instruction instr)
      in
      (* Align function stack size to nearest 16 bytes *)
      let stack_size = -fn.frame.offset in
      let aligned_size_bytes = Int64.of_int ((stack_size + 15) / 16 * 16) in
      let stack_alloc_instrs =
        if fn.frame.offset <> 0 then
          [
            Asm.Binary
              {
                op = Asm.Sub;
                typ = Asm.Quadword;
                src = Imm aligned_size_bytes;
                dst = Reg SP;
              };
          ]
        else []
      in
      Function
        {
          name = fn.name;
          global = fn.global;
          instructions = stack_alloc_instrs @ fixed_func_instrs;
          frame = fn.frame;
        }
  | StaticVariable v -> StaticVariable v

(** [fixup_prog p] rewrites the assembly program [p] by fixing up any invalid
    instructions in each function and prepending stack allocation based on the
    function frame. *)
let fixup_prog (Asm.Program p) : Asm.prog =
  let fixed_funcs = List.map fixup_func p in
  Program fixed_funcs
