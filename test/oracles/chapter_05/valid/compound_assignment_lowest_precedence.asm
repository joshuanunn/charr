(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 80); (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.AX)));
        Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 29;
        offset = -76;
        stack slots = {
          a.0    -> -4,
          b.1    -> -8,
          tmp.0  -> -12,
          tmp.3  -> -16,
          tmp.4  -> -20,
          tmp.7  -> -24,
          c.2    -> -28,
          tmp.8  -> -32,
          tmp.11 -> -36,
          d.3    -> -40,
          tmp.12 -> -44,
          tmp.15 -> -48,
          tmp.16 -> -52,
          tmp.17 -> -56,
          tmp.18 -> -60,
          tmp.21 -> -64,
          tmp.22 -> -68,
          tmp.25 -> -72,
          tmp.26 -> -76,
        }}}
     ])
