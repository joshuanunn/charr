(Asm.Program
   [Asm.Function {name = "target"; global = true;
      instructions =
      [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 48L);
         dst = (Asm.Reg Asm.SP)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 65L);
          dst = (Asm.Stack -4)};
        (Asm.Label "loop.st.1");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -4);
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -8)};
        Asm.Binary {op = Asm.Add; typ = Asm.Longword; src = (Asm.Imm 2L);
          dst = (Asm.Stack -8)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -8);
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -12)};
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 70L);
          dst = (Asm.Stack -4)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -16)};
        (Asm.SetCC (Asm.G, (Asm.Stack -16)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -16)};
        (Asm.JmpCC (Asm.E, "target.if.en.2"));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -4);
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -20)};
        Asm.Binary {op = Asm.Add; typ = Asm.Longword; src = (Asm.Imm 3L);
          dst = (Asm.Stack -20)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -20);
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -12)};
        (Asm.Label "target.if.en.2");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -12);
          dst = (Asm.Reg Asm.DI)};
        (Asm.Call "putchar");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
          dst = (Asm.Stack -24)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -24);
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -28)};
        Asm.Binary {op = Asm.Add; typ = Asm.Longword; src = (Asm.Imm 3L);
          dst = (Asm.Stack -28)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -28);
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -4)};
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 90L);
          dst = (Asm.Stack -28)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -32)};
        (Asm.SetCC (Asm.L, (Asm.Stack -32)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -32)};
        (Asm.JmpCC (Asm.NE, "loop.st.1"));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 90L);
          dst = (Asm.Stack -12)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -36)};
        (Asm.SetCC (Asm.NE, (Asm.Stack -36)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -36)};
        (Asm.JmpCC (Asm.E, "target.if.en.8"));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret; (Asm.Label "target.if.en.8");
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 93L);
          dst = (Asm.Stack -28)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -40)};
        (Asm.SetCC (Asm.NE, (Asm.Stack -40)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -40)};
        (Asm.JmpCC (Asm.E, "target.if.en.10"));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 2L);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret; (Asm.Label "target.if.en.10");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret];
      frame =
      Env.lenv {
        namespace = "target";
        counter = 11;
        offset = -40;
        stack slots = {
          y.2          -> -4,
          target.tmp.0 -> -8,
          x.1          -> -12,
          target.tmp.1 -> -16,
          target.tmp.3 -> -20,
          target.tmp.4 -> -24,
          target.tmp.5 -> -28,
          target.tmp.6 -> -32,
          target.tmp.7 -> -36,
          target.tmp.9 -> -40,
        }}};
     Asm.Function {name = "main"; global = true;
       instructions =
       [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 16L);
          dst = (Asm.Reg Asm.SP)};
         (Asm.Call "target");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
           dst = (Asm.Stack -4)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -4);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret];
       frame =
       Env.lenv {
         namespace = "main";
         counter = 1;
         offset = -4;
         stack slots = {
           main.tmp.0 -> -4,
         }}}
     ])
