(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [Asm.Mov {typ = Asm.Longword; src = (Asm.Data "x");
         dst = (Asm.Reg Asm.AX)};
        Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 0;
        offset = 0;
        stack slots = {
        }}};
     Asm.StaticVariable {name = "x"; global = true; alignment = 4;
       init = (Ctype.IntInit 0l)}
     ])
