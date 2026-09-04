(Asm.Program
   [Asm.Function {name = "callee"; global = true;
      instructions =
      [Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
         dst = (Asm.Reg Asm.AX)};
        Asm.Ret];
      frame =
      Env.lenv {
        namespace = "callee";
        counter = 0;
        offset = 0;
        stack slots = {
        }}};
     Asm.Function {name = "target"; global = true;
       instructions =
       [Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Reg Asm.AX)};
         Asm.Ret];
       frame =
       Env.lenv {
         namespace = "target";
         counter = 6;
         offset = 0;
         stack slots = {
         }}};
     Asm.Function {name = "main"; global = true;
       instructions =
       [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 16L);
          dst = (Asm.Reg Asm.SP)};
         (Asm.Call "target");
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
           main.tmp.0 -> -4,
         }}}
     ])
