(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 16L);
         dst = (Asm.Reg Asm.SP)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L); dst = (Asm.Stack -4)};
        (Asm.Label "label_if.0");
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L); dst = (Asm.Stack -4)};
        (Asm.JmpCC (Asm.E, "main.if.el.1")); (Asm.Jmp "label_expression.2");
        (Asm.Label "main.if.el.1"); (Asm.Jmp "label_empty.4");
        (Asm.Label "label_goto.1"); (Asm.Jmp "label_return.3");
        (Asm.Label "label_expression.2");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L); dst = (Asm.Stack -4)};
        (Asm.Jmp "label_if.0"); (Asm.Label "label_return.3");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 100L);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret; (Asm.Label "label_empty.4"); (Asm.Jmp "label_goto.1")];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 3;
        offset = -4;
        stack slots = {
          a.5 -> -4,
        }}}
     ])
