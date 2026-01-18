(Asm.Program
   [Asm.Function {name = "get_x"; global = true;
      instructions = [(Asm.Mov ((Asm.Data "x"), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "get_x";
        counter = 0;
        offset = 0;
        stack slots = {
        }}};
     Asm.Function {name = "main"; global = true;
       instructions =
       [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 5), (Asm.Data "x")));
         (Asm.Call "get_x"); (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -8)));
         (Asm.Mov ((Asm.Imm 10), (Asm.Data "x")));
         (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         namespace = "main";
         counter = 1;
         offset = -8;
         stack slots = {
           result.0 -> -4,
           tmp.0    -> -8,
         }}};
     Asm.StaticVariable {name = "x"; global = true; init = 100}])
