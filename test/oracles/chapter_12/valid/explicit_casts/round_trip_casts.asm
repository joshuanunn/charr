(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 48L);
         dst = (Asm.Reg Asm.SP)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Data "a");
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -4)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -4);
          dst = (Asm.Reg Asm.R11)};
        Asm.Mov {typ = Asm.Quadword; src = (Asm.Reg Asm.R11);
          dst = (Asm.Stack -16)};
        Asm.Mov {typ = Asm.Quadword; src = (Asm.Imm 4294967284L);
          dst = (Asm.Reg Asm.R10)};
        Asm.Cmp {typ = Asm.Quadword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -16)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -20)};
        (Asm.SetCC (Asm.NE, (Asm.Stack -20)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -20)};
        (Asm.JmpCC (Asm.E, "main.if.en.3"));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret; (Asm.Label "main.if.en.3");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Data "a");
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -24)};
        Asm.Movsx {src = (Asm.Stack -24); dst = (Asm.Reg Asm.R11)};
        Asm.Mov {typ = Asm.Quadword; src = (Asm.Reg Asm.R11);
          dst = (Asm.Stack -32)};
        Asm.Cmp {typ = Asm.Quadword; src = (Asm.Imm -12L);
          dst = (Asm.Stack -32)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -36)};
        (Asm.SetCC (Asm.NE, (Asm.Stack -36)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -36)};
        (Asm.JmpCC (Asm.E, "main.if.en.7"));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 2L);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret; (Asm.Label "main.if.en.7");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 8;
        offset = -36;
        stack slots = {
          main.tmp.0 -> -4,
          main.tmp.1 -> -16,
          main.tmp.2 -> -20,
          main.tmp.4 -> -24,
          main.tmp.5 -> -32,
          main.tmp.6 -> -36,
        }}};
     Asm.StaticVariable {name = "a"; global = true; alignment = 8;
       init = (Ctype.ULongInit 8589934580L)}
     ])
