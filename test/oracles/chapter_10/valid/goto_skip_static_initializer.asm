(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [Asm.Mov {typ = Asm.Longword; src = (Asm.Data "x.1");
         dst = (Asm.Reg Asm.AX)};
        Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 0;
        offset = 0;
        stack slots = {
        }}};
     Asm.StaticVariable {name = "x.1"; global = false; alignment = 4;
       init = (Ctype.IntInit 10l)}
     ])
