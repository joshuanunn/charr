(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 16L);
         dst = (Asm.Reg Asm.SP)};
        Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 8L);
          dst = (Asm.Reg Asm.SP)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Reg Asm.DI)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Reg Asm.SI)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Reg Asm.DX)};
        Asm.Mov {typ = Asm.Quadword; src = (Asm.Imm 34359738368L);
          dst = (Asm.Reg Asm.CX)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Reg Asm.R8)};
        Asm.Mov {typ = Asm.Quadword; src = (Asm.Imm 34359738368L);
          dst = (Asm.Reg Asm.R9)};
        Asm.Mov {typ = Asm.Quadword; src = (Asm.Imm 34359738368L);
          dst = (Asm.Reg Asm.R10)};
        (Asm.Push (Asm.Reg Asm.R10)); (Asm.Push (Asm.Imm 0L));
        (Asm.Push (Asm.Imm 0L)); (Asm.Call "test_sum");
        Asm.Binary {op = Asm.Add; typ = Asm.Quadword; src = (Asm.Imm 32L);
          dst = (Asm.Reg Asm.SP)};
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
        }}}
     ])
