(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.Jmp "other_if.1"); (Asm.Label "first_if.0");
        (Asm.Jmp "main.if.en.2"); (Asm.Label "other_if.1");
        (Asm.Jmp "first_if.0"); (Asm.Label "main.if.en.2");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 11L);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 4;
        offset = 0;
        stack slots = {
        }}}
     ])
