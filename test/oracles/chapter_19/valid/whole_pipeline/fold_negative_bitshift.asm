(Asm.Program
   [Asm.Function {name = "target"; global = true;
      instructions =
      [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm -2500), (Asm.Reg Asm.AX)));
        Asm.Ret];
      frame =
      Env.lenv {
        namespace = "target";
        counter = 2;
        offset = -8;
        stack slots = {
          tmp.0 -> -4,
          tmp.1 -> -8,
        }}};
     Asm.Function {name = "main"; global = true;
       instructions =
       [(Asm.AllocateStack 16); (Asm.Call "target");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -4)));
         (Asm.Cmp ((Asm.Imm -2500), (Asm.Stack -4)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -12)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -12)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -12)));
         (Asm.JmpCC (Asm.E, "main.if.en.3"));
         (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "main.if.en.3");
         (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         namespace = "main";
         counter = 4;
         offset = -12;
         stack slots = {
           tmp.0 -> -4,
           tmp.1 -> -8,
           tmp.2 -> -12,
         }}}
     ])
