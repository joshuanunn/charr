(Asm.Program
   [Asm.Function {name = "test_sum"; global = true;
      instructions =
      [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 80L);
         dst = (Asm.Reg Asm.SP)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.DI);
          dst = (Asm.Stack -4)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.SI);
          dst = (Asm.Stack -8)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.DX);
          dst = (Asm.Stack -12)};
        Asm.Mov {typ = Asm.Quadword; src = (Asm.Reg Asm.CX);
          dst = (Asm.Stack -24)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R8);
          dst = (Asm.Stack -28)};
        Asm.Mov {typ = Asm.Quadword; src = (Asm.Reg Asm.R9);
          dst = (Asm.Stack -40)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack 16);
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -44)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack 24);
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -48)};
        Asm.Mov {typ = Asm.Quadword; src = (Asm.Stack 32);
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Quadword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -56)};
        Asm.Mov {typ = Asm.Quadword; src = (Asm.Stack -24);
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Quadword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -64)};
        Asm.Mov {typ = Asm.Quadword; src = (Asm.Stack -40);
          dst = (Asm.Reg Asm.R10)};
        Asm.Binary {op = Asm.Add; typ = Asm.Quadword;
          src = (Asm.Reg Asm.R10); dst = (Asm.Stack -64)};
        Asm.Cmp {typ = Asm.Quadword; src = (Asm.Imm 100L);
          dst = (Asm.Stack -64)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -68)};
        (Asm.SetCC (Asm.L, (Asm.Stack -68)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -68)};
        (Asm.JmpCC (Asm.E, "test_sum.if.en.2"));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret; (Asm.Label "test_sum.if.en.2");
        Asm.Cmp {typ = Asm.Quadword; src = (Asm.Imm 100L);
          dst = (Asm.Stack -56)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -72)};
        (Asm.SetCC (Asm.L, (Asm.Stack -72)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -72)};
        (Asm.JmpCC (Asm.E, "test_sum.if.en.4"));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 2L);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret; (Asm.Label "test_sum.if.en.4");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret];
      frame =
      Env.lenv {
        namespace = "test_sum";
        counter = 5;
        offset = -72;
        stack slots = {
          a.0   -> -4,
          b.1   -> -8,
          c.2   -> -12,
          d.3   -> -24,
          e.4   -> -28,
          f.5   -> -40,
          g.6   -> -44,
          h.7   -> -48,
          i.8   -> -56,
          tmp.0 -> -64,
          tmp.1 -> -68,
          tmp.3 -> -72,
        }}}
     ])
