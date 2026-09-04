(Asm.Program
   [Asm.Function {name = "foo"; global = true;
      instructions =
      [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 96L);
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
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack 16);
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -28)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack 24);
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -32)};
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 1L); dst = (Asm.Stack -4)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -36)};
        (Asm.SetCC (Asm.E, (Asm.Stack -36)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -36)};
        (Asm.JmpCC (Asm.E, "foo.and.fl.3"));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 2L); dst = (Asm.Stack -8)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -40)};
        (Asm.SetCC (Asm.E, (Asm.Stack -40)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -40)};
        (Asm.JmpCC (Asm.E, "foo.and.fl.3"));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
          dst = (Asm.Stack -44)};
        (Asm.Jmp "foo.and.en.4"); (Asm.Label "foo.and.fl.3");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -44)};
        (Asm.Label "foo.and.en.4");
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -44)};
        (Asm.JmpCC (Asm.E, "foo.and.fl.7"));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 3L);
          dst = (Asm.Stack -12)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -48)};
        (Asm.SetCC (Asm.E, (Asm.Stack -48)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -48)};
        (Asm.JmpCC (Asm.E, "foo.and.fl.7"));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
          dst = (Asm.Stack -52)};
        (Asm.Jmp "foo.and.en.8"); (Asm.Label "foo.and.fl.7");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -52)};
        (Asm.Label "foo.and.en.8");
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -52)};
        (Asm.JmpCC (Asm.E, "foo.and.fl.11"));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 4L);
          dst = (Asm.Stack -16)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -56)};
        (Asm.SetCC (Asm.E, (Asm.Stack -56)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -56)};
        (Asm.JmpCC (Asm.E, "foo.and.fl.11"));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
          dst = (Asm.Stack -60)};
        (Asm.Jmp "foo.and.en.12"); (Asm.Label "foo.and.fl.11");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -60)};
        (Asm.Label "foo.and.en.12");
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -60)};
        (Asm.JmpCC (Asm.E, "foo.and.fl.15"));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 5L);
          dst = (Asm.Stack -20)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -64)};
        (Asm.SetCC (Asm.E, (Asm.Stack -64)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -64)};
        (Asm.JmpCC (Asm.E, "foo.and.fl.15"));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
          dst = (Asm.Stack -68)};
        (Asm.Jmp "foo.and.en.16"); (Asm.Label "foo.and.fl.15");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -68)};
        (Asm.Label "foo.and.en.16");
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -68)};
        (Asm.JmpCC (Asm.E, "foo.and.fl.19"));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 6L);
          dst = (Asm.Stack -24)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -72)};
        (Asm.SetCC (Asm.E, (Asm.Stack -72)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -72)};
        (Asm.JmpCC (Asm.E, "foo.and.fl.19"));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
          dst = (Asm.Stack -76)};
        (Asm.Jmp "foo.and.en.20"); (Asm.Label "foo.and.fl.19");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -76)};
        (Asm.Label "foo.and.en.20");
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -76)};
        (Asm.JmpCC (Asm.E, "foo.and.fl.23"));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 7L);
          dst = (Asm.Stack -28)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -80)};
        (Asm.SetCC (Asm.E, (Asm.Stack -80)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -80)};
        (Asm.JmpCC (Asm.E, "foo.and.fl.23"));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
          dst = (Asm.Stack -84)};
        (Asm.Jmp "foo.and.en.24"); (Asm.Label "foo.and.fl.23");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -84)};
        (Asm.Label "foo.and.en.24");
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -84)};
        (Asm.JmpCC (Asm.E, "foo.and.fl.27"));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 8L);
          dst = (Asm.Stack -32)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -88)};
        (Asm.SetCC (Asm.E, (Asm.Stack -88)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -88)};
        (Asm.JmpCC (Asm.E, "foo.and.fl.27"));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
          dst = (Asm.Stack -92)};
        (Asm.Jmp "foo.and.en.28"); (Asm.Label "foo.and.fl.27");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -92)};
        (Asm.Label "foo.and.en.28");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -92);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret];
      frame =
      Env.lenv {
        namespace = "foo";
        counter = 29;
        offset = -92;
        stack slots = {
          a.0        -> -4,
          b.1        -> -8,
          c.2        -> -12,
          d.3        -> -16,
          e.4        -> -20,
          f.5        -> -24,
          g.6        -> -28,
          h.7        -> -32,
          foo.tmp.0  -> -36,
          foo.tmp.1  -> -40,
          foo.tmp.2  -> -44,
          foo.tmp.5  -> -48,
          foo.tmp.6  -> -52,
          foo.tmp.9  -> -56,
          foo.tmp.10 -> -60,
          foo.tmp.13 -> -64,
          foo.tmp.14 -> -68,
          foo.tmp.17 -> -72,
          foo.tmp.18 -> -76,
          foo.tmp.21 -> -80,
          foo.tmp.22 -> -84,
          foo.tmp.25 -> -88,
          foo.tmp.26 -> -92,
        }}};
     Asm.Function {name = "main"; global = true;
       instructions =
       [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 16L);
          dst = (Asm.Reg Asm.SP)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
           dst = (Asm.Reg Asm.DI)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 2L);
           dst = (Asm.Reg Asm.SI)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 3L);
           dst = (Asm.Reg Asm.DX)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 4L);
           dst = (Asm.Reg Asm.CX)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 5L);
           dst = (Asm.Reg Asm.R8)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 6L);
           dst = (Asm.Reg Asm.R9)};
         (Asm.Push (Asm.Imm 8L)); (Asm.Push (Asm.Imm 7L)); (Asm.Call "foo");
         Asm.Binary {op = Asm.Add; typ = Asm.Quadword; src = (Asm.Imm 16L);
           dst = (Asm.Reg Asm.SP)};
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
           main.tmp.0 -> -4,
         }}}
     ])
