(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 32L);
         dst = (Asm.Reg Asm.SP)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L); dst = (Asm.Stack -4)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L); dst = (Asm.Stack -8)};
        (Asm.Label "loop.st.1");
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 10L);
          dst = (Asm.Stack -8)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -12)};
        (Asm.SetCC (Asm.L, (Asm.Stack -12)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -12)};
        (Asm.JmpCC (Asm.E, "loop.br.1"));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -8);
          dst = (Asm.Reg Asm.AX)};
        (Asm.Cdq Asm.Longword);
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 2L);
          dst = (Asm.Reg Asm.R10)};
        Asm.Idiv {typ = Asm.Longword; src = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.DX);
          dst = (Asm.Stack -16)};
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -16)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -20)};
        (Asm.SetCC (Asm.E, (Asm.Stack -20)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -20)};
        (Asm.JmpCC (Asm.NE, "swit.cs.2.3")); (Asm.Jmp "swit.df.2");
        (Asm.Label "swit.cs.2.3"); (Asm.Jmp "loop.ct.1");
        (Asm.Label "swit.df.2");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -4);
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -24)};
        Asm.Binary {op = Asm.Add; typ = Asm.Longword; src = (Asm.Imm 1L);
          dst = (Asm.Stack -24)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -24);
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -4)};
        (Asm.Label "loop.ct.1");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -8);
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -28)};
        Asm.Binary {op = Asm.Add; typ = Asm.Longword; src = (Asm.Imm 1L);
          dst = (Asm.Stack -28)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -28);
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -8)};
        (Asm.Jmp "loop.st.1"); (Asm.Label "loop.br.1");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -4);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 5;
        offset = -28;
        stack slots = {
          sum.0      -> -4,
          i.1        -> -8,
          main.tmp.0 -> -12,
          main.tmp.1 -> -16,
          main.tmp.2 -> -20,
          main.tmp.3 -> -24,
          main.tmp.4 -> -28,
        }}}
     ])
