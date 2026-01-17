(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 64); (Asm.Mov ((Asm.Imm 3), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 10), (Asm.Stack -8)));
        (Asm.Mov ((Asm.Imm 2147483647), (Asm.Stack -12)));
        (Asm.Mov ((Asm.Imm -2147483647), (Asm.Stack -20)));
        (Asm.Mov ((Asm.Stack -20), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -16)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Data "zero")));
        (Asm.JmpCC (Asm.E, "main.if.en.1"));
        (Asm.Mov ((Asm.Imm 3), (Asm.Reg Asm.AX))); Asm.Cdq;
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.R10)));
        (Asm.Idiv (Asm.Reg Asm.R10));
        (Asm.Mov ((Asm.Reg Asm.DX), (Asm.Stack -24)));
        (Asm.Mov ((Asm.Stack -24), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 10), (Asm.Reg Asm.AX))); Asm.Cdq;
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.R10)));
        (Asm.Idiv (Asm.Reg Asm.R10));
        (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -28)));
        (Asm.Mov ((Asm.Stack -28), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -8)));
        (Asm.Mov ((Asm.Imm 2147483657), (Asm.Stack -32)));
        (Asm.Mov ((Asm.Stack -32), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -12)));
        (Asm.Mov ((Asm.Stack -20), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -36)));
        Asm.Binary {op = Asm.Sub; src = (Asm.Imm 10); dst = (Asm.Stack -36)};
        (Asm.Mov ((Asm.Stack -36), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -16)));
        (Asm.Label "main.if.en.1"); (Asm.Cmp ((Asm.Imm 3), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -40)));
        (Asm.SetCC (Asm.NE, (Asm.Stack -40)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -40)));
        (Asm.JmpCC (Asm.E, "main.if.en.7"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Label "main.if.en.7"); (Asm.Cmp ((Asm.Imm 10), (Asm.Stack -8)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -44)));
        (Asm.SetCC (Asm.NE, (Asm.Stack -44)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -44)));
        (Asm.JmpCC (Asm.E, "main.if.en.9"));
        (Asm.Mov ((Asm.Imm 2), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Label "main.if.en.9");
        (Asm.Cmp ((Asm.Imm 2147483647), (Asm.Stack -12)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -48)));
        (Asm.SetCC (Asm.NE, (Asm.Stack -48)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -48)));
        (Asm.JmpCC (Asm.E, "main.if.en.11"));
        (Asm.Mov ((Asm.Imm 3), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Label "main.if.en.11");
        (Asm.Cmp ((Asm.Imm -2147483647), (Asm.Stack -16)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -56)));
        (Asm.SetCC (Asm.NE, (Asm.Stack -56)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -56)));
        (Asm.JmpCC (Asm.E, "main.if.en.14"));
        (Asm.Mov ((Asm.Imm 4), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Label "main.if.en.14");
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 15;
        offset = -56;
        stack slots = {
          w.0    -> -4,
          x.1    -> -8,
          y.2    -> -12,
          z.3    -> -16,
          tmp.0  -> -20,
          tmp.2  -> -24,
          tmp.3  -> -28,
          tmp.4  -> -32,
          tmp.5  -> -36,
          tmp.6  -> -40,
          tmp.8  -> -44,
          tmp.10 -> -48,
          tmp.12 -> -52,
          tmp.13 -> -56,
        }}};
     Asm.StaticVariable {name = "zero"; global = false; init = 0}])
