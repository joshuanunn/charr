(Asm.Program
   [Asm.Function {name = "callee"; global = true;
      instructions = [(Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "callee";
        counter = 0;
        offset = 0;
        stack slots = {
        }}};
     Asm.Function {name = "target"; global = true;
       instructions =
       [(Asm.AllocateStack 32); (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX)));
         Asm.Ret];
       frame =
       Env.lenv {
         namespace = "target";
         counter = 6;
         offset = -32;
         stack slots = {
           switch_var.0 -> -4,
           retval.1     -> -8,
           tmp.0        -> -12,
           tmp.1        -> -16,
           tmp.2        -> -20,
           tmp.3        -> -24,
           tmp.4        -> -28,
           tmp.5        -> -32,
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
         }}}
     ])
