(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 64L);
         dst = (Asm.Reg Asm.SP)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L); dst = (Asm.Stack -4)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L); dst = (Asm.Stack -8)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -12)};
        (Asm.Label "loop.st.1");
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 10L);
          dst = (Asm.Stack -12)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -16)};
        (Asm.SetCC (Asm.L, (Asm.Stack -16)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -16)};
        (Asm.JmpCC (Asm.E, "loop.br.1"));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -12)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -20)};
        (Asm.SetCC (Asm.E, (Asm.Stack -20)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -20)};
        (Asm.JmpCC (Asm.NE, "swit.cs.2.0"));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 1L);
          dst = (Asm.Stack -12)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -24)};
        (Asm.SetCC (Asm.E, (Asm.Stack -24)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -24)};
        (Asm.JmpCC (Asm.NE, "swit.cs.2.1"));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 2L);
          dst = (Asm.Stack -12)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -28)};
        (Asm.SetCC (Asm.E, (Asm.Stack -28)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -28)};
        (Asm.JmpCC (Asm.NE, "swit.cs.2.2")); (Asm.Jmp "swit.df.2");
        (Asm.Label "swit.cs.2.0");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 2L); dst = (Asm.Stack -4)};
        (Asm.Jmp "swit.br.2"); (Asm.Label "swit.cs.2.1");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -4);
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -32)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -32);
          dst = (Asm.Reg Asm.R11)};
        Asm.Binary {op = Asm.Mult; typ = Asm.Longword; src = (Asm.Imm 3L);
          dst = (Asm.Reg Asm.R11)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R11);
          dst = (Asm.Stack -32)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -32);
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -4)};
        (Asm.Jmp "swit.br.2"); (Asm.Label "swit.cs.2.2");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -4);
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -36)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -36);
          dst = (Asm.Reg Asm.R11)};
        Asm.Binary {op = Asm.Mult; typ = Asm.Longword; src = (Asm.Imm 4L);
          dst = (Asm.Reg Asm.R11)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R11);
          dst = (Asm.Stack -36)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -36);
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -4)};
        (Asm.Jmp "swit.br.2"); (Asm.Label "swit.df.2");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -4);
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -40)};
        Asm.Binary {op = Asm.Add; typ = Asm.Longword; src = (Asm.Imm 1L);
          dst = (Asm.Stack -40)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -40);
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -4)};
        (Asm.Label "swit.br.2");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -8);
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -44)};
        Asm.Binary {op = Asm.Add; typ = Asm.Longword; src = (Asm.Imm 1L);
          dst = (Asm.Stack -44)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -44);
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -8)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -12);
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -48)};
        Asm.Binary {op = Asm.Add; typ = Asm.Longword; src = (Asm.Imm 1L);
          dst = (Asm.Stack -48)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -48);
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -12)};
        (Asm.Jmp "loop.st.1"); (Asm.Label "loop.br.1");
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 10L);
          dst = (Asm.Stack -8)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -52)};
        (Asm.SetCC (Asm.E, (Asm.Stack -52)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -52)};
        (Asm.JmpCC (Asm.E, "main.and.fl.12"));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 31L);
          dst = (Asm.Stack -4)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -56)};
        (Asm.SetCC (Asm.E, (Asm.Stack -56)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -56)};
        (Asm.JmpCC (Asm.E, "main.and.fl.12"));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
          dst = (Asm.Stack -60)};
        (Asm.Jmp "main.and.en.13"); (Asm.Label "main.and.fl.12");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -60)};
        (Asm.Label "main.and.en.13");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -60);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 14;
        offset = -60;
        stack slots = {
          acc.0  -> -4,
          ctr.1  -> -8,
          i.2    -> -12,
          tmp.0  -> -16,
          tmp.1  -> -20,
          tmp.2  -> -24,
          tmp.3  -> -28,
          tmp.4  -> -32,
          tmp.5  -> -36,
          tmp.6  -> -40,
          tmp.7  -> -44,
          tmp.8  -> -48,
          tmp.9  -> -52,
          tmp.10 -> -56,
          tmp.11 -> -60,
        }}}
     ])
