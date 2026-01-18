(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 96); (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.AX)));
        Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 37;
        offset = -96;
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
          e.4    -> -52,
          tmp.16 -> -56,
          tmp.19 -> -60,
          tmp.20 -> -64,
          tmp.21 -> -68,
          tmp.22 -> -72,
          tmp.25 -> -76,
          tmp.26 -> -80,
          tmp.29 -> -84,
          tmp.30 -> -88,
          tmp.33 -> -92,
          tmp.34 -> -96,
        }}}
     ])
