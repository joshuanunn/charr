(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [Asm.Mov {typ = Asm.Longword; src = (Asm.Imm -13L);
         dst = (Asm.Reg Asm.AX)};
        Asm.Ret]}
     ])
