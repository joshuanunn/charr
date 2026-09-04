(Asm.Program
   [Asm.Function {name = "foo"; global = true;
      instructions =
      [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 96L);
         dst = (Asm.Reg Asm.SP)};
        Asm.Mov {typ = Asm.Quadword; src = (Asm.Reg Asm.DI);
          dst = (Asm.Stack -8)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.SI);
          dst = (Asm.Stack -12)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.DX);
          dst = (Asm.Stack -16)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.CX);
          dst = (Asm.Stack -20)};
        Asm.Mov {typ = Asm.Quadword; src = (Asm.Reg Asm.R8);
          dst = (Asm.Stack -32)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R9);
          dst = (Asm.Stack -36)};
        Asm.Mov {typ = Asm.Quadword; src = (Asm.Stack 16);
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Quadword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -48)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack 24);
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -52)};
        Asm.Cmp {typ = Asm.Quadword; src = (Asm.Imm -1L);
          dst = (Asm.Stack -8)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -56)};
        (Asm.SetCC (Asm.NE, (Asm.Stack -56)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -56)};
        (Asm.JmpCC (Asm.E, "foo.if.en.2"));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret; (Asm.Label "foo.if.en.2");
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 2L);
          dst = (Asm.Stack -12)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -60)};
        (Asm.SetCC (Asm.NE, (Asm.Stack -60)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -60)};
        (Asm.JmpCC (Asm.E, "foo.if.en.4"));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 2L);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret; (Asm.Label "foo.if.en.4");
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -16)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -64)};
        (Asm.SetCC (Asm.NE, (Asm.Stack -64)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -64)};
        (Asm.JmpCC (Asm.E, "foo.if.en.6"));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 3L);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret; (Asm.Label "foo.if.en.6");
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm -5L);
          dst = (Asm.Stack -20)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -68)};
        (Asm.SetCC (Asm.NE, (Asm.Stack -68)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -68)};
        (Asm.JmpCC (Asm.E, "foo.if.en.9"));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 4L);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret; (Asm.Label "foo.if.en.9");
        Asm.Cmp {typ = Asm.Quadword; src = (Asm.Imm -101L);
          dst = (Asm.Stack -32)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -72)};
        (Asm.SetCC (Asm.NE, (Asm.Stack -72)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -72)};
        (Asm.JmpCC (Asm.E, "foo.if.en.12"));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 5L);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret; (Asm.Label "foo.if.en.12");
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm -123L);
          dst = (Asm.Stack -36)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -76)};
        (Asm.SetCC (Asm.NE, (Asm.Stack -76)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -76)};
        (Asm.JmpCC (Asm.E, "foo.if.en.15"));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 6L);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret; (Asm.Label "foo.if.en.15");
        Asm.Cmp {typ = Asm.Quadword; src = (Asm.Imm -10L);
          dst = (Asm.Stack -48)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -80)};
        (Asm.SetCC (Asm.NE, (Asm.Stack -80)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -80)};
        (Asm.JmpCC (Asm.E, "foo.if.en.18"));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 7L);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret; (Asm.Label "foo.if.en.18");
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 1234L);
          dst = (Asm.Stack -52)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -84)};
        (Asm.SetCC (Asm.NE, (Asm.Stack -84)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -84)};
        (Asm.JmpCC (Asm.E, "foo.if.en.20"));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 8L);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret; (Asm.Label "foo.if.en.20");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret];
      frame =
      Env.lenv {
        namespace = "foo";
        counter = 21;
        offset = -84;
        stack slots = {
          a.0        -> -8,
          b.1        -> -12,
          c.2        -> -16,
          d.3        -> -20,
          e.4        -> -32,
          f.5        -> -36,
          g.6        -> -48,
          h.7        -> -52,
          foo.tmp.1  -> -56,
          foo.tmp.3  -> -60,
          foo.tmp.5  -> -64,
          foo.tmp.8  -> -68,
          foo.tmp.11 -> -72,
          foo.tmp.14 -> -76,
          foo.tmp.17 -> -80,
          foo.tmp.19 -> -84,
        }}};
     Asm.Function {name = "main"; global = true;
       instructions =
       [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 16L);
          dst = (Asm.Reg Asm.SP)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Imm -1L);
           dst = (Asm.Reg Asm.DI)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 2L);
           dst = (Asm.Reg Asm.SI)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Reg Asm.DX)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm -5L);
           dst = (Asm.Reg Asm.CX)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Imm -101L);
           dst = (Asm.Reg Asm.R8)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm -123L);
           dst = (Asm.Reg Asm.R9)};
         (Asm.Push (Asm.Imm 1234L)); (Asm.Push (Asm.Imm -10L));
         (Asm.Call "foo");
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
         counter = 16;
         offset = -4;
         stack slots = {
           main.tmp.15 -> -4,
         }}}
     ])
