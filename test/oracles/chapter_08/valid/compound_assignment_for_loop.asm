(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 16L);
         dst = (Asm.Reg Asm.SP)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm -1L);
          dst = (Asm.Stack -4)};
        (Asm.Label "loop.st.1");
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm -100L);
          dst = (Asm.Stack -4)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L); dst = (Asm.Stack -8)};
        (Asm.SetCC (Asm.GE, (Asm.Stack -8)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L); dst = (Asm.Stack -8)};
        (Asm.JmpCC (Asm.E, "loop.br.1"));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -4);
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -12)};
        Asm.Binary {op = Asm.Sub; typ = Asm.Longword; src = (Asm.Imm 3L);
          dst = (Asm.Stack -12)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -12);
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -4)};
        (Asm.Jmp "loop.st.1"); (Asm.Label "loop.br.1");
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm -103L);
          dst = (Asm.Stack -4)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -16)};
        (Asm.SetCC (Asm.E, (Asm.Stack -16)));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -16);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 7;
        offset = -16;
        stack slots = {
          i.0        -> -4,
          main.tmp.3 -> -8,
          main.tmp.4 -> -12,
          main.tmp.6 -> -16,
        }}}
     ])
