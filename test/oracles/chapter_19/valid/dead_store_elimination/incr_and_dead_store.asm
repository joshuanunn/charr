(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 16);
        Asm.Binary {op = Asm.Add; src = (Asm.Imm 1); dst = (Asm.Data "x")};
        (Asm.Mov ((Asm.Data "x"), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 0;
        offset = -4;
        stack slots = {
          y.0 -> -4,
        }}};
     Asm.StaticVariable {name = "x"; global = false; init = 10}])
