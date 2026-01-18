(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 32); (Asm.Mov ((Asm.Imm 76), (Asm.Reg Asm.AX)));
        Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 5;
        offset = -20;
        stack slots = {
          tmp.0 -> -4,
          tmp.1 -> -8,
          tmp.2 -> -12,
          tmp.3 -> -16,
          tmp.4 -> -20,
        }}}
     ])
