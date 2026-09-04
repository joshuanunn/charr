(Asm.Program
   [Asm.Function {name = "lots_of_args"; global = true;
      instructions =
      [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 64L);
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
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack 32);
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -36)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack 40);
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -40)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack 48);
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -44)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack 56);
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -48)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack 64);
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -52)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack 72);
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -56)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack 80);
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -60)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -48);
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -64)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -60);
          dst = (Asm.Reg Asm.R10)};
        Asm.Binary {op = Asm.Add; typ = Asm.Longword;
          src = (Asm.Reg Asm.R10); dst = (Asm.Stack -64)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -64);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret];
      frame =
      Env.lenv {
        namespace = "lots_of_args";
        counter = 1;
        offset = -64;
        stack slots = {
          a.0                -> -4,
          b.1                -> -8,
          c.2                -> -12,
          d.3                -> -16,
          e.4                -> -20,
          f.5                -> -24,
          g.6                -> -28,
          h.7                -> -32,
          i.8                -> -36,
          j.9                -> -40,
          k.10               -> -44,
          l.11               -> -48,
          m.12               -> -52,
          n.13               -> -56,
          o.14               -> -60,
          lots_of_args.tmp.0 -> -64,
        }}};
     Asm.Function {name = "main"; global = true;
       instructions =
       [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 32L);
          dst = (Asm.Reg Asm.SP)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -4)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -8)};
         (Asm.Label "loop.st.1");
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 10000000L);
           dst = (Asm.Stack -8)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -12)};
         (Asm.SetCC (Asm.L, (Asm.Stack -12)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -12)};
         (Asm.JmpCC (Asm.E, "loop.br.1"));
         Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 8L);
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
         (Asm.Push (Asm.Imm 15L)); (Asm.Push (Asm.Imm 14L));
         (Asm.Push (Asm.Imm 13L));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -4);
           dst = (Asm.Reg Asm.AX)};
         (Asm.Push (Asm.Reg Asm.AX)); (Asm.Push (Asm.Imm 11L));
         (Asm.Push (Asm.Imm 10L)); (Asm.Push (Asm.Imm 9L));
         (Asm.Push (Asm.Imm 8L)); (Asm.Push (Asm.Imm 7L));
         (Asm.Call "lots_of_args");
         Asm.Binary {op = Asm.Add; typ = Asm.Quadword; src = (Asm.Imm 80L);
           dst = (Asm.Reg Asm.SP)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
           dst = (Asm.Stack -16)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -16);
           dst = (Asm.Reg Asm.R10)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -4)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -8);
           dst = (Asm.Reg Asm.R10)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -20)};
         Asm.Binary {op = Asm.Add; typ = Asm.Longword; src = (Asm.Imm 1L);
           dst = (Asm.Stack -20)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -20);
           dst = (Asm.Reg Asm.R10)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -8)};
         (Asm.Jmp "loop.st.1"); (Asm.Label "loop.br.1");
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 150000000L);
           dst = (Asm.Stack -4)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -24)};
         (Asm.SetCC (Asm.E, (Asm.Stack -24)));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -24);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret];
       frame =
       Env.lenv {
         namespace = "main";
         counter = 4;
         offset = -24;
         stack slots = {
           ret.15     -> -4,
           i.16       -> -8,
           main.tmp.0 -> -12,
           main.tmp.1 -> -16,
           main.tmp.2 -> -20,
           main.tmp.3 -> -24,
         }}}
     ])
