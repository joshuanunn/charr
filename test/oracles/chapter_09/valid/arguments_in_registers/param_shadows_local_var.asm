(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 16L);
         dst = (Asm.Reg Asm.SP)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 10L);
          dst = (Asm.Reg Asm.DI)};
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
          tmp.0 -> -4,
        }}};
     Asm.Function {name = "f"; global = true;
       instructions =
       [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 16L);
          dst = (Asm.Reg Asm.SP)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.DI);
           dst = (Asm.Stack -4)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -4);
           dst = (Asm.Reg Asm.R10)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -8)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -8);
           dst = (Asm.Reg Asm.R11)};
         Asm.Binary {op = Asm.Mult; typ = Asm.Longword; src = (Asm.Imm 2L);
           dst = (Asm.Reg Asm.R11)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R11);
           dst = (Asm.Stack -8)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -8);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret];
       frame =
       Env.lenv {
         namespace = "f";
         counter = 1;
         offset = -8;
         stack slots = {
           a.2   -> -4,
           tmp.0 -> -8,
         }}}
     ])
