(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 32); (Asm.Mov ((Asm.Imm 9), (Asm.Reg Asm.AX)));
        Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 2;
        offset = -20;
        stack slots = {
          a.0   -> -4,
          b.1   -> -8,
          c.2   -> -12,
          tmp.0 -> -16,
          tmp.1 -> -20,
        }}}
     ])
