(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 128); (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.AX)));
        Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 36;
        offset = -124;
        stack slots = {
          a.0    -> -4,
          b.1    -> -8,
          c.2    -> -12,
          d.3    -> -16,
          e.4    -> -20,
          tmp.0  -> -24,
          f.5    -> -28,
          x.6    -> -32,
          tmp.1  -> -36,
          tmp.2  -> -40,
          tmp.3  -> -44,
          tmp.4  -> -48,
          tmp.5  -> -52,
          tmp.6  -> -56,
          tmp.7  -> -60,
          tmp.8  -> -64,
          tmp.9  -> -68,
          tmp.12 -> -72,
          tmp.13 -> -76,
          tmp.14 -> -80,
          tmp.17 -> -84,
          tmp.18 -> -88,
          tmp.19 -> -92,
          tmp.22 -> -96,
          tmp.23 -> -100,
          tmp.24 -> -104,
          tmp.27 -> -108,
          tmp.28 -> -112,
          tmp.29 -> -116,
          tmp.32 -> -120,
          tmp.33 -> -124,
        }}}
     ])
