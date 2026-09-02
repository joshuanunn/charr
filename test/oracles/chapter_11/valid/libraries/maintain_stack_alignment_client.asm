(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 16L);
         dst = (Asm.Reg Asm.SP)};
        Asm.Mov {typ = Asm.Quadword; src = (Asm.Imm 3L);
          dst = (Asm.Reg Asm.DI)};
        Asm.Mov {typ = Asm.Quadword; src = (Asm.Imm 4L);
          dst = (Asm.Reg Asm.SI)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 5L);
          dst = (Asm.Reg Asm.DX)};
        (Asm.Call "add_variables");
        Asm.Binary {op = Asm.Add; typ = Asm.Quadword; src = (Asm.Imm 0L);
          dst = (Asm.Reg Asm.SP)};
        Asm.Mov {typ = Asm.Quadword; src = (Asm.Reg Asm.AX);
          dst = (Asm.Stack -8)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -8);
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -12)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -12);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 4;
        offset = -12;
        stack slots = {
          tmp.2 -> -8,
          tmp.3 -> -12,
        }}}
     ])
