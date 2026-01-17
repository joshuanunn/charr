(Asm.Program
   [Asm.Function {name = "target"; global = true;
      instructions =
      [(Asm.AllocateStack 32); (Asm.Mov ((Asm.Imm 4), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -12)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -12)));
        (Asm.JmpCC (Asm.E, "target.if.en.1"));
        (Asm.Mov ((Asm.Imm 3), (Asm.Stack -4)));
        (Asm.Label "target.if.en.1");
        (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -20)));
        Asm.Binary {op = Asm.Add; src = (Asm.Imm 5); dst = (Asm.Stack -20)};
        (Asm.Mov ((Asm.Stack -20), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "target";
        counter = 5;
        offset = -20;
        stack slots = {
          x.0   -> -4,
          z.1   -> -8,
          tmp.0 -> -12,
          tmp.2 -> -16,
          tmp.4 -> -20,
        }}};
     Asm.Function {name = "main"; global = true;
       instructions =
       [(Asm.AllocateStack 16); (Asm.Call "target");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -4)));
         (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         namespace = "main";
         counter = 1;
         offset = -4;
         stack slots = {
           tmp.0 -> -4,
         }}};
     Asm.StaticVariable {name = "flag"; global = true; init = 1}])
