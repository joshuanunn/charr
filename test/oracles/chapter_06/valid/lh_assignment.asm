(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 32); (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.AX)));
        Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 8;
        offset = -24;
        stack slots = {
          x.0   -> -4,
          y.1   -> -8,
          tmp.0 -> -12,
          tmp.3 -> -16,
          tmp.4 -> -20,
          tmp.5 -> -24,
        }}}
     ])
