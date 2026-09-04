(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 16L);
         dst = (Asm.Reg Asm.SP)};
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 1L); dst = (Asm.Data "a")};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L); dst = (Asm.Stack -4)};
        (Asm.SetCC (Asm.E, (Asm.Stack -4)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L); dst = (Asm.Stack -4)};
        (Asm.JmpCC (Asm.NE, "swit.cs.1.2"));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 3L); dst = (Asm.Data "a")};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L); dst = (Asm.Stack -8)};
        (Asm.SetCC (Asm.E, (Asm.Stack -8)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L); dst = (Asm.Stack -8)};
        (Asm.JmpCC (Asm.NE, "swit.cs.1.3")); (Asm.Jmp "swit.br.1");
        (Asm.Label "swit.cs.1.2");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Data "x.0")};
        (Asm.Label "swit.cs.1.3");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Data "x.0");
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret; (Asm.Label "swit.br.1");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 2;
        offset = -8;
        stack slots = {
          main.tmp.0 -> -4,
          main.tmp.1 -> -8,
        }}};
     Asm.StaticVariable {name = "x.0"; global = false; alignment = 4;
       init = (Ctype.IntInit 10l)};
     Asm.StaticVariable {name = "a"; global = true; alignment = 4;
       init = (Ctype.IntInit 3l)}
     ])
