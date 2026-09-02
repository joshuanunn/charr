(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 64L);
         dst = (Asm.Reg Asm.SP)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 72L);
          dst = (Asm.Reg Asm.DI)};
        (Asm.Call "putchar");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
          dst = (Asm.Stack -4)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 101L);
          dst = (Asm.Reg Asm.DI)};
        (Asm.Call "putchar");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
          dst = (Asm.Stack -8)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 108L);
          dst = (Asm.Reg Asm.DI)};
        (Asm.Call "putchar");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
          dst = (Asm.Stack -12)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 108L);
          dst = (Asm.Reg Asm.DI)};
        (Asm.Call "putchar");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
          dst = (Asm.Stack -16)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 111L);
          dst = (Asm.Reg Asm.DI)};
        (Asm.Call "putchar");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
          dst = (Asm.Stack -20)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 44L);
          dst = (Asm.Reg Asm.DI)};
        (Asm.Call "putchar");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
          dst = (Asm.Stack -24)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 32L);
          dst = (Asm.Reg Asm.DI)};
        (Asm.Call "putchar");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
          dst = (Asm.Stack -28)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 87L);
          dst = (Asm.Reg Asm.DI)};
        (Asm.Call "putchar");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
          dst = (Asm.Stack -32)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 111L);
          dst = (Asm.Reg Asm.DI)};
        (Asm.Call "putchar");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
          dst = (Asm.Stack -36)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 114L);
          dst = (Asm.Reg Asm.DI)};
        (Asm.Call "putchar");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
          dst = (Asm.Stack -40)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 108L);
          dst = (Asm.Reg Asm.DI)};
        (Asm.Call "putchar");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
          dst = (Asm.Stack -44)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 100L);
          dst = (Asm.Reg Asm.DI)};
        (Asm.Call "putchar");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
          dst = (Asm.Stack -48)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 33L);
          dst = (Asm.Reg Asm.DI)};
        (Asm.Call "putchar");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
          dst = (Asm.Stack -52)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 10L);
          dst = (Asm.Reg Asm.DI)};
        (Asm.Call "putchar");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
          dst = (Asm.Stack -56)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 14;
        offset = -56;
        stack slots = {
          tmp.0  -> -4,
          tmp.1  -> -8,
          tmp.2  -> -12,
          tmp.3  -> -16,
          tmp.4  -> -20,
          tmp.5  -> -24,
          tmp.6  -> -28,
          tmp.7  -> -32,
          tmp.8  -> -36,
          tmp.9  -> -40,
          tmp.10 -> -44,
          tmp.11 -> -48,
          tmp.12 -> -52,
          tmp.13 -> -56,
        }}}
     ])
