(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.Jmp "main.if.en.1"); (Asm.Label "return_a.0");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret; (Asm.Label "main.if.en.1"); (Asm.Jmp "return_a.0")];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 2;
        offset = 0;
        stack slots = {
        }}}
     ])
