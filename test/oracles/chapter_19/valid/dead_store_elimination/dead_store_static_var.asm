(Asm.Program
   [Asm.Function {name = "target"; global = true;
      instructions =
      [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Reg Asm.DI), (Asm.Stack -8)));
        (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Data "i")));
        (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -4)));
        Asm.Binary {op = Asm.Add; src = (Asm.Imm 1); dst = (Asm.Stack -4)};
        (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "target";
        counter = 1;
        offset = -8;
        stack slots = {
          tmp.0 -> -4,
          arg.0 -> -8,
        }}};
     Asm.Function {name = "main"; global = true;
       instructions =
       [(Asm.AllocateStack 48); (Asm.Mov ((Asm.Imm 2), (Asm.Reg Asm.DI)));
         (Asm.Call "target"); (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -8)));
         (Asm.Cmp ((Asm.Imm 2), (Asm.Data "i")));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -12)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -12)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -12)));
         (Asm.JmpCC (Asm.E, "main.if.en.2"));
         (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "main.if.en.2"); (Asm.Cmp ((Asm.Imm 3), (Asm.Stack -8)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -16)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -16)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -16)));
         (Asm.JmpCC (Asm.E, "main.if.en.4"));
         (Asm.Mov ((Asm.Imm 2), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "main.if.en.4");
         (Asm.Mov ((Asm.Imm -1), (Asm.Reg Asm.DI))); (Asm.Call "target");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -28)));
         (Asm.Cmp ((Asm.Imm -1), (Asm.Data "i")));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -36)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -36)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -36)));
         (Asm.JmpCC (Asm.E, "main.if.en.9"));
         (Asm.Mov ((Asm.Imm 3), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "main.if.en.9");
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -28)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -40)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -40)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -40)));
         (Asm.JmpCC (Asm.E, "main.if.en.11"));
         (Asm.Mov ((Asm.Imm 4), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "main.if.en.11");
         (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         namespace = "main";
         counter = 12;
         offset = -40;
         stack slots = {
           result1.1 -> -4,
           tmp.0     -> -8,
           tmp.1     -> -12,
           tmp.3     -> -16,
           result2.2 -> -20,
           tmp.5     -> -24,
           tmp.6     -> -28,
           tmp.7     -> -32,
           tmp.8     -> -36,
           tmp.10    -> -40,
         }}};
     Asm.StaticVariable {name = "i"; global = true; init = 0}])
