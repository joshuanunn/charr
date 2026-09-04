(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [Asm.Mov {typ = Asm.Longword; src = (Asm.Data "foo");
         dst = (Asm.Reg Asm.AX)};
        Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 1;
        offset = 0;
        stack slots = {
        }}};
     Asm.StaticVariable {name = "foo"; global = true; alignment = 4;
       init = (Ctype.IntInit 3l)}
     ])
