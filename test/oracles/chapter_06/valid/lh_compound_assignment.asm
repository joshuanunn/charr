(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 32); (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.AX)));
        Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 6;
        offset = -20;
        stack slots = {
          x.0   -> -4,
          tmp.0 -> -8,
          tmp.1 -> -12,
          tmp.4 -> -16,
          tmp.5 -> -20,
        }}}
     ])
