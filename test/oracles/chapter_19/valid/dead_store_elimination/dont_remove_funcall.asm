(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 67), (Asm.Reg Asm.DI)));
        (Asm.Call "putchar"); (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -8)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 1;
        offset = -8;
        stack slots = {
          x.1   -> -4,
          tmp.0 -> -8,
        }}}
     ])
