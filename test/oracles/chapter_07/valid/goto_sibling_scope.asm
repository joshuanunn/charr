(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 32); (Asm.Jmp "other_if.1");
        (Asm.Label "first_if.0"); (Asm.Jmp "main.if.en.2");
        (Asm.Label "other_if.1"); (Asm.Jmp "first_if.0");
        (Asm.Label "main.if.en.2");
        (Asm.Mov ((Asm.Imm 11), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 4;
        offset = -20;
        stack slots = {
          sum.2 -> -4,
          a.3   -> -8,
          tmp.1 -> -12,
          a.4   -> -16,
          tmp.3 -> -20,
        }}}
     ])
