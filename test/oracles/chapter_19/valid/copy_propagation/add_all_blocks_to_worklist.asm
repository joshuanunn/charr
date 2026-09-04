(Asm.Program
   [Asm.Function {name = "f"; global = true;
      instructions =
      [Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 100L);
         dst = (Asm.Data "global")};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret];
      frame =
      Env.lenv {
        namespace = "f";
        counter = 0;
        offset = 0;
        stack slots = {
        }}};
     Asm.Function {name = "main"; global = true;
       instructions =
       [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 16L);
          dst = (Asm.Reg Asm.SP)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Data "global")};
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Data "flag")};
         (Asm.JmpCC (Asm.E, "main.if.en.0")); (Asm.Call "f");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
           dst = (Asm.Stack -4)};
         (Asm.Label "main.if.en.0");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Data "global");
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret];
       frame =
       Env.lenv {
         namespace = "main";
         counter = 2;
         offset = -4;
         stack slots = {
           main.tmp.1 -> -4,
         }}};
     Asm.StaticVariable {name = "flag"; global = true; alignment = 4;
       init = (Ctype.IntInit 1l)};
     Asm.StaticVariable {name = "global"; global = true; alignment = 4;
       init = (Ctype.IntInit 0l)}
     ])
