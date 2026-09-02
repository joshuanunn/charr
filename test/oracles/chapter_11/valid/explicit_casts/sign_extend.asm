(Asm.Program
   [Asm.Function {name = "sign_extend"; global = true;
      instructions =
      [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 48L);
         dst = (Asm.Reg Asm.SP)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.DI);
          dst = (Asm.Stack -4)};
        Asm.Mov {typ = Asm.Quadword; src = (Asm.Reg Asm.SI);
          dst = (Asm.Stack -16)};
        Asm.Movsx {src = (Asm.Stack -4); dst = (Asm.Reg Asm.R11)};
        Asm.Mov {typ = Asm.Quadword; src = (Asm.Reg Asm.R11);
          dst = (Asm.Stack -24)};
        Asm.Mov {typ = Asm.Quadword; src = (Asm.Stack -16);
          dst = (Asm.Reg Asm.R10)};
        Asm.Cmp {typ = Asm.Quadword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -24)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -28)};
        (Asm.SetCC (Asm.E, (Asm.Stack -28)));
        Asm.Movsx {src = (Asm.Stack -28); dst = (Asm.Reg Asm.R11)};
        Asm.Mov {typ = Asm.Quadword; src = (Asm.Reg Asm.R11);
          dst = (Asm.Stack -40)};
        Asm.Mov {typ = Asm.Quadword; src = (Asm.Stack -40);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret];
      frame =
      Env.lenv {
        namespace = "sign_extend";
        counter = 3;
        offset = -40;
        stack slots = {
          i.0        -> -4,
          expected.1 -> -16,
          tmp.0      -> -24,
          tmp.1      -> -28,
          tmp.2      -> -40,
        }}};
     Asm.Function {name = "main"; global = true;
       instructions =
       [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 32L);
          dst = (Asm.Reg Asm.SP)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 10L);
           dst = (Asm.Reg Asm.DI)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Imm 10L);
           dst = (Asm.Reg Asm.SI)};
         (Asm.Call "sign_extend");
         Asm.Binary {op = Asm.Add; typ = Asm.Quadword; src = (Asm.Imm 0L);
           dst = (Asm.Reg Asm.SP)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Reg Asm.AX);
           dst = (Asm.Stack -8)};
         Asm.Cmp {typ = Asm.Quadword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -8)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -12)};
         (Asm.SetCC (Asm.E, (Asm.Stack -12)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -12)};
         (Asm.JmpCC (Asm.E, "main.if.en.2"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret; (Asm.Label "main.if.en.2");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm -10L);
           dst = (Asm.Reg Asm.DI)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Imm -10L);
           dst = (Asm.Reg Asm.SI)};
         (Asm.Call "sign_extend");
         Asm.Binary {op = Asm.Add; typ = Asm.Quadword; src = (Asm.Imm 0L);
           dst = (Asm.Reg Asm.SP)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Reg Asm.AX);
           dst = (Asm.Stack -24)};
         Asm.Cmp {typ = Asm.Quadword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -24)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -28)};
         (Asm.SetCC (Asm.E, (Asm.Stack -28)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -28)};
         (Asm.JmpCC (Asm.E, "main.if.en.7"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 2L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret; (Asm.Label "main.if.en.7");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret];
       frame =
       Env.lenv {
         namespace = "main";
         counter = 11;
         offset = -28;
         stack slots = {
           tmp.0 -> -8,
           tmp.1 -> -12,
           tmp.5 -> -24,
           tmp.6 -> -28,
         }}}
     ])
