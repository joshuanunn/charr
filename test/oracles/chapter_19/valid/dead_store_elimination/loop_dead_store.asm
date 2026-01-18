(Asm.Program
   [Asm.Function {name = "target"; global = true;
      instructions =
      [(Asm.AllocateStack 48); (Asm.Mov ((Asm.Imm 65), (Asm.Stack -8)));
        (Asm.Label "loop.st.1");
        (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -12)));
        Asm.Binary {op = Asm.Add; src = (Asm.Imm 2); dst = (Asm.Stack -12)};
        (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -4)));
        (Asm.Cmp ((Asm.Imm 70), (Asm.Stack -8)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -16)));
        (Asm.SetCC (Asm.G, (Asm.Stack -16)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -16)));
        (Asm.JmpCC (Asm.E, "target.if.en.2"));
        (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -20)));
        Asm.Binary {op = Asm.Add; src = (Asm.Imm 3); dst = (Asm.Stack -20)};
        (Asm.Mov ((Asm.Stack -20), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -4)));
        (Asm.Label "target.if.en.2");
        (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.DI))); (Asm.Call "putchar");
        (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -24)));
        (Asm.Mov ((Asm.Stack -24), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -28)));
        Asm.Binary {op = Asm.Add; src = (Asm.Imm 3); dst = (Asm.Stack -28)};
        (Asm.Mov ((Asm.Stack -28), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -8)));
        (Asm.Cmp ((Asm.Imm 90), (Asm.Stack -28)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -32)));
        (Asm.SetCC (Asm.L, (Asm.Stack -32)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -32)));
        (Asm.JmpCC (Asm.NE, "loop.st.1"));
        (Asm.Cmp ((Asm.Imm 90), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -36)));
        (Asm.SetCC (Asm.NE, (Asm.Stack -36)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -36)));
        (Asm.JmpCC (Asm.E, "target.if.en.8"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Label "target.if.en.8");
        (Asm.Cmp ((Asm.Imm 93), (Asm.Stack -28)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -40)));
        (Asm.SetCC (Asm.NE, (Asm.Stack -40)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -40)));
        (Asm.JmpCC (Asm.E, "target.if.en.10"));
        (Asm.Mov ((Asm.Imm 2), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Label "target.if.en.10");
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "target";
        counter = 11;
        offset = -40;
        stack slots = {
          x.1   -> -4,
          y.2   -> -8,
          tmp.0 -> -12,
          tmp.1 -> -16,
          tmp.3 -> -20,
          tmp.4 -> -24,
          tmp.5 -> -28,
          tmp.6 -> -32,
          tmp.7 -> -36,
          tmp.9 -> -40,
        }}};
     Asm.Function {name = "main"; global = true;
       instructions =
       [(Asm.AllocateStack 16); (Asm.Call "target");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -4)));
         (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         namespace = "main";
         counter = 1;
         offset = -4;
         stack slots = {
           tmp.0 -> -4,
         }}}
     ])
