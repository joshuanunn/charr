(Asm.Program
   [Asm.Function {name = "test_sum"; global = true;
      instructions =
      [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 64L);
         dst = (Asm.Reg Asm.SP)};
        Asm.Mov {typ = Asm.Quadword; src = (Asm.Reg Asm.DI);
          dst = (Asm.Stack -8)};
        Asm.Mov {typ = Asm.Quadword; src = (Asm.Reg Asm.SI);
          dst = (Asm.Stack -16)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.DX);
          dst = (Asm.Stack -20)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.CX);
          dst = (Asm.Stack -24)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R8);
          dst = (Asm.Stack -28)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R9);
          dst = (Asm.Stack -32)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack 16);
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -36)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack 24);
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -40)};
        Asm.Mov {typ = Asm.Quadword; src = (Asm.Stack 32);
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Quadword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -48)};
        Asm.Mov {typ = Asm.Quadword; src = (Asm.Stack -8);
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Quadword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -56)};
        Asm.Mov {typ = Asm.Quadword; src = (Asm.Stack -16);
          dst = (Asm.Reg Asm.R10)};
        Asm.Binary {op = Asm.Add; typ = Asm.Quadword;
          src = (Asm.Reg Asm.R10); dst = (Asm.Stack -56)};
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 100L);
          dst = (Asm.Stack -56)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -60)};
        (Asm.SetCC (Asm.L, (Asm.Stack -60)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -60)};
        (Asm.JmpCC (Asm.E, "test_sum.if.en.2"));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret; (Asm.Label "test_sum.if.en.2");
        Asm.Cmp {typ = Asm.Quadword; src = (Asm.Imm 100L);
          dst = (Asm.Stack -48)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -64)};
        (Asm.SetCC (Asm.L, (Asm.Stack -64)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -64)};
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
        offset = -64;
        stack slots = {
          a.0   -> -8,
          b.1   -> -16,
          c.2   -> -20,
          d.3   -> -24,
          e.4   -> -28,
          f.5   -> -32,
          g.6   -> -36,
          h.7   -> -40,
          i.8   -> -48,
          tmp.0 -> -56,
          tmp.1 -> -60,
          tmp.3 -> -64,
        }}};
     Asm.Function {name = "main"; global = true;
       instructions =
       [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 16L);
          dst = (Asm.Reg Asm.SP)};
         Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 8L);
           dst = (Asm.Reg Asm.SP)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Imm 34359738368L);
           dst = (Asm.Reg Asm.DI)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Imm 34359738368L);
           dst = (Asm.Reg Asm.SI)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Reg Asm.DX)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Reg Asm.CX)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Reg Asm.R8)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Reg Asm.R9)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Imm 34359738368L);
           dst = (Asm.Reg Asm.R10)};
         (Asm.Push (Asm.Reg Asm.R10)); (Asm.Push (Asm.Imm 0L));
         (Asm.Push (Asm.Imm 0L)); (Asm.Call "test_sum");
         Asm.Binary {op = Asm.Add; typ = Asm.Quadword; src = (Asm.Imm 32L);
           dst = (Asm.Reg Asm.SP)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
           dst = (Asm.Stack -8)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -8);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret];
       frame =
       Env.lenv {
         namespace = "main";
         counter = 1;
         offset = -8;
         stack slots = {
           tmp.0 -> -8,
         }}}
     ])
