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
          a.0   -> -4,
          b.2   -> -8,
          c.1   -> -12,
          tmp.2 -> -16,
          tmp.5 -> -20,
        }}}
     ])
