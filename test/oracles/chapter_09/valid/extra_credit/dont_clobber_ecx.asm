(Asm.Program
   [Asm.Function {name = "x"; global = true;
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
        (Asm.SetCC (Asm.E, (Asm.Stack -28)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -28)};
        (Asm.JmpCC (Asm.E, "x.and.fl.3"));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 2L); dst = (Asm.Stack -8)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -32)};
        (Asm.SetCC (Asm.E, (Asm.Stack -32)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -32)};
        (Asm.JmpCC (Asm.E, "x.and.fl.3"));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
          dst = (Asm.Stack -36)};
        (Asm.Jmp "x.and.en.4"); (Asm.Label "x.and.fl.3");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -36)};
        (Asm.Label "x.and.en.4");
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -36)};
        (Asm.JmpCC (Asm.E, "x.and.fl.7"));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 3L);
          dst = (Asm.Stack -12)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -40)};
        (Asm.SetCC (Asm.E, (Asm.Stack -40)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -40)};
        (Asm.JmpCC (Asm.E, "x.and.fl.7"));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
          dst = (Asm.Stack -44)};
        (Asm.Jmp "x.and.en.8"); (Asm.Label "x.and.fl.7");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -44)};
        (Asm.Label "x.and.en.8");
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -44)};
        (Asm.JmpCC (Asm.E, "x.and.fl.11"));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 4L);
          dst = (Asm.Stack -16)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -48)};
        (Asm.SetCC (Asm.E, (Asm.Stack -48)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -48)};
        (Asm.JmpCC (Asm.E, "x.and.fl.11"));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
          dst = (Asm.Stack -52)};
        (Asm.Jmp "x.and.en.12"); (Asm.Label "x.and.fl.11");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -52)};
        (Asm.Label "x.and.en.12");
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -52)};
        (Asm.JmpCC (Asm.E, "x.and.fl.15"));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 5L);
          dst = (Asm.Stack -20)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -56)};
        (Asm.SetCC (Asm.E, (Asm.Stack -56)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -56)};
        (Asm.JmpCC (Asm.E, "x.and.fl.15"));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
          dst = (Asm.Stack -60)};
        (Asm.Jmp "x.and.en.16"); (Asm.Label "x.and.fl.15");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -60)};
        (Asm.Label "x.and.en.16");
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -60)};
        (Asm.JmpCC (Asm.E, "x.and.fl.19"));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 6L);
          dst = (Asm.Stack -24)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -64)};
        (Asm.SetCC (Asm.E, (Asm.Stack -64)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -64)};
        (Asm.JmpCC (Asm.E, "x.and.fl.19"));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
          dst = (Asm.Stack -68)};
        (Asm.Jmp "x.and.en.20"); (Asm.Label "x.and.fl.19");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -68)};
        (Asm.Label "x.and.en.20");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -68);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret];
      frame =
      Env.lenv {
        namespace = "x";
        counter = 21;
        offset = -68;
        stack slots = {
          a.0      -> -4,
          b.1      -> -8,
          c.2      -> -12,
          d.3      -> -16,
          e.4      -> -20,
          f.5      -> -24,
          x.tmp.0  -> -28,
          x.tmp.1  -> -32,
          x.tmp.2  -> -36,
          x.tmp.5  -> -40,
          x.tmp.6  -> -44,
          x.tmp.9  -> -48,
          x.tmp.10 -> -52,
          x.tmp.13 -> -56,
          x.tmp.14 -> -60,
          x.tmp.17 -> -64,
          x.tmp.18 -> -68,
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
         (Asm.Call "x");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
           dst = (Asm.Stack -4)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -4);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret];
       frame =
       Env.lenv {
         namespace = "main";
         counter = 3;
         offset = -4;
         stack slots = {
           main.tmp.2 -> -4,
         }}}
     ])
