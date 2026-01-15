(Asm.Program
   [Asm.Function {name = "f"; global = true;
      instructions =
      [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Reg Asm.DI), (Asm.Stack -16)));
        (Asm.Mov ((Asm.Imm 76), (Asm.Stack -4)));
        (Asm.Cmp ((Asm.Imm 10), (Asm.Stack -16)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8)));
        (Asm.SetCC (Asm.L, (Asm.Stack -8)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -8)));
        (Asm.JmpCC (Asm.E, "f.if.en.1"));
        (Asm.Mov ((Asm.Imm 77), (Asm.Stack -4))); (Asm.Label "f.if.en.1");
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -16)));
        (Asm.JmpCC (Asm.E, "f.if.en.2"));
        (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.DI))); (Asm.Call "putchar");
        (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -12)));
        (Asm.Label "f.if.en.2"); (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX)));
        Asm.Ret];
      frame =
      Env.lenv {
        namespace = "f";
        counter = 4;
        offset = -16;
        stack slots = {
          x.2   -> -4,
          tmp.0 -> -8,
          tmp.3 -> -12,
          arg.1 -> -16,
        }}};
     Asm.Function {name = "main"; global = true;
       instructions =
       [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.DI)));
         (Asm.Call "f"); (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -4)));
         (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.DI))); (Asm.Call "f");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -8)));
         (Asm.Mov ((Asm.Imm 11), (Asm.Reg Asm.DI))); (Asm.Call "f");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -12)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         namespace = "main";
         counter = 3;
         offset = -12;
         stack slots = {
           tmp.0 -> -4,
           tmp.1 -> -8,
           tmp.2 -> -12,
         }}}
     ])
