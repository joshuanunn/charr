(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 48L);
         dst = (Asm.Reg Asm.SP)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm -1L);
          dst = (Asm.Stack -4)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm -1L);
          dst = (Asm.Data "y")};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Data "x");
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -8)};
        Asm.Shl {typ = Asm.Longword; src = (Asm.Imm 1L); dst = (Asm.Stack -8)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -8);
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -12)};
        Asm.Binary {op = Asm.BwOr; typ = Asm.Longword; src = (Asm.Imm 1L);
          dst = (Asm.Stack -12)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -12);
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Data "x")};
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 3L);
          dst = (Asm.Stack -12)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -16)};
        (Asm.SetCC (Asm.NE, (Asm.Stack -16)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -16)};
        (Asm.JmpCC (Asm.E, "main.if.en.4"));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret; (Asm.Label "main.if.en.4");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm -5L);
          dst = (Asm.Stack -20)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -4);
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -24)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -20);
          dst = (Asm.Reg Asm.R10)};
        Asm.Binary {op = Asm.BwAnd; typ = Asm.Longword;
          src = (Asm.Reg Asm.R10); dst = (Asm.Stack -24)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -24);
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -28)};
        Asm.Binary {op = Asm.BwXor; typ = Asm.Longword; src = (Asm.Imm 12L);
          dst = (Asm.Stack -28)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -28);
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -32)};
        Asm.Sar {typ = Asm.Longword; src = (Asm.Imm 2L);
          dst = (Asm.Stack -32)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -32);
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Data "y")};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm -3L);
          dst = (Asm.Stack -36)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -36);
          dst = (Asm.Reg Asm.R10)};
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -32)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -40)};
        (Asm.SetCC (Asm.NE, (Asm.Stack -40)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -40)};
        (Asm.JmpCC (Asm.E, "main.if.en.11"));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 2L);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret; (Asm.Label "main.if.en.11");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 12;
        offset = -40;
        stack slots = {
          tmp.0  -> -4,
          tmp.1  -> -8,
          tmp.2  -> -12,
          tmp.3  -> -16,
          tmp.5  -> -20,
          tmp.6  -> -24,
          tmp.7  -> -28,
          tmp.8  -> -32,
          tmp.9  -> -36,
          tmp.10 -> -40,
        }}};
     Asm.StaticVariable {name = "x"; global = true; alignment = 4;
       init = (Ctype.IntInit 1l)};
     Asm.StaticVariable {name = "y"; global = true; alignment = 4;
       init = (Ctype.IntInit 0l)}
     ])
