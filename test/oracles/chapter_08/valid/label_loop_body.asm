(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.Jmp "label.0"); (Asm.Label "loop.ct.1"); (Asm.Jmp "loop.br.1");
        (Asm.Label "label.0"); (Asm.Jmp "loop.ct.1");
        (Asm.Label "loop.br.1");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 0;
        offset = 0;
        stack slots = {
        }}}
     ])
