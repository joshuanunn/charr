(Asm.Program
   [Asm.Function {name = "inner_loop1"; global = true;
      instructions =
      [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 80L);
         dst = (Asm.Reg Asm.SP)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.DI);
          dst = (Asm.Stack -4)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.SI);
          dst = (Asm.Stack -8)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.DX);
          dst = (Asm.Stack -12)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.CX);
          dst = (Asm.Stack -16)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R8);
          dst = (Asm.Stack -20)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R9);
          dst = (Asm.Stack -24)};
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 1L); dst = (Asm.Stack -4)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -28)};
        (Asm.SetCC (Asm.NE, (Asm.Stack -28)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -28)};
        (Asm.JmpCC (Asm.NE, "inner_loop1.or.tr.3"));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 11L);
          dst = (Asm.Stack -8)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -32)};
        (Asm.SetCC (Asm.NE, (Asm.Stack -32)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -32)};
        (Asm.JmpCC (Asm.NE, "inner_loop1.or.tr.3"));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -36)};
        (Asm.Jmp "inner_loop1.or.en.4"); (Asm.Label "inner_loop1.or.tr.3");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
          dst = (Asm.Stack -36)};
        (Asm.Label "inner_loop1.or.en.4");
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -36)};
        (Asm.JmpCC (Asm.NE, "inner_loop1.or.tr.7"));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 12L);
          dst = (Asm.Stack -12)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -40)};
        (Asm.SetCC (Asm.NE, (Asm.Stack -40)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -40)};
        (Asm.JmpCC (Asm.NE, "inner_loop1.or.tr.7"));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -44)};
        (Asm.Jmp "inner_loop1.or.en.8"); (Asm.Label "inner_loop1.or.tr.7");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
          dst = (Asm.Stack -44)};
        (Asm.Label "inner_loop1.or.en.8");
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -44)};
        (Asm.JmpCC (Asm.NE, "inner_loop1.or.tr.11"));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 4L);
          dst = (Asm.Stack -16)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -48)};
        (Asm.SetCC (Asm.NE, (Asm.Stack -48)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -48)};
        (Asm.JmpCC (Asm.NE, "inner_loop1.or.tr.11"));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -52)};
        (Asm.Jmp "inner_loop1.or.en.12"); (Asm.Label "inner_loop1.or.tr.11");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
          dst = (Asm.Stack -52)};
        (Asm.Label "inner_loop1.or.en.12");
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -52)};
        (Asm.JmpCC (Asm.NE, "inner_loop1.or.tr.15"));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 20L);
          dst = (Asm.Stack -20)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -56)};
        (Asm.SetCC (Asm.NE, (Asm.Stack -56)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -56)};
        (Asm.JmpCC (Asm.NE, "inner_loop1.or.tr.15"));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -60)};
        (Asm.Jmp "inner_loop1.or.en.16"); (Asm.Label "inner_loop1.or.tr.15");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
          dst = (Asm.Stack -60)};
        (Asm.Label "inner_loop1.or.en.16");
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -60)};
        (Asm.JmpCC (Asm.NE, "inner_loop1.or.tr.19"));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 100L);
          dst = (Asm.Stack -24)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -64)};
        (Asm.SetCC (Asm.NE, (Asm.Stack -64)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -64)};
        (Asm.JmpCC (Asm.NE, "inner_loop1.or.tr.19"));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -68)};
        (Asm.Jmp "inner_loop1.or.en.20"); (Asm.Label "inner_loop1.or.tr.19");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
          dst = (Asm.Stack -68)};
        (Asm.Label "inner_loop1.or.en.20");
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -68)};
        (Asm.JmpCC (Asm.E, "inner_loop1.if.en.21"));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret; (Asm.Label "inner_loop1.if.en.21");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret];
      frame =
      Env.lenv {
        namespace = "inner_loop1";
        counter = 22;
        offset = -68;
        stack slots = {
          a.0    -> -4,
          b.1    -> -8,
          c.2    -> -12,
          d.3    -> -16,
          e.4    -> -20,
          f.5    -> -24,
          tmp.0  -> -28,
          tmp.1  -> -32,
          tmp.2  -> -36,
          tmp.5  -> -40,
          tmp.6  -> -44,
          tmp.9  -> -48,
          tmp.10 -> -52,
          tmp.13 -> -56,
          tmp.14 -> -60,
          tmp.17 -> -64,
          tmp.18 -> -68,
        }}};
     Asm.Function {name = "inner_loop2"; global = true;
       instructions =
       [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 128L);
          dst = (Asm.Reg Asm.SP)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.DI);
           dst = (Asm.Stack -4)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.SI);
           dst = (Asm.Stack -8)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.DX);
           dst = (Asm.Stack -12)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.CX);
           dst = (Asm.Stack -16)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R8);
           dst = (Asm.Stack -20)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R9);
           dst = (Asm.Stack -24)};
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Data "outer_flag")};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -28)};
         (Asm.SetCC (Asm.E, (Asm.Stack -28)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -28)};
         (Asm.JmpCC (Asm.E, "inner_loop2.if.el.2"));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 1L);
           dst = (Asm.Stack -4)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -32)};
         (Asm.SetCC (Asm.NE, (Asm.Stack -32)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -32)};
         (Asm.JmpCC (Asm.NE, "inner_loop2.or.tr.6"));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 2L);
           dst = (Asm.Stack -8)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -36)};
         (Asm.SetCC (Asm.NE, (Asm.Stack -36)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -36)};
         (Asm.JmpCC (Asm.NE, "inner_loop2.or.tr.6"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -40)};
         (Asm.Jmp "inner_loop2.or.en.7"); (Asm.Label "inner_loop2.or.tr.6");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
           dst = (Asm.Stack -40)};
         (Asm.Label "inner_loop2.or.en.7");
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -40)};
         (Asm.JmpCC (Asm.NE, "inner_loop2.or.tr.10"));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 3L);
           dst = (Asm.Stack -12)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -44)};
         (Asm.SetCC (Asm.NE, (Asm.Stack -44)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -44)};
         (Asm.JmpCC (Asm.NE, "inner_loop2.or.tr.10"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -48)};
         (Asm.Jmp "inner_loop2.or.en.11");
         (Asm.Label "inner_loop2.or.tr.10");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
           dst = (Asm.Stack -48)};
         (Asm.Label "inner_loop2.or.en.11");
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -48)};
         (Asm.JmpCC (Asm.NE, "inner_loop2.or.tr.14"));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 4L);
           dst = (Asm.Stack -16)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -52)};
         (Asm.SetCC (Asm.NE, (Asm.Stack -52)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -52)};
         (Asm.JmpCC (Asm.NE, "inner_loop2.or.tr.14"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -56)};
         (Asm.Jmp "inner_loop2.or.en.15");
         (Asm.Label "inner_loop2.or.tr.14");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
           dst = (Asm.Stack -56)};
         (Asm.Label "inner_loop2.or.en.15");
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -56)};
         (Asm.JmpCC (Asm.NE, "inner_loop2.or.tr.18"));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 5L);
           dst = (Asm.Stack -20)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -60)};
         (Asm.SetCC (Asm.NE, (Asm.Stack -60)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -60)};
         (Asm.JmpCC (Asm.NE, "inner_loop2.or.tr.18"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -64)};
         (Asm.Jmp "inner_loop2.or.en.19");
         (Asm.Label "inner_loop2.or.tr.18");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
           dst = (Asm.Stack -64)};
         (Asm.Label "inner_loop2.or.en.19");
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -64)};
         (Asm.JmpCC (Asm.NE, "inner_loop2.or.tr.22"));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 100L);
           dst = (Asm.Stack -24)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -68)};
         (Asm.SetCC (Asm.NE, (Asm.Stack -68)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -68)};
         (Asm.JmpCC (Asm.NE, "inner_loop2.or.tr.22"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -72)};
         (Asm.Jmp "inner_loop2.or.en.23");
         (Asm.Label "inner_loop2.or.tr.22");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
           dst = (Asm.Stack -72)};
         (Asm.Label "inner_loop2.or.en.23");
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -72)};
         (Asm.JmpCC (Asm.E, "inner_loop2.if.en.24"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret; (Asm.Label "inner_loop2.if.en.24");
         (Asm.Jmp "inner_loop2.if.en.1"); (Asm.Label "inner_loop2.if.el.2");
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 10L);
           dst = (Asm.Stack -4)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -76)};
         (Asm.SetCC (Asm.NE, (Asm.Stack -76)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -76)};
         (Asm.JmpCC (Asm.NE, "inner_loop2.or.tr.28"));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 11L);
           dst = (Asm.Stack -8)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -80)};
         (Asm.SetCC (Asm.NE, (Asm.Stack -80)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -80)};
         (Asm.JmpCC (Asm.NE, "inner_loop2.or.tr.28"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -84)};
         (Asm.Jmp "inner_loop2.or.en.29");
         (Asm.Label "inner_loop2.or.tr.28");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
           dst = (Asm.Stack -84)};
         (Asm.Label "inner_loop2.or.en.29");
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -84)};
         (Asm.JmpCC (Asm.NE, "inner_loop2.or.tr.32"));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 12L);
           dst = (Asm.Stack -12)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -88)};
         (Asm.SetCC (Asm.NE, (Asm.Stack -88)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -88)};
         (Asm.JmpCC (Asm.NE, "inner_loop2.or.tr.32"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -92)};
         (Asm.Jmp "inner_loop2.or.en.33");
         (Asm.Label "inner_loop2.or.tr.32");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
           dst = (Asm.Stack -92)};
         (Asm.Label "inner_loop2.or.en.33");
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -92)};
         (Asm.JmpCC (Asm.NE, "inner_loop2.or.tr.36"));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 4L);
           dst = (Asm.Stack -16)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -96)};
         (Asm.SetCC (Asm.NE, (Asm.Stack -96)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -96)};
         (Asm.JmpCC (Asm.NE, "inner_loop2.or.tr.36"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -100)};
         (Asm.Jmp "inner_loop2.or.en.37");
         (Asm.Label "inner_loop2.or.tr.36");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
           dst = (Asm.Stack -100)};
         (Asm.Label "inner_loop2.or.en.37");
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -100)};
         (Asm.JmpCC (Asm.NE, "inner_loop2.or.tr.40"));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 20L);
           dst = (Asm.Stack -20)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -104)};
         (Asm.SetCC (Asm.NE, (Asm.Stack -104)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -104)};
         (Asm.JmpCC (Asm.NE, "inner_loop2.or.tr.40"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -108)};
         (Asm.Jmp "inner_loop2.or.en.41");
         (Asm.Label "inner_loop2.or.tr.40");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
           dst = (Asm.Stack -108)};
         (Asm.Label "inner_loop2.or.en.41");
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -108)};
         (Asm.JmpCC (Asm.NE, "inner_loop2.or.tr.44"));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 100L);
           dst = (Asm.Stack -24)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -112)};
         (Asm.SetCC (Asm.NE, (Asm.Stack -112)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -112)};
         (Asm.JmpCC (Asm.NE, "inner_loop2.or.tr.44"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -116)};
         (Asm.Jmp "inner_loop2.or.en.45");
         (Asm.Label "inner_loop2.or.tr.44");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
           dst = (Asm.Stack -116)};
         (Asm.Label "inner_loop2.or.en.45");
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -116)};
         (Asm.JmpCC (Asm.E, "inner_loop2.if.en.46"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret; (Asm.Label "inner_loop2.if.en.46");
         (Asm.Label "inner_loop2.if.en.1");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret];
       frame =
       Env.lenv {
         namespace = "inner_loop2";
         counter = 47;
         offset = -116;
         stack slots = {
           a.6    -> -4,
           b.7    -> -8,
           c.8    -> -12,
           d.9    -> -16,
           e.10   -> -20,
           f.11   -> -24,
           tmp.0  -> -28,
           tmp.3  -> -32,
           tmp.4  -> -36,
           tmp.5  -> -40,
           tmp.8  -> -44,
           tmp.9  -> -48,
           tmp.12 -> -52,
           tmp.13 -> -56,
           tmp.16 -> -60,
           tmp.17 -> -64,
           tmp.20 -> -68,
           tmp.21 -> -72,
           tmp.25 -> -76,
           tmp.26 -> -80,
           tmp.27 -> -84,
           tmp.30 -> -88,
           tmp.31 -> -92,
           tmp.34 -> -96,
           tmp.35 -> -100,
           tmp.38 -> -104,
           tmp.39 -> -108,
           tmp.42 -> -112,
           tmp.43 -> -116,
         }}};
     Asm.Function {name = "inner_loop3"; global = true;
       instructions =
       [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 176L);
          dst = (Asm.Reg Asm.SP)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.DI);
           dst = (Asm.Stack -4)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.SI);
           dst = (Asm.Stack -8)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.DX);
           dst = (Asm.Stack -12)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.CX);
           dst = (Asm.Stack -16)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R8);
           dst = (Asm.Stack -20)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R9);
           dst = (Asm.Stack -24)};
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Data "outer_flag")};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -28)};
         (Asm.SetCC (Asm.E, (Asm.Stack -28)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -28)};
         (Asm.JmpCC (Asm.E, "inner_loop3.if.el.2"));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 2L);
           dst = (Asm.Data "inner_flag")};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -32)};
         (Asm.SetCC (Asm.E, (Asm.Stack -32)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -32)};
         (Asm.JmpCC (Asm.E, "inner_loop3.if.el.5"));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 1L);
           dst = (Asm.Stack -4)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -36)};
         (Asm.SetCC (Asm.NE, (Asm.Stack -36)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -36)};
         (Asm.JmpCC (Asm.NE, "inner_loop3.or.tr.9"));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 11L);
           dst = (Asm.Stack -8)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -40)};
         (Asm.SetCC (Asm.NE, (Asm.Stack -40)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -40)};
         (Asm.JmpCC (Asm.NE, "inner_loop3.or.tr.9"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -44)};
         (Asm.Jmp "inner_loop3.or.en.10"); (Asm.Label "inner_loop3.or.tr.9");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
           dst = (Asm.Stack -44)};
         (Asm.Label "inner_loop3.or.en.10");
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -44)};
         (Asm.JmpCC (Asm.NE, "inner_loop3.or.tr.13"));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 3L);
           dst = (Asm.Stack -12)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -48)};
         (Asm.SetCC (Asm.NE, (Asm.Stack -48)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -48)};
         (Asm.JmpCC (Asm.NE, "inner_loop3.or.tr.13"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -52)};
         (Asm.Jmp "inner_loop3.or.en.14");
         (Asm.Label "inner_loop3.or.tr.13");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
           dst = (Asm.Stack -52)};
         (Asm.Label "inner_loop3.or.en.14");
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -52)};
         (Asm.JmpCC (Asm.NE, "inner_loop3.or.tr.17"));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 4L);
           dst = (Asm.Stack -16)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -56)};
         (Asm.SetCC (Asm.NE, (Asm.Stack -56)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -56)};
         (Asm.JmpCC (Asm.NE, "inner_loop3.or.tr.17"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -60)};
         (Asm.Jmp "inner_loop3.or.en.18");
         (Asm.Label "inner_loop3.or.tr.17");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
           dst = (Asm.Stack -60)};
         (Asm.Label "inner_loop3.or.en.18");
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -60)};
         (Asm.JmpCC (Asm.NE, "inner_loop3.or.tr.21"));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 5L);
           dst = (Asm.Stack -20)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -64)};
         (Asm.SetCC (Asm.NE, (Asm.Stack -64)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -64)};
         (Asm.JmpCC (Asm.NE, "inner_loop3.or.tr.21"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -68)};
         (Asm.Jmp "inner_loop3.or.en.22");
         (Asm.Label "inner_loop3.or.tr.21");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
           dst = (Asm.Stack -68)};
         (Asm.Label "inner_loop3.or.en.22");
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -68)};
         (Asm.JmpCC (Asm.NE, "inner_loop3.or.tr.25"));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 100L);
           dst = (Asm.Stack -24)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -72)};
         (Asm.SetCC (Asm.NE, (Asm.Stack -72)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -72)};
         (Asm.JmpCC (Asm.NE, "inner_loop3.or.tr.25"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -76)};
         (Asm.Jmp "inner_loop3.or.en.26");
         (Asm.Label "inner_loop3.or.tr.25");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
           dst = (Asm.Stack -76)};
         (Asm.Label "inner_loop3.or.en.26");
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -76)};
         (Asm.JmpCC (Asm.E, "inner_loop3.if.en.27"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret; (Asm.Label "inner_loop3.if.en.27");
         (Asm.Jmp "inner_loop3.if.en.4"); (Asm.Label "inner_loop3.if.el.5");
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 1L);
           dst = (Asm.Stack -4)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -80)};
         (Asm.SetCC (Asm.NE, (Asm.Stack -80)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -80)};
         (Asm.JmpCC (Asm.NE, "inner_loop3.or.tr.31"));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 11L);
           dst = (Asm.Stack -8)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -84)};
         (Asm.SetCC (Asm.NE, (Asm.Stack -84)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -84)};
         (Asm.JmpCC (Asm.NE, "inner_loop3.or.tr.31"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -88)};
         (Asm.Jmp "inner_loop3.or.en.32");
         (Asm.Label "inner_loop3.or.tr.31");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
           dst = (Asm.Stack -88)};
         (Asm.Label "inner_loop3.or.en.32");
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -88)};
         (Asm.JmpCC (Asm.NE, "inner_loop3.or.tr.35"));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 12L);
           dst = (Asm.Stack -12)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -92)};
         (Asm.SetCC (Asm.NE, (Asm.Stack -92)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -92)};
         (Asm.JmpCC (Asm.NE, "inner_loop3.or.tr.35"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -96)};
         (Asm.Jmp "inner_loop3.or.en.36");
         (Asm.Label "inner_loop3.or.tr.35");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
           dst = (Asm.Stack -96)};
         (Asm.Label "inner_loop3.or.en.36");
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -96)};
         (Asm.JmpCC (Asm.NE, "inner_loop3.or.tr.39"));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 4L);
           dst = (Asm.Stack -16)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -100)};
         (Asm.SetCC (Asm.NE, (Asm.Stack -100)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -100)};
         (Asm.JmpCC (Asm.NE, "inner_loop3.or.tr.39"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -104)};
         (Asm.Jmp "inner_loop3.or.en.40");
         (Asm.Label "inner_loop3.or.tr.39");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
           dst = (Asm.Stack -104)};
         (Asm.Label "inner_loop3.or.en.40");
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -104)};
         (Asm.JmpCC (Asm.NE, "inner_loop3.or.tr.43"));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 5L);
           dst = (Asm.Stack -20)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -108)};
         (Asm.SetCC (Asm.NE, (Asm.Stack -108)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -108)};
         (Asm.JmpCC (Asm.NE, "inner_loop3.or.tr.43"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -112)};
         (Asm.Jmp "inner_loop3.or.en.44");
         (Asm.Label "inner_loop3.or.tr.43");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
           dst = (Asm.Stack -112)};
         (Asm.Label "inner_loop3.or.en.44");
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -112)};
         (Asm.JmpCC (Asm.NE, "inner_loop3.or.tr.47"));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 100L);
           dst = (Asm.Stack -24)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -116)};
         (Asm.SetCC (Asm.NE, (Asm.Stack -116)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -116)};
         (Asm.JmpCC (Asm.NE, "inner_loop3.or.tr.47"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -120)};
         (Asm.Jmp "inner_loop3.or.en.48");
         (Asm.Label "inner_loop3.or.tr.47");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
           dst = (Asm.Stack -120)};
         (Asm.Label "inner_loop3.or.en.48");
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -120)};
         (Asm.JmpCC (Asm.E, "inner_loop3.if.en.49"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret; (Asm.Label "inner_loop3.if.en.49");
         (Asm.Label "inner_loop3.if.en.4"); (Asm.Jmp "inner_loop3.if.en.1");
         (Asm.Label "inner_loop3.if.el.2");
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 10L);
           dst = (Asm.Stack -4)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -124)};
         (Asm.SetCC (Asm.NE, (Asm.Stack -124)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -124)};
         (Asm.JmpCC (Asm.NE, "inner_loop3.or.tr.53"));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 11L);
           dst = (Asm.Stack -8)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -128)};
         (Asm.SetCC (Asm.NE, (Asm.Stack -128)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -128)};
         (Asm.JmpCC (Asm.NE, "inner_loop3.or.tr.53"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -132)};
         (Asm.Jmp "inner_loop3.or.en.54");
         (Asm.Label "inner_loop3.or.tr.53");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
           dst = (Asm.Stack -132)};
         (Asm.Label "inner_loop3.or.en.54");
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -132)};
         (Asm.JmpCC (Asm.NE, "inner_loop3.or.tr.57"));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 12L);
           dst = (Asm.Stack -12)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -136)};
         (Asm.SetCC (Asm.NE, (Asm.Stack -136)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -136)};
         (Asm.JmpCC (Asm.NE, "inner_loop3.or.tr.57"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -140)};
         (Asm.Jmp "inner_loop3.or.en.58");
         (Asm.Label "inner_loop3.or.tr.57");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
           dst = (Asm.Stack -140)};
         (Asm.Label "inner_loop3.or.en.58");
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -140)};
         (Asm.JmpCC (Asm.NE, "inner_loop3.or.tr.61"));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 4L);
           dst = (Asm.Stack -16)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -144)};
         (Asm.SetCC (Asm.NE, (Asm.Stack -144)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -144)};
         (Asm.JmpCC (Asm.NE, "inner_loop3.or.tr.61"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -148)};
         (Asm.Jmp "inner_loop3.or.en.62");
         (Asm.Label "inner_loop3.or.tr.61");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
           dst = (Asm.Stack -148)};
         (Asm.Label "inner_loop3.or.en.62");
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -148)};
         (Asm.JmpCC (Asm.NE, "inner_loop3.or.tr.65"));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 20L);
           dst = (Asm.Stack -20)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -152)};
         (Asm.SetCC (Asm.NE, (Asm.Stack -152)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -152)};
         (Asm.JmpCC (Asm.NE, "inner_loop3.or.tr.65"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -156)};
         (Asm.Jmp "inner_loop3.or.en.66");
         (Asm.Label "inner_loop3.or.tr.65");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
           dst = (Asm.Stack -156)};
         (Asm.Label "inner_loop3.or.en.66");
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -156)};
         (Asm.JmpCC (Asm.NE, "inner_loop3.or.tr.69"));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 100L);
           dst = (Asm.Stack -24)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -160)};
         (Asm.SetCC (Asm.NE, (Asm.Stack -160)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -160)};
         (Asm.JmpCC (Asm.NE, "inner_loop3.or.tr.69"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -164)};
         (Asm.Jmp "inner_loop3.or.en.70");
         (Asm.Label "inner_loop3.or.tr.69");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
           dst = (Asm.Stack -164)};
         (Asm.Label "inner_loop3.or.en.70");
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -164)};
         (Asm.JmpCC (Asm.E, "inner_loop3.if.en.71"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret; (Asm.Label "inner_loop3.if.en.71");
         (Asm.Label "inner_loop3.if.en.1");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret];
       frame =
       Env.lenv {
         namespace = "inner_loop3";
         counter = 72;
         offset = -164;
         stack slots = {
           a.12   -> -4,
           b.13   -> -8,
           c.14   -> -12,
           d.15   -> -16,
           e.16   -> -20,
           f.17   -> -24,
           tmp.0  -> -28,
           tmp.3  -> -32,
           tmp.6  -> -36,
           tmp.7  -> -40,
           tmp.8  -> -44,
           tmp.11 -> -48,
           tmp.12 -> -52,
           tmp.15 -> -56,
           tmp.16 -> -60,
           tmp.19 -> -64,
           tmp.20 -> -68,
           tmp.23 -> -72,
           tmp.24 -> -76,
           tmp.28 -> -80,
           tmp.29 -> -84,
           tmp.30 -> -88,
           tmp.33 -> -92,
           tmp.34 -> -96,
           tmp.37 -> -100,
           tmp.38 -> -104,
           tmp.41 -> -108,
           tmp.42 -> -112,
           tmp.45 -> -116,
           tmp.46 -> -120,
           tmp.50 -> -124,
           tmp.51 -> -128,
           tmp.52 -> -132,
           tmp.55 -> -136,
           tmp.56 -> -140,
           tmp.59 -> -144,
           tmp.60 -> -148,
           tmp.63 -> -152,
           tmp.64 -> -156,
           tmp.67 -> -160,
           tmp.68 -> -164,
         }}};
     Asm.Function {name = "inner_loop4"; global = true;
       instructions =
       [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 48L);
          dst = (Asm.Reg Asm.SP)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.DI);
           dst = (Asm.Stack -4)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.SI);
           dst = (Asm.Stack -8)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.DX);
           dst = (Asm.Stack -12)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.CX);
           dst = (Asm.Stack -16)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R8);
           dst = (Asm.Stack -20)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R9);
           dst = (Asm.Stack -24)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -4);
           dst = (Asm.Reg Asm.R10)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -28)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -8);
           dst = (Asm.Reg Asm.R10)};
         Asm.Binary {op = Asm.Add; typ = Asm.Longword;
           src = (Asm.Reg Asm.R10); dst = (Asm.Stack -28)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -28);
           dst = (Asm.Reg Asm.R10)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -32)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -12);
           dst = (Asm.Reg Asm.R10)};
         Asm.Binary {op = Asm.Add; typ = Asm.Longword;
           src = (Asm.Reg Asm.R10); dst = (Asm.Stack -32)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -32);
           dst = (Asm.Reg Asm.R10)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -36)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -16);
           dst = (Asm.Reg Asm.R10)};
         Asm.Binary {op = Asm.Add; typ = Asm.Longword;
           src = (Asm.Reg Asm.R10); dst = (Asm.Stack -36)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -36);
           dst = (Asm.Reg Asm.R10)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -40)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -20);
           dst = (Asm.Reg Asm.R10)};
         Asm.Binary {op = Asm.Add; typ = Asm.Longword;
           src = (Asm.Reg Asm.R10); dst = (Asm.Stack -40)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -40);
           dst = (Asm.Reg Asm.R10)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -44)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -24);
           dst = (Asm.Reg Asm.R10)};
         Asm.Binary {op = Asm.Add; typ = Asm.Longword;
           src = (Asm.Reg Asm.R10); dst = (Asm.Stack -44)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -44);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret];
       frame =
       Env.lenv {
         namespace = "inner_loop4";
         counter = 5;
         offset = -44;
         stack slots = {
           a.18  -> -4,
           b.19  -> -8,
           c.20  -> -12,
           d.21  -> -16,
           e.22  -> -20,
           f.23  -> -24,
           tmp.0 -> -28,
           tmp.1 -> -32,
           tmp.2 -> -36,
           tmp.3 -> -40,
           tmp.4 -> -44,
         }}};
     Asm.Function {name = "validate"; global = true;
       instructions =
       [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 80L);
          dst = (Asm.Reg Asm.SP)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.DI);
           dst = (Asm.Stack -4)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.SI);
           dst = (Asm.Stack -8)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.DX);
           dst = (Asm.Stack -12)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.CX);
           dst = (Asm.Stack -16)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R8);
           dst = (Asm.Stack -20)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R9);
           dst = (Asm.Stack -24)};
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 10L);
           dst = (Asm.Stack -4)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -28)};
         (Asm.SetCC (Asm.NE, (Asm.Stack -28)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -28)};
         (Asm.JmpCC (Asm.NE, "validate.or.tr.3"));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 11L);
           dst = (Asm.Stack -8)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -32)};
         (Asm.SetCC (Asm.NE, (Asm.Stack -32)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -32)};
         (Asm.JmpCC (Asm.NE, "validate.or.tr.3"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -36)};
         (Asm.Jmp "validate.or.en.4"); (Asm.Label "validate.or.tr.3");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
           dst = (Asm.Stack -36)};
         (Asm.Label "validate.or.en.4");
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -36)};
         (Asm.JmpCC (Asm.NE, "validate.or.tr.7"));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 12L);
           dst = (Asm.Stack -12)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -40)};
         (Asm.SetCC (Asm.NE, (Asm.Stack -40)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -40)};
         (Asm.JmpCC (Asm.NE, "validate.or.tr.7"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -44)};
         (Asm.Jmp "validate.or.en.8"); (Asm.Label "validate.or.tr.7");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
           dst = (Asm.Stack -44)};
         (Asm.Label "validate.or.en.8");
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -44)};
         (Asm.JmpCC (Asm.NE, "validate.or.tr.11"));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 4L);
           dst = (Asm.Stack -16)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -48)};
         (Asm.SetCC (Asm.NE, (Asm.Stack -48)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -48)};
         (Asm.JmpCC (Asm.NE, "validate.or.tr.11"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -52)};
         (Asm.Jmp "validate.or.en.12"); (Asm.Label "validate.or.tr.11");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
           dst = (Asm.Stack -52)};
         (Asm.Label "validate.or.en.12");
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -52)};
         (Asm.JmpCC (Asm.NE, "validate.or.tr.15"));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 20L);
           dst = (Asm.Stack -20)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -56)};
         (Asm.SetCC (Asm.NE, (Asm.Stack -56)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -56)};
         (Asm.JmpCC (Asm.NE, "validate.or.tr.15"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -60)};
         (Asm.Jmp "validate.or.en.16"); (Asm.Label "validate.or.tr.15");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
           dst = (Asm.Stack -60)};
         (Asm.Label "validate.or.en.16");
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -60)};
         (Asm.JmpCC (Asm.NE, "validate.or.tr.19"));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 100L);
           dst = (Asm.Stack -24)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -64)};
         (Asm.SetCC (Asm.NE, (Asm.Stack -64)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -64)};
         (Asm.JmpCC (Asm.NE, "validate.or.tr.19"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -68)};
         (Asm.Jmp "validate.or.en.20"); (Asm.Label "validate.or.tr.19");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
           dst = (Asm.Stack -68)};
         (Asm.Label "validate.or.en.20");
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -68)};
         (Asm.JmpCC (Asm.E, "validate.if.en.21"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret; (Asm.Label "validate.if.en.21");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret];
       frame =
       Env.lenv {
         namespace = "validate";
         counter = 22;
         offset = -68;
         stack slots = {
           a.24   -> -4,
           b.25   -> -8,
           c.26   -> -12,
           d.27   -> -16,
           e.28   -> -20,
           f.29   -> -24,
           tmp.0  -> -28,
           tmp.1  -> -32,
           tmp.2  -> -36,
           tmp.5  -> -40,
           tmp.6  -> -44,
           tmp.9  -> -48,
           tmp.10 -> -52,
           tmp.13 -> -56,
           tmp.14 -> -60,
           tmp.17 -> -64,
           tmp.18 -> -68,
         }}};
     Asm.Function {name = "target"; global = true;
       instructions =
       [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 96L);
          dst = (Asm.Reg Asm.SP)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
           dst = (Asm.Stack -4)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 2L);
           dst = (Asm.Stack -8)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 3L);
           dst = (Asm.Stack -12)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 4L);
           dst = (Asm.Stack -16)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 5L);
           dst = (Asm.Stack -20)};
         (Asm.Label "loop.ct.1");
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 2L);
           dst = (Asm.Data "outer_flag")};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -24)};
         (Asm.SetCC (Asm.L, (Asm.Stack -24)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -24)};
         (Asm.JmpCC (Asm.E, "loop.br.1")); (Asm.Label "loop.ct.2");
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 1L);
           dst = (Asm.Data "inner_flag")};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -28)};
         (Asm.SetCC (Asm.L, (Asm.Stack -28)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -28)};
         (Asm.JmpCC (Asm.E, "loop.br.2"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -4);
           dst = (Asm.Reg Asm.DI)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -8);
           dst = (Asm.Reg Asm.SI)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -12);
           dst = (Asm.Reg Asm.DX)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -16);
           dst = (Asm.Reg Asm.CX)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -20);
           dst = (Asm.Reg Asm.R8)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 100L);
           dst = (Asm.Reg Asm.R9)};
         (Asm.Call "inner_loop1");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
           dst = (Asm.Stack -32)};
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -32)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -36)};
         (Asm.SetCC (Asm.E, (Asm.Stack -36)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -36)};
         (Asm.JmpCC (Asm.E, "target.if.en.4"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret; (Asm.Label "target.if.en.4");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 10L);
           dst = (Asm.Stack -4)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
           dst = (Asm.Data "inner_flag")};
         (Asm.Jmp "loop.ct.2"); (Asm.Label "loop.br.2");
         (Asm.Label "loop.ct.3");
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 2L);
           dst = (Asm.Data "inner_flag")};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -40)};
         (Asm.SetCC (Asm.L, (Asm.Stack -40)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -40)};
         (Asm.JmpCC (Asm.E, "loop.br.3"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -4);
           dst = (Asm.Reg Asm.DI)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -8);
           dst = (Asm.Reg Asm.SI)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -12);
           dst = (Asm.Reg Asm.DX)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -16);
           dst = (Asm.Reg Asm.CX)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -20);
           dst = (Asm.Reg Asm.R8)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 100L);
           dst = (Asm.Reg Asm.R9)};
         (Asm.Call "inner_loop2");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
           dst = (Asm.Stack -44)};
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -44)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -48)};
         (Asm.SetCC (Asm.E, (Asm.Stack -48)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -48)};
         (Asm.JmpCC (Asm.E, "target.if.en.8"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 2L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret; (Asm.Label "target.if.en.8");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 11L);
           dst = (Asm.Stack -8)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 2L);
           dst = (Asm.Data "inner_flag")};
         (Asm.Jmp "loop.ct.3"); (Asm.Label "loop.br.3");
         (Asm.Label "loop.ct.4");
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 4L);
           dst = (Asm.Data "inner_flag")};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -52)};
         (Asm.SetCC (Asm.L, (Asm.Stack -52)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -52)};
         (Asm.JmpCC (Asm.E, "loop.br.4"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -4);
           dst = (Asm.Reg Asm.DI)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -8);
           dst = (Asm.Reg Asm.SI)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -12);
           dst = (Asm.Reg Asm.DX)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -16);
           dst = (Asm.Reg Asm.CX)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -20);
           dst = (Asm.Reg Asm.R8)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 100L);
           dst = (Asm.Reg Asm.R9)};
         (Asm.Call "inner_loop3");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
           dst = (Asm.Stack -56)};
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -56)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -60)};
         (Asm.SetCC (Asm.E, (Asm.Stack -60)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -60)};
         (Asm.JmpCC (Asm.E, "target.if.en.12"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 3L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret; (Asm.Label "target.if.en.12");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Data "inner_flag");
           dst = (Asm.Reg Asm.R10)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -64)};
         Asm.Binary {op = Asm.Add; typ = Asm.Longword; src = (Asm.Imm 1L);
           dst = (Asm.Stack -64)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -64);
           dst = (Asm.Reg Asm.R10)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Data "inner_flag")};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 12L);
           dst = (Asm.Stack -12)};
         (Asm.Jmp "loop.ct.4"); (Asm.Label "loop.br.4");
         (Asm.Label "loop.ct.5");
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 4L);
           dst = (Asm.Data "inner_flag")};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -68)};
         (Asm.SetCC (Asm.L, (Asm.Stack -68)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -68)};
         (Asm.JmpCC (Asm.E, "loop.br.5"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -4);
           dst = (Asm.Reg Asm.DI)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -8);
           dst = (Asm.Reg Asm.SI)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -12);
           dst = (Asm.Reg Asm.DX)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -16);
           dst = (Asm.Reg Asm.CX)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -20);
           dst = (Asm.Reg Asm.R8)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 100L);
           dst = (Asm.Reg Asm.R9)};
         (Asm.Call "inner_loop4");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
           dst = (Asm.Stack -72)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 13L);
           dst = (Asm.Stack -16)};
         (Asm.Jmp "loop.ct.5"); (Asm.Label "loop.br.5");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 20L);
           dst = (Asm.Stack -20)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Data "outer_flag");
           dst = (Asm.Reg Asm.R10)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -76)};
         Asm.Binary {op = Asm.Add; typ = Asm.Longword; src = (Asm.Imm 1L);
           dst = (Asm.Stack -76)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -76);
           dst = (Asm.Reg Asm.R10)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Data "outer_flag")};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Data "inner_flag")};
         (Asm.Jmp "loop.ct.1"); (Asm.Label "loop.br.1");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -4);
           dst = (Asm.Reg Asm.DI)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -8);
           dst = (Asm.Reg Asm.SI)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -12);
           dst = (Asm.Reg Asm.DX)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -16);
           dst = (Asm.Reg Asm.CX)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -20);
           dst = (Asm.Reg Asm.R8)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 100L);
           dst = (Asm.Reg Asm.R9)};
         (Asm.Call "validate");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
           dst = (Asm.Stack -80)};
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -80)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -84)};
         (Asm.SetCC (Asm.E, (Asm.Stack -84)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -84)};
         (Asm.JmpCC (Asm.E, "target.if.en.19"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 4L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret; (Asm.Label "target.if.en.19");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret];
       frame =
       Env.lenv {
         namespace = "target";
         counter = 20;
         offset = -84;
         stack slots = {
           a.30   -> -4,
           b.31   -> -8,
           c.32   -> -12,
           d.33   -> -16,
           e.34   -> -20,
           tmp.0  -> -24,
           tmp.1  -> -28,
           tmp.2  -> -32,
           tmp.3  -> -36,
           tmp.5  -> -40,
           tmp.6  -> -44,
           tmp.7  -> -48,
           tmp.9  -> -52,
           tmp.10 -> -56,
           tmp.11 -> -60,
           tmp.13 -> -64,
           tmp.14 -> -68,
           tmp.15 -> -72,
           tmp.16 -> -76,
           tmp.17 -> -80,
           tmp.18 -> -84,
         }}};
     Asm.Function {name = "main"; global = true;
       instructions =
       [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 16L);
          dst = (Asm.Reg Asm.SP)};
         (Asm.Call "target");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
           dst = (Asm.Stack -4)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -4);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret];
       frame =
       Env.lenv {
         namespace = "main";
         counter = 1;
         offset = -4;
         stack slots = {
           tmp.0 -> -4,
         }}};
     Asm.StaticVariable {name = "outer_flag"; global = false; alignment = 4;
       init = (Ctype.IntInit 0l)};
     Asm.StaticVariable {name = "inner_flag"; global = false; alignment = 4;
       init = (Ctype.IntInit 1l)}
     ])
