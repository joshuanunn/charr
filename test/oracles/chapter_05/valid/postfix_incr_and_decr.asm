(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 64); (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.AX)));
        Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 15;
        offset = -52;
        stack slots = {
          a.0    -> -4,
          b.1    -> -8,
          c.2    -> -12,
          tmp.0  -> -16,
          d.3    -> -20,
          tmp.1  -> -24,
          tmp.2  -> -28,
          tmp.3  -> -32,
          tmp.4  -> -36,
          tmp.7  -> -40,
          tmp.8  -> -44,
          tmp.11 -> -48,
          tmp.12 -> -52,
        }}}
     ])
