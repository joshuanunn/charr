(Asm.Program
   [Asm.Function {name = "return_a"; global = true;
      instructions =
      [Asm.Mov {typ = Asm.Longword; src = (Asm.Data "a");
         dst = (Asm.Reg Asm.AX)};
        Asm.Ret];
      frame =
      Env.lenv {
        namespace = "return_a";
        counter = 0;
        offset = 0;
        stack slots = {
        }}};
     Asm.Function {name = "main"; global = true;
       instructions =
       [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 16L);
          dst = (Asm.Reg Asm.SP)};
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 5L);
           dst = (Asm.Data "a")};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -4)};
         (Asm.SetCC (Asm.NE, (Asm.Stack -4)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -4)};
         (Asm.JmpCC (Asm.E, "main.if.en.1"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret; (Asm.Label "main.if.en.1");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 4L);
           dst = (Asm.Data "a")};
         (Asm.Call "return_a");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
           dst = (Asm.Stack -8)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 3L);
           dst = (Asm.Stack -12)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -8);
           dst = (Asm.Reg Asm.R10)};
         Asm.Binary {op = Asm.Add; typ = Asm.Longword;
           src = (Asm.Reg Asm.R10); dst = (Asm.Stack -12)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -12);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret];
       frame =
       Env.lenv {
         namespace = "main";
         counter = 4;
         offset = -12;
         stack slots = {
           main.tmp.0 -> -4,
           main.tmp.2 -> -8,
           main.tmp.3 -> -12,
         }}};
     Asm.StaticVariable {name = "a"; global = true; alignment = 4;
       init = (Ctype.IntInit 5l)}
     ])
