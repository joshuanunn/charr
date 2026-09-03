(Asm.Program
   [Asm.Function {name = "get_x"; global = true;
      instructions =
      [Asm.Mov {typ = Asm.Longword; src = (Asm.Data "x");
         dst = (Asm.Reg Asm.AX)};
        Asm.Ret];
      frame =
      Env.lenv {
        namespace = "get_x";
        counter = 0;
        offset = 0;
        stack slots = {
        }}};
     Asm.Function {name = "main"; global = true;
       instructions =
       [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 16L);
          dst = (Asm.Reg Asm.SP)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 5L);
           dst = (Asm.Data "x")};
         (Asm.Call "get_x");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
           dst = (Asm.Stack -4)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 10L);
           dst = (Asm.Data "x")};
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
     Asm.StaticVariable {name = "x"; global = true; alignment = 4;
       init = (Ctype.IntInit 100l)}
     ])
