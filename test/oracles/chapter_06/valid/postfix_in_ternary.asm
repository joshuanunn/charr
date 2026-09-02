(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 16L);
         dst = (Asm.Reg Asm.SP)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 10L);
          dst = (Asm.Stack -4)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L); dst = (Asm.Stack -8)};
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L); dst = (Asm.Stack -8)};
        (Asm.JmpCC (Asm.E, "main.cond.el.3")); (Asm.Jmp "main.cond.en.2");
        (Asm.Label "main.cond.el.3");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 9L); dst = (Asm.Stack -4)};
        (Asm.Label "main.cond.en.2");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -4);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 5;
        offset = -8;
        stack slots = {
          x.0   -> -4,
          tmp.1 -> -8,
        }}}
     ])
