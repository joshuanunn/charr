(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 16L);
         dst = (Asm.Reg Asm.SP)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 5L); dst = (Asm.Stack -4)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L); dst = (Asm.Stack -8)};
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L); dst = (Asm.Stack -8)};
        (Asm.JmpCC (Asm.NE, "swit.cs.1.2"));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -12)};
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -12)};
        (Asm.JmpCC (Asm.NE, "swit.cs.1.3")); (Asm.Jmp "swit.br.1");
        (Asm.Label "swit.cs.1.2");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 10L);
          dst = (Asm.Stack -4)};
        (Asm.Jmp "swit.br.1"); (Asm.Label "swit.cs.1.3");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L); dst = (Asm.Stack -4)};
        (Asm.Label "swit.br.1");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -4);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 2;
        offset = -12;
        stack slots = {
          a.0        -> -4,
          main.tmp.0 -> -8,
          main.tmp.1 -> -12,
        }}}
     ])
