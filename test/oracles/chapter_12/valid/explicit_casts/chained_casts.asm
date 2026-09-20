(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 48L);
         dst = (Asm.Reg Asm.SP)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Data "ui");
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -4)};
        Asm.Movsx {src = (Asm.Stack -4); dst = (Asm.Reg Asm.R11)};
        Asm.Mov {typ = Asm.Quadword; src = (Asm.Reg Asm.R11);
          dst = (Asm.Stack -16)};
        Asm.Cmp {typ = Asm.Quadword; src = (Asm.Imm -96L);
          dst = (Asm.Stack -16)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -20)};
        (Asm.SetCC (Asm.NE, (Asm.Stack -20)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -20)};
        (Asm.JmpCC (Asm.E, "main.if.en.4"));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret; (Asm.Label "main.if.en.4");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Data "ui");
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -24)};
        Asm.Movsx {src = (Asm.Stack -24); dst = (Asm.Reg Asm.R11)};
        Asm.Mov {typ = Asm.Quadword; src = (Asm.Reg Asm.R11);
          dst = (Asm.Stack -32)};
        Asm.Cmp {typ = Asm.Quadword; src = (Asm.Imm -96L);
          dst = (Asm.Stack -32)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -36)};
        (Asm.SetCC (Asm.NE, (Asm.Stack -36)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -36)};
        (Asm.JmpCC (Asm.E, "main.if.en.8"));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 2L);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret; (Asm.Label "main.if.en.8");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret]};
     Asm.StaticVariable {name = "ui"; global = true; alignment = 4;
       init = (Ctype.UIntInit -96l)}
     ])
