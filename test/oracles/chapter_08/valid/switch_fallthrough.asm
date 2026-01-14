(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 48); (Asm.Mov ((Asm.Imm 6), (Asm.Reg Asm.AX)));
        Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 8;
        offset = -36;
        stack slots = {
          a.0   -> -4,
          b.1   -> -8,
          c.2   -> -12,
          tmp.0 -> -16,
          tmp.3 -> -20,
          tmp.4 -> -24,
          tmp.5 -> -28,
          tmp.6 -> -32,
          tmp.7 -> -36,
        }}}
     ])
