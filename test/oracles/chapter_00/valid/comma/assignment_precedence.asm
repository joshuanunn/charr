(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 22), (Asm.Reg Asm.AX)));
        Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 2;
        offset = -16;
        stack slots = {
          a.0   -> -4,
          b.1   -> -8,
          tmp.0 -> -12,
          tmp.1 -> -16,
        }}}
     ])
