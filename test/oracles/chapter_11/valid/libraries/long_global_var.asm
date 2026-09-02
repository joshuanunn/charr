(Asm.Program
   [Asm.Function {name = "return_l"; global = true;
      instructions =
      [Asm.Mov {typ = Asm.Quadword; src = (Asm.Data "l");
         dst = (Asm.Reg Asm.AX)};
        Asm.Ret];
      frame =
      Env.lenv {
        namespace = "return_l";
        counter = 0;
        offset = 0;
        stack slots = {
        }}};
     Asm.Function {name = "return_l_as_int"; global = true;
       instructions =
       [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 16L);
          dst = (Asm.Reg Asm.SP)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Data "l");
           dst = (Asm.Reg Asm.R10)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -4)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -4);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret];
       frame =
       Env.lenv {
         namespace = "return_l_as_int";
         counter = 1;
         offset = -4;
         stack slots = {
           tmp.0 -> -4,
         }}};
     Asm.StaticVariable {name = "l"; global = true; alignment = 8;
       init = (Ctype.LongInit 8589934592L)}
     ])
