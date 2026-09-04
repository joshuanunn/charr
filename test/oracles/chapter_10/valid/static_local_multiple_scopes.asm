(Asm.Program
   [Asm.Function {name = "print_letters"; global = true;
      instructions =
      [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 32L);
         dst = (Asm.Reg Asm.SP)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Data "i.1");
          dst = (Asm.Reg Asm.DI)};
        (Asm.Call "putchar");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
          dst = (Asm.Stack -4)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Data "i.1");
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -8)};
        Asm.Binary {op = Asm.Add; typ = Asm.Longword; src = (Asm.Imm 1L);
          dst = (Asm.Stack -8)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -8);
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Data "i.1")};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Data "i.2");
          dst = (Asm.Reg Asm.DI)};
        (Asm.Call "putchar");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
          dst = (Asm.Stack -12)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Data "i.2");
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -16)};
        Asm.Binary {op = Asm.Add; typ = Asm.Longword; src = (Asm.Imm 1L);
          dst = (Asm.Stack -16)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -16);
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Data "i.2")};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 10L);
          dst = (Asm.Reg Asm.DI)};
        (Asm.Call "putchar");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
          dst = (Asm.Stack -20)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret];
      frame =
      Env.lenv {
        namespace = "print_letters";
        counter = 5;
        offset = -20;
        stack slots = {
          print_letters.tmp.0 -> -4,
          print_letters.tmp.1 -> -8,
          print_letters.tmp.2 -> -12,
          print_letters.tmp.3 -> -16,
          print_letters.tmp.4 -> -20,
        }}};
     Asm.Function {name = "main"; global = true;
       instructions =
       [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 16L);
          dst = (Asm.Reg Asm.SP)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -4)};
         (Asm.Label "loop.st.1");
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 26L);
           dst = (Asm.Stack -4)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -8)};
         (Asm.SetCC (Asm.L, (Asm.Stack -8)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -8)};
         (Asm.JmpCC (Asm.E, "loop.br.1")); (Asm.Call "print_letters");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
           dst = (Asm.Stack -12)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -4);
           dst = (Asm.Reg Asm.R10)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -16)};
         Asm.Binary {op = Asm.Add; typ = Asm.Longword; src = (Asm.Imm 1L);
           dst = (Asm.Stack -16)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -16);
           dst = (Asm.Reg Asm.R10)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -4)};
         (Asm.Jmp "loop.st.1"); (Asm.Label "loop.br.1");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret];
       frame =
       Env.lenv {
         namespace = "main";
         counter = 3;
         offset = -16;
         stack slots = {
           i.3        -> -4,
           main.tmp.0 -> -8,
           main.tmp.1 -> -12,
           main.tmp.2 -> -16,
         }}};
     Asm.StaticVariable {name = "i.1"; global = false; alignment = 4;
       init = (Ctype.IntInit 65l)};
     Asm.StaticVariable {name = "i.2"; global = false; alignment = 4;
       init = (Ctype.IntInit 97l)}
     ])
