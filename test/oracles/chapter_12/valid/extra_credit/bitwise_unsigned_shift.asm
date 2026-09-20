(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 16L);
         dst = (Asm.Reg Asm.SP)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1000000L);
          dst = (Asm.Stack -4)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Data "shiftcount.1");
          dst = (Asm.Reg Asm.CX)};
        Asm.Shr {typ = Asm.Longword; src = (Asm.Reg Asm.CX);
          dst = (Asm.Stack -4)};
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 31250L);
          dst = (Asm.Stack -4)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L); dst = (Asm.Stack -8)};
        (Asm.SetCC (Asm.NE, (Asm.Stack -8)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L); dst = (Asm.Stack -8)};
        (Asm.JmpCC (Asm.E, "main.if.en.12"));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 3L);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret; (Asm.Label "main.if.en.12");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1000000L);
          dst = (Asm.Stack -12)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Data "shiftcount.1");
          dst = (Asm.Reg Asm.CX)};
        Asm.Shl {typ = Asm.Longword; src = (Asm.Reg Asm.CX);
          dst = (Asm.Stack -12)};
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 32000000L);
          dst = (Asm.Stack -12)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -16)};
        (Asm.SetCC (Asm.NE, (Asm.Stack -16)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -16)};
        (Asm.JmpCC (Asm.E, "main.if.en.16"));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 4L);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret; (Asm.Label "main.if.en.16");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret]};
     Asm.StaticVariable {name = "shiftcount.1"; global = false;
       alignment = 4; init = (Ctype.IntInit 5l)}
     ])
