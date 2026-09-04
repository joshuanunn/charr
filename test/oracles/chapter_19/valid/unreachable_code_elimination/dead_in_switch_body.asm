(Asm.Program
   [Asm.Function {name = "callee"; global = true;
      instructions =
      [Asm.Mov {typ = Asm.Longword; src = (Asm.Imm -1L);
         dst = (Asm.Reg Asm.AX)};
        Asm.Ret];
      frame =
      Env.lenv {
        namespace = "callee";
        counter = 1;
        offset = 0;
        stack slots = {
        }}};
     Asm.Function {name = "target"; global = true;
       instructions =
       [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 32L);
          dst = (Asm.Reg Asm.SP)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.DI);
           dst = (Asm.Stack -4)};
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 1L);
           dst = (Asm.Stack -4)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -8)};
         (Asm.SetCC (Asm.E, (Asm.Stack -8)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -8)};
         (Asm.JmpCC (Asm.NE, "swit.cs.1.2"));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 2L);
           dst = (Asm.Stack -4)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -12)};
         (Asm.SetCC (Asm.E, (Asm.Stack -12)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -12)};
         (Asm.JmpCC (Asm.NE, "swit.cs.1.3"));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 3L);
           dst = (Asm.Stack -4)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -16)};
         (Asm.SetCC (Asm.E, (Asm.Stack -16)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -16)};
         (Asm.JmpCC (Asm.NE, "swit.cs.1.4")); (Asm.Jmp "swit.df.1");
         (Asm.Label "swit.cs.1.2");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
           dst = (Asm.Stack -20)};
         (Asm.Jmp "swit.br.1"); (Asm.Label "swit.cs.1.3");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 2L);
           dst = (Asm.Stack -20)};
         (Asm.Jmp "swit.br.1"); (Asm.Label "swit.cs.1.4");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 10L);
           dst = (Asm.Stack -20)};
         (Asm.Jmp "swit.br.1"); (Asm.Label "swit.df.1");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm -1L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret; (Asm.Label "swit.br.1");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -20);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret];
       frame =
       Env.lenv {
         namespace = "target";
         counter = 6;
         offset = -20;
         stack slots = {
           x.0          -> -4,
           target.tmp.0 -> -8,
           target.tmp.1 -> -12,
           target.tmp.2 -> -16,
           retval.1     -> -20,
         }}};
     Asm.Function {name = "main"; global = true;
       instructions =
       [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 16L);
          dst = (Asm.Reg Asm.SP)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 3L);
           dst = (Asm.Reg Asm.DI)};
         (Asm.Call "target");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
           dst = (Asm.Stack -4)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -4);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret];
       frame =
       Env.lenv {
         namespace = "main";
         counter = 1;
         offset = -4;
         stack slots = {
           main.tmp.0 -> -4,
         }}}
     ])
