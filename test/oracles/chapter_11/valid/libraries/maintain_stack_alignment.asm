(Asm.Program
   [Asm.Function {name = "add_variables"; global = true;
      instructions =
      [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 48L);
         dst = (Asm.Reg Asm.SP)};
        Asm.Mov {typ = Asm.Quadword; src = (Asm.Reg Asm.DI);
          dst = (Asm.Stack -8)};
        Asm.Mov {typ = Asm.Quadword; src = (Asm.Reg Asm.SI);
          dst = (Asm.Stack -16)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.DX);
          dst = (Asm.Stack -20)};
        Asm.Mov {typ = Asm.Quadword; src = (Asm.Stack -8);
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Quadword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -32)};
        Asm.Mov {typ = Asm.Quadword; src = (Asm.Stack -16);
          dst = (Asm.Reg Asm.R10)};
        Asm.Binary {op = Asm.Add; typ = Asm.Quadword;
          src = (Asm.Reg Asm.R10); dst = (Asm.Stack -32)};
        Asm.Movsx {src = (Asm.Stack -20); dst = (Asm.Reg Asm.R11)};
        Asm.Mov {typ = Asm.Quadword; src = (Asm.Reg Asm.R11);
          dst = (Asm.Stack -40)};
        Asm.Mov {typ = Asm.Quadword; src = (Asm.Stack -32);
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Quadword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -48)};
        Asm.Mov {typ = Asm.Quadword; src = (Asm.Stack -40);
          dst = (Asm.Reg Asm.R10)};
        Asm.Binary {op = Asm.Add; typ = Asm.Quadword;
          src = (Asm.Reg Asm.R10); dst = (Asm.Stack -48)};
        Asm.Mov {typ = Asm.Quadword; src = (Asm.Stack -48);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret];
      frame =
      Env.lenv {
        namespace = "add_variables";
        counter = 3;
        offset = -48;
        stack slots = {
          x.0   -> -8,
          y.1   -> -16,
          z.2   -> -20,
          tmp.0 -> -32,
          tmp.1 -> -40,
          tmp.2 -> -48,
        }}}
     ])
