let stack_size = function Asm.Longword -> 4 | Asm.Quadword -> 8

(** Round [n] (always <= 0 here) down toward -infinity to the nearest multiple
    of [alignment]. Used to keep Quadword stack slots 8-byte aligned, since
    [%rbp] is always 16-byte aligned. *)
let align_down (n : int) (alignment : int) : int =
  if n mod alignment = 0 then n else ((n / alignment) - 1) * alignment

(** Look up the stack offset for pseudo-register [v] in [fr], assigning one on
    first use. The slot size and alignment come from [typ], looked up in the
    assembly symbol table by the caller. This is based on its assembly type
    (Longword: 4 bytes; Quadword: 8 bytes, 8-byte aligned).

    Offsets are relative to %rbp, which is always 16-byte aligned; locals grow
    downward from it, packed as tightly as each slot's alignment allows. Note
    that assignment order follows first use while walking the lowered
    instruction list, rather than each variable's declaration order.

    For example, given a function whose instructions first reference a Longword
    pseudo [x], then a Quadword pseudo [y], then a second Longword pseudo [z]
    (in that order):

    {v
                            Higher addresses
          +------------------------------------------+-----------+
          | return address                           |   8(%rbp) |
          +------------------------------------------+-----------+
          | saved %rbp                               |   0(%rbp) |
    rbp → +------------------------------------------+-----------+
          | x  (Longword, 4 bytes)                   |  -4(%rbp) |
          +------------------------------------------+-----------+
          | (4-byte gap, so y is 8-byte aligned)     |           |
          +------------------------------------------+-----------+
          | y  (Quadword, 8 bytes)                   | -16(%rbp) |
          +------------------------------------------+-----------+
          | z  (Longword, 4 bytes)                   | -20(%rbp) |
          +------------------------------------------+-----------+
    rsp → | bottom of frame, after rounding total    |           |
          | size up to a multiple of 16              |           |
          +------------------------------------------+-----------+
                            Lower addresses
    v}

    [y]'s tentative offset (-12) isn't a multiple of 8, so it's rounded down to
    -16 to satisfy the System V ABI 8-byte alignment requirement for 8-byte
    values, leaving the 4-byte gap above it unused.

    **)
let assign_stack_offset (fr : Asm.Frame.t) (v : string)
    (typ : Asm.assembly_type) : int =
  match Asm.Frame.get_offset_opt fr v with
  | Some offset -> offset
  | None ->
      let tentative = fr.offset - stack_size typ in
      let offset =
        if typ = Asm.Quadword then align_down tentative 8 else tentative
      in
      Asm.Frame.set_offset fr v offset;
      offset

(** Resolve a pseudo operand to either a data-section reference (for static
    storage) or a stack slot (for automatic storage), leaving other operands
    unchanged. *)
let lower_operand (o : Asm.operand) (ae : Symtab.t) (fr : Asm.Frame.t) :
    Asm.operand =
  match o with
  | Pseudo v -> (
      match Symtab.find ae v with
      | Some (ObjEntry { typ; is_static }) ->
          if is_static then Asm.Data v
          else Asm.Stack (assign_stack_offset fr v typ)
      | Some (FunEntry _) ->
          failwith
            ("internal error: pseudo-register " ^ v
           ^ " is a function in assembly symbol table")
      | None ->
          failwith
            ("internal error: pseudo-register " ^ v
           ^ " not found in assembly symbol table"))
  | _ -> o

(** Lowers any pseudo-registers in the instruction [i], replacing them with
    stack operands or data-section references. *)
let lower_instruction (i : Asm.instruction) (ae : Symtab.t) (fr : Asm.Frame.t) :
    Asm.instruction =
  match i with
  | Mov { typ; src; dst } ->
      Mov { typ; src = lower_operand src ae fr; dst = lower_operand dst ae fr }
  | Movsx { src; dst } ->
      Movsx { src = lower_operand src ae fr; dst = lower_operand dst ae fr }
  | MovZeroExtend { src; dst } ->
      MovZeroExtend
        { src = lower_operand src ae fr; dst = lower_operand dst ae fr }
  | Unary { op; typ; dst } -> Unary { op; typ; dst = lower_operand dst ae fr }
  | Binary { op; typ; src; dst } ->
      Binary
        {
          op;
          typ;
          src = lower_operand src ae fr;
          dst = lower_operand dst ae fr;
        }
  | Cmp { typ; src; dst } ->
      Cmp { typ; src = lower_operand src ae fr; dst = lower_operand dst ae fr }
  | Shl { typ; src; dst } ->
      Shl { typ; src = lower_operand src ae fr; dst = lower_operand dst ae fr }
  | Sar { typ; src; dst } ->
      Sar { typ; src = lower_operand src ae fr; dst = lower_operand dst ae fr }
  | Shr { typ; src; dst } ->
      Shr { typ; src = lower_operand src ae fr; dst = lower_operand dst ae fr }
  | SetCC (cc, op) -> SetCC (cc, lower_operand op ae fr)
  | Idiv { typ; src } -> Idiv { typ; src = lower_operand src ae fr }
  | Div { typ; src } -> Div { typ; src = lower_operand src ae fr }
  | Push src -> Push (lower_operand src ae fr)
  | _ -> i

(** Lowers all pseudo operands in the function [f], where all variables have
    been resolved to stack locations or data-section references. *)
let lower_func (f : Asm.top_level) (ae : Symtab.t) : Asm.top_level =
  match f with
  | Function fn ->
      (* Allocate a function stack frame to track stack offsets during lowering *)
      let frame = Asm.Frame.make in
      let lowered_instructions =
        fn.instructions
        |> List.map (fun instr -> lower_instruction instr ae frame)
      in
      (* Align function stack size to nearest 16 bytes *)
      let stack_size = -frame.offset in
      let aligned_size_bytes = Int64.of_int ((stack_size + 15) / 16 * 16) in
      let stack_alloc_instrs =
        if frame.offset <> 0 then
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
          instructions = stack_alloc_instrs @ lowered_instructions;
        }
  | StaticVariable v -> StaticVariable v

(** Lowers all pseudo operands in the program [p], with pseudo registers
    replaced with stack-based addressing or data-section references. *)
let apply (Asm.Program p) (ae : Symtab.t) : Asm.prog =
  let lowered_funcs = List.map (fun func -> lower_func func ae) p in
  Program lowered_funcs
