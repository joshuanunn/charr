(Asm.Program
   [Asm.Function {name = "test_jz"; global = true;
      instructions =
      [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Reg Asm.DI), (Asm.Stack -8)));
        (Asm.Mov ((Asm.Reg Asm.SI), (Asm.Stack -12)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -8)));
        (Asm.JmpCC (Asm.E, "test_jz.if.en.0"));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -12)));
        (Asm.Label "test_jz.if.en.0");
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -12)));
        (Asm.JmpCC (Asm.E, "test_jz.cond.el.3"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -4)));
        (Asm.Jmp "test_jz.cond.en.2"); (Asm.Label "test_jz.cond.el.3");
        (Asm.Mov ((Asm.Imm 2), (Asm.Stack -4)));
        (Asm.Label "test_jz.cond.en.2");
        (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "test_jz";
        counter = 4;
        offset = -12;
        stack slots = {
          tmp.1  -> -4,
          flag.0 -> -8,
          arg.1  -> -12,
        }}};
     Asm.Function {name = "test_jnz"; global = true;
       instructions =
       [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Reg Asm.DI), (Asm.Stack -8)));
         (Asm.Mov ((Asm.Reg Asm.SI), (Asm.Stack -12)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -8)));
         (Asm.JmpCC (Asm.E, "test_jnz.if.en.0"));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -12)));
         (Asm.Label "test_jnz.if.en.0");
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -12)));
         (Asm.JmpCC (Asm.NE, "test_jnz.or.tr.2"));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4)));
         (Asm.Jmp "test_jnz.or.en.3"); (Asm.Label "test_jnz.or.tr.2");
         (Asm.Mov ((Asm.Imm 1), (Asm.Stack -4)));
         (Asm.Label "test_jnz.or.en.3");
         (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         namespace = "test_jnz";
         counter = 4;
         offset = -12;
         stack slots = {
           tmp.1  -> -4,
           flag.2 -> -8,
           arg.3  -> -12,
         }}};
     Asm.Function {name = "test_binary"; global = true;
       instructions =
       [(Asm.AllocateStack 32);
         (Asm.Mov ((Asm.Reg Asm.DI), (Asm.Stack -16)));
         (Asm.Mov ((Asm.Reg Asm.SI), (Asm.Stack -20)));
         (Asm.Mov ((Asm.Reg Asm.DX), (Asm.Stack -24)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -16)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4)));
         (Asm.SetCC (Asm.E, (Asm.Stack -4)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -4)));
         (Asm.JmpCC (Asm.E, "test_binary.if.el.2"));
         (Asm.Mov ((Asm.Imm 4), (Asm.Stack -20)));
         (Asm.Jmp "test_binary.if.en.1"); (Asm.Label "test_binary.if.el.2");
         (Asm.Cmp ((Asm.Imm 1), (Asm.Stack -16)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8)));
         (Asm.SetCC (Asm.E, (Asm.Stack -8)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -8)));
         (Asm.JmpCC (Asm.E, "test_binary.if.en.4"));
         (Asm.Mov ((Asm.Imm 3), (Asm.Stack -24)));
         (Asm.Label "test_binary.if.en.4");
         (Asm.Label "test_binary.if.en.1");
         (Asm.Mov ((Asm.Stack -20), (Asm.Reg Asm.R10)));
         (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -12)));
         (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.R11)));
         Asm.Binary {op = Asm.Mult; src = (Asm.Stack -24);
           dst = (Asm.Reg Asm.R11)};
         (Asm.Mov ((Asm.Reg Asm.R11), (Asm.Stack -12)));
         (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         namespace = "test_binary";
         counter = 6;
         offset = -24;
         stack slots = {
           tmp.0  -> -4,
           tmp.3  -> -8,
           tmp.5  -> -12,
           flag.4 -> -16,
           arg1.5 -> -20,
           arg2.6 -> -24,
         }}};
     Asm.Function {name = "test_unary"; global = true;
       instructions =
       [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Reg Asm.DI), (Asm.Stack -8)));
         (Asm.Mov ((Asm.Reg Asm.SI), (Asm.Stack -12)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -8)));
         (Asm.JmpCC (Asm.E, "test_unary.if.en.0"));
         (Asm.Mov ((Asm.Imm 5), (Asm.Stack -12)));
         (Asm.Label "test_unary.if.en.0");
         (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.R10)));
         (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -4)));
         Asm.Unary {op = Asm.Neg; dst = (Asm.Stack -4)};
         (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         namespace = "test_unary";
         counter = 2;
         offset = -12;
         stack slots = {
           tmp.1  -> -4,
           flag.7 -> -8,
           arg.8  -> -12,
         }}};
     Asm.Function {name = "f"; global = true;
       instructions =
       [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Reg Asm.DI), (Asm.Stack -8)));
         (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.R10)));
         (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -4)));
         Asm.Binary {op = Asm.Add; src = (Asm.Imm 1); dst = (Asm.Stack -4)};
         (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         namespace = "f";
         counter = 1;
         offset = -8;
         stack slots = {
           tmp.0 -> -4,
           arg.9 -> -8,
         }}};
     Asm.Function {name = "test_funcall"; global = true;
       instructions =
       [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Reg Asm.DI), (Asm.Stack -8)));
         (Asm.Mov ((Asm.Reg Asm.SI), (Asm.Stack -12)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -8)));
         (Asm.JmpCC (Asm.E, "test_funcall.if.en.0"));
         (Asm.Mov ((Asm.Imm 7), (Asm.Stack -12)));
         (Asm.Label "test_funcall.if.en.0");
         (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.DI))); (Asm.Call "f");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -4)));
         (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         namespace = "test_funcall";
         counter = 2;
         offset = -12;
         stack slots = {
           tmp.1   -> -4,
           flag.10 -> -8,
           arg.11  -> -12,
         }}};
     Asm.Function {name = "main"; global = true;
       instructions =
       [(Asm.AllocateStack 96); (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.DI)));
         (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.SI))); (Asm.Call "test_jz");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -4)));
         (Asm.Cmp ((Asm.Imm 2), (Asm.Stack -4)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -8)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -8)));
         (Asm.JmpCC (Asm.E, "main.if.en.2"));
         (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "main.if.en.2");
         (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.DI)));
         (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.SI))); (Asm.Call "test_jz");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -12)));
         (Asm.Cmp ((Asm.Imm 1), (Asm.Stack -12)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -16)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -16)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -16)));
         (Asm.JmpCC (Asm.E, "main.if.en.5"));
         (Asm.Mov ((Asm.Imm 2), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "main.if.en.5");
         (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.DI)));
         (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.SI))); (Asm.Call "test_jnz");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -20)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -20)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -24)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -24)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -24)));
         (Asm.JmpCC (Asm.E, "main.if.en.8"));
         (Asm.Mov ((Asm.Imm 3), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "main.if.en.8");
         (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.DI)));
         (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.SI))); (Asm.Call "test_jnz");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -28)));
         (Asm.Cmp ((Asm.Imm 1), (Asm.Stack -28)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -32)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -32)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -32)));
         (Asm.JmpCC (Asm.E, "main.if.en.11"));
         (Asm.Mov ((Asm.Imm 4), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "main.if.en.11");
         (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.DI)));
         (Asm.Mov ((Asm.Imm 8), (Asm.Reg Asm.SI)));
         (Asm.Mov ((Asm.Imm 9), (Asm.Reg Asm.DX))); (Asm.Call "test_binary");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -36)));
         (Asm.Cmp ((Asm.Imm 36), (Asm.Stack -36)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -40)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -40)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -40)));
         (Asm.JmpCC (Asm.E, "main.if.en.14"));
         (Asm.Mov ((Asm.Imm 5), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "main.if.en.14");
         (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.DI)));
         (Asm.Mov ((Asm.Imm 8), (Asm.Reg Asm.SI)));
         (Asm.Mov ((Asm.Imm 9), (Asm.Reg Asm.DX))); (Asm.Call "test_binary");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -44)));
         (Asm.Cmp ((Asm.Imm 24), (Asm.Stack -44)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -48)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -48)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -48)));
         (Asm.JmpCC (Asm.E, "main.if.en.17"));
         (Asm.Mov ((Asm.Imm 6), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "main.if.en.17");
         (Asm.Mov ((Asm.Imm 2), (Asm.Reg Asm.DI)));
         (Asm.Mov ((Asm.Imm 8), (Asm.Reg Asm.SI)));
         (Asm.Mov ((Asm.Imm 9), (Asm.Reg Asm.DX))); (Asm.Call "test_binary");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -52)));
         (Asm.Cmp ((Asm.Imm 72), (Asm.Stack -52)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -56)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -56)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -56)));
         (Asm.JmpCC (Asm.E, "main.if.en.20"));
         (Asm.Mov ((Asm.Imm 7), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "main.if.en.20");
         (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.DI)));
         (Asm.Mov ((Asm.Imm 8), (Asm.Reg Asm.SI))); (Asm.Call "test_unary");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -60)));
         (Asm.Cmp ((Asm.Imm -8), (Asm.Stack -60)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -68)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -68)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -68)));
         (Asm.JmpCC (Asm.E, "main.if.en.24"));
         (Asm.Mov ((Asm.Imm 8), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "main.if.en.24");
         (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.DI)));
         (Asm.Mov ((Asm.Imm 8), (Asm.Reg Asm.SI))); (Asm.Call "test_unary");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -72)));
         (Asm.Cmp ((Asm.Imm -5), (Asm.Stack -72)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -80)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -80)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -80)));
         (Asm.JmpCC (Asm.E, "main.if.en.28"));
         (Asm.Mov ((Asm.Imm 9), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "main.if.en.28");
         (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.DI)));
         (Asm.Mov ((Asm.Imm 5), (Asm.Reg Asm.SI)));
         (Asm.Call "test_funcall");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -84)));
         (Asm.Cmp ((Asm.Imm 8), (Asm.Stack -84)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -88)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -88)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -88)));
         (Asm.JmpCC (Asm.E, "main.if.en.31"));
         (Asm.Mov ((Asm.Imm 10), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "main.if.en.31");
         (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.DI)));
         (Asm.Mov ((Asm.Imm 9), (Asm.Reg Asm.SI)));
         (Asm.Call "test_funcall");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -92)));
         (Asm.Cmp ((Asm.Imm 10), (Asm.Stack -92)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -96)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -96)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -96)));
         (Asm.JmpCC (Asm.E, "main.if.en.34"));
         (Asm.Mov ((Asm.Imm 11), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "main.if.en.34");
         (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         namespace = "main";
         counter = 35;
         offset = -96;
         stack slots = {
           tmp.0  -> -4,
           tmp.1  -> -8,
           tmp.3  -> -12,
           tmp.4  -> -16,
           tmp.6  -> -20,
           tmp.7  -> -24,
           tmp.9  -> -28,
           tmp.10 -> -32,
           tmp.12 -> -36,
           tmp.13 -> -40,
           tmp.15 -> -44,
           tmp.16 -> -48,
           tmp.18 -> -52,
           tmp.19 -> -56,
           tmp.21 -> -60,
           tmp.22 -> -64,
           tmp.23 -> -68,
           tmp.25 -> -72,
           tmp.26 -> -76,
           tmp.27 -> -80,
           tmp.29 -> -84,
           tmp.30 -> -88,
           tmp.32 -> -92,
           tmp.33 -> -96,
         }}}
     ])
