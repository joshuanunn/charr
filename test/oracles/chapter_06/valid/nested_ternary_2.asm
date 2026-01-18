(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 32); (Asm.Mov ((Asm.Imm 15), (Asm.Reg Asm.AX)));
        Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 13;
        offset = -28;
        stack slots = {
          a.0    -> -4,
          tmp.0  -> -8,
          tmp.3  -> -12,
          b.1    -> -16,
          tmp.6  -> -20,
          tmp.9  -> -24,
          tmp.12 -> -28,
        }}}
     ])
