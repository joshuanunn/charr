(Asm.Program
   [Asm.Function {name = "g"; global = true;
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
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 2L); dst = (Asm.Stack -4)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -20)};
        (Asm.SetCC (Asm.E, (Asm.Stack -20)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -20)};
        (Asm.JmpCC (Asm.E, "g.and.fl.3"));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 4L); dst = (Asm.Stack -8)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -24)};
        (Asm.SetCC (Asm.E, (Asm.Stack -24)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -24)};
        (Asm.JmpCC (Asm.E, "g.and.fl.3"));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
          dst = (Asm.Stack -28)};
        (Asm.Jmp "g.and.en.4"); (Asm.Label "g.and.fl.3");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -28)};
        (Asm.Label "g.and.en.4");
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -28)};
        (Asm.JmpCC (Asm.E, "g.and.fl.7"));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 6L);
          dst = (Asm.Stack -12)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -32)};
        (Asm.SetCC (Asm.E, (Asm.Stack -32)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -32)};
        (Asm.JmpCC (Asm.E, "g.and.fl.7"));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
          dst = (Asm.Stack -36)};
        (Asm.Jmp "g.and.en.8"); (Asm.Label "g.and.fl.7");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -36)};
        (Asm.Label "g.and.en.8");
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -36)};
        (Asm.JmpCC (Asm.E, "g.and.fl.11"));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 8L);
          dst = (Asm.Stack -16)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -40)};
        (Asm.SetCC (Asm.E, (Asm.Stack -40)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -40)};
        (Asm.JmpCC (Asm.E, "g.and.fl.11"));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
          dst = (Asm.Stack -44)};
        (Asm.Jmp "g.and.en.12"); (Asm.Label "g.and.fl.11");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -44)};
        (Asm.Label "g.and.en.12");
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -44)};
        (Asm.JmpCC (Asm.E, "g.if.en.13"));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret; (Asm.Label "g.if.en.13");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret];
      frame =
      Env.lenv {
        namespace = "g";
        counter = 14;
        offset = -44;
        stack slots = {
          w.0      -> -4,
          x.1      -> -8,
          y.2      -> -12,
          z.3      -> -16,
          g.tmp.0  -> -20,
          g.tmp.1  -> -24,
          g.tmp.2  -> -28,
          g.tmp.5  -> -32,
          g.tmp.6  -> -36,
          g.tmp.9  -> -40,
          g.tmp.10 -> -44,
        }}};
     Asm.Function {name = "f"; global = true;
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
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -4);
           dst = (Asm.Reg Asm.R10)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -20)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -20);
           dst = (Asm.Reg Asm.R11)};
         Asm.Binary {op = Asm.Mult; typ = Asm.Longword; src = (Asm.Imm 2L);
           dst = (Asm.Reg Asm.R11)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R11);
           dst = (Asm.Stack -20)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -8);
           dst = (Asm.Reg Asm.R10)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -24)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -24);
           dst = (Asm.Reg Asm.R11)};
         Asm.Binary {op = Asm.Mult; typ = Asm.Longword; src = (Asm.Imm 2L);
           dst = (Asm.Reg Asm.R11)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R11);
           dst = (Asm.Stack -24)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -12);
           dst = (Asm.Reg Asm.R10)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -28)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -28);
           dst = (Asm.Reg Asm.R11)};
         Asm.Binary {op = Asm.Mult; typ = Asm.Longword; src = (Asm.Imm 2L);
           dst = (Asm.Reg Asm.R11)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R11);
           dst = (Asm.Stack -28)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -16);
           dst = (Asm.Reg Asm.R10)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -32)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -32);
           dst = (Asm.Reg Asm.R11)};
         Asm.Binary {op = Asm.Mult; typ = Asm.Longword; src = (Asm.Imm 2L);
           dst = (Asm.Reg Asm.R11)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R11);
           dst = (Asm.Stack -32)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -20);
           dst = (Asm.Reg Asm.DI)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -24);
           dst = (Asm.Reg Asm.SI)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -28);
           dst = (Asm.Reg Asm.DX)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -32);
           dst = (Asm.Reg Asm.CX)};
         (Asm.Call "g");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
           dst = (Asm.Stack -36)};
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 1L);
           dst = (Asm.Stack -36)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -40)};
         (Asm.SetCC (Asm.E, (Asm.Stack -40)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -40)};
         (Asm.JmpCC (Asm.E, "f.and.fl.8"));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 1L);
           dst = (Asm.Stack -4)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -44)};
         (Asm.SetCC (Asm.E, (Asm.Stack -44)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -44)};
         (Asm.JmpCC (Asm.E, "f.and.fl.8"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
           dst = (Asm.Stack -48)};
         (Asm.Jmp "f.and.en.9"); (Asm.Label "f.and.fl.8");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -48)};
         (Asm.Label "f.and.en.9");
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -48)};
         (Asm.JmpCC (Asm.E, "f.and.fl.12"));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 2L);
           dst = (Asm.Stack -8)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -52)};
         (Asm.SetCC (Asm.E, (Asm.Stack -52)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -52)};
         (Asm.JmpCC (Asm.E, "f.and.fl.12"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
           dst = (Asm.Stack -56)};
         (Asm.Jmp "f.and.en.13"); (Asm.Label "f.and.fl.12");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -56)};
         (Asm.Label "f.and.en.13");
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -56)};
         (Asm.JmpCC (Asm.E, "f.and.fl.16"));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 3L);
           dst = (Asm.Stack -12)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -60)};
         (Asm.SetCC (Asm.E, (Asm.Stack -60)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -60)};
         (Asm.JmpCC (Asm.E, "f.and.fl.16"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
           dst = (Asm.Stack -64)};
         (Asm.Jmp "f.and.en.17"); (Asm.Label "f.and.fl.16");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -64)};
         (Asm.Label "f.and.en.17");
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -64)};
         (Asm.JmpCC (Asm.E, "f.and.fl.20"));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 4L);
           dst = (Asm.Stack -16)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -68)};
         (Asm.SetCC (Asm.E, (Asm.Stack -68)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -68)};
         (Asm.JmpCC (Asm.E, "f.and.fl.20"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
           dst = (Asm.Stack -72)};
         (Asm.Jmp "f.and.en.21"); (Asm.Label "f.and.fl.20");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -72)};
         (Asm.Label "f.and.en.21");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -72);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret];
       frame =
       Env.lenv {
         namespace = "f";
         counter = 22;
         offset = -72;
         stack slots = {
           a.4      -> -4,
           b.5      -> -8,
           c.6      -> -12,
           d.7      -> -16,
           f.tmp.0  -> -20,
           f.tmp.1  -> -24,
           f.tmp.2  -> -28,
           f.tmp.3  -> -32,
           f.tmp.4  -> -36,
           f.tmp.5  -> -40,
           f.tmp.6  -> -44,
           f.tmp.7  -> -48,
           f.tmp.10 -> -52,
           f.tmp.11 -> -56,
           f.tmp.14 -> -60,
           f.tmp.15 -> -64,
           f.tmp.18 -> -68,
           f.tmp.19 -> -72,
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
         (Asm.Call "f");
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
