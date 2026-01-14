(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 5), (Asm.Reg Asm.AX)));
        Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 1;
        offset = -12;
        stack slots = {
          return_val.0 -> -4,
          void2.1      -> -8,
          tmp.0        -> -12,
        }}}
     ])
