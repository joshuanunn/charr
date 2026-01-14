(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 48); (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX)));
        Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 18;
        offset = -48;
        stack slots = {
          dead_div_by_zero.0    -> -4,
          tmp.0                 -> -8,
          tmp.1                 -> -12,
          dead_zero_remainder.1 -> -16,
          tmp.4                 -> -20,
          tmp.5                 -> -24,
          overflow.2            -> -28,
          tmp.8                 -> -32,
          tmp.11                -> -36,
          tmp.12                -> -40,
          tmp.14                -> -44,
          tmp.16                -> -48,
        }}}
     ])
