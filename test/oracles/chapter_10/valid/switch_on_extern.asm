(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 16L);
         dst = (Asm.Reg Asm.SP)};
        (Asm.Call "update_x");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
          dst = (Asm.Stack -4)};
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L); dst = (Asm.Data "x")};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L); dst = (Asm.Stack -8)};
        (Asm.SetCC (Asm.E, (Asm.Stack -8)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L); dst = (Asm.Stack -8)};
        (Asm.JmpCC (Asm.NE, "swit.cs.1.2"));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 1L); dst = (Asm.Data "x")};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -12)};
        (Asm.SetCC (Asm.E, (Asm.Stack -12)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -12)};
        (Asm.JmpCC (Asm.NE, "swit.cs.1.3"));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 4L); dst = (Asm.Data "x")};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -16)};
        (Asm.SetCC (Asm.E, (Asm.Stack -16)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -16)};
        (Asm.JmpCC (Asm.NE, "swit.cs.1.4")); (Asm.Jmp "swit.df.1");
        (Asm.Label "swit.cs.1.2");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret; (Asm.Label "swit.cs.1.3");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 2L);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret; (Asm.Label "swit.cs.1.4");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret; (Asm.Label "swit.df.1");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 4L);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret]};
     Asm.Function {name = "update_x"; global = true;
       instructions =
       [Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 4L); dst = (Asm.Data "x")};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret]};
     Asm.StaticVariable {name = "x"; global = true; alignment = 4;
       init = (Ctype.IntInit 0l)}
     ])
