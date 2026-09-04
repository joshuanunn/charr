(Asm.Program
   [Asm.Function {name = "incr_i"; global = true;
      instructions =
      [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 16L);
         dst = (Asm.Reg Asm.SP)};
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 1L); dst = (Asm.Data "i")};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L); dst = (Asm.Stack -4)};
        (Asm.SetCC (Asm.E, (Asm.Stack -4)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L); dst = (Asm.Stack -4)};
        (Asm.JmpCC (Asm.E, "incr_i.if.en.1"));
        Asm.Binary {op = Asm.Add; typ = Asm.Longword; src = (Asm.Imm 1L);
          dst = (Asm.Data "i")};
        Asm.Binary {op = Asm.Add; typ = Asm.Longword; src = (Asm.Imm 1L);
          dst = (Asm.Data "i")};
        (Asm.Label "incr_i.if.en.1");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret];
      frame =
      Env.lenv {
        namespace = "incr_i";
        counter = 3;
        offset = -4;
        stack slots = {
          incr_i.tmp.0 -> -4,
        }}};
     Asm.Function {name = "decr_j"; global = true;
       instructions =
       [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 16L);
          dst = (Asm.Reg Asm.SP)};
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm -1L);
           dst = (Asm.Data "j")};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -4)};
         (Asm.SetCC (Asm.E, (Asm.Stack -4)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -4)};
         (Asm.JmpCC (Asm.E, "decr_j.if.en.2"));
         Asm.Binary {op = Asm.Sub; typ = Asm.Longword; src = (Asm.Imm 1L);
           dst = (Asm.Data "j")};
         (Asm.Label "decr_j.if.en.2");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret];
       frame =
       Env.lenv {
         namespace = "decr_j";
         counter = 4;
         offset = -4;
         stack slots = {
           decr_j.tmp.1 -> -4,
         }}};
     Asm.Function {name = "main"; global = true;
       instructions =
       [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 32L);
          dst = (Asm.Reg Asm.SP)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Data "i");
           dst = (Asm.Reg Asm.R10)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -4)};
         Asm.Binary {op = Asm.Add; typ = Asm.Longword; src = (Asm.Imm 1L);
           dst = (Asm.Data "i")};
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -4)};
         (Asm.JmpCC (Asm.E, "main.cond.el.3")); (Asm.Jmp "main.cond.en.2");
         (Asm.Label "main.cond.el.3"); (Asm.Call "incr_i");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
           dst = (Asm.Stack -8)};
         (Asm.Label "main.cond.en.2");
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 3L);
           dst = (Asm.Data "i")};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -12)};
         (Asm.SetCC (Asm.NE, (Asm.Stack -12)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -12)};
         (Asm.JmpCC (Asm.E, "main.if.en.6"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret; (Asm.Label "main.if.en.6");
         Asm.Binary {op = Asm.Sub; typ = Asm.Longword; src = (Asm.Imm 1L);
           dst = (Asm.Data "j")};
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Data "j")};
         (Asm.JmpCC (Asm.E, "main.cond.el.9")); (Asm.Call "decr_j");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
           dst = (Asm.Stack -16)};
         (Asm.Jmp "main.cond.en.8"); (Asm.Label "main.cond.el.9");
         (Asm.Label "main.cond.en.8");
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm -2L);
           dst = (Asm.Data "j")};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -20)};
         (Asm.SetCC (Asm.NE, (Asm.Stack -20)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -20)};
         (Asm.JmpCC (Asm.E, "main.if.en.13"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 2L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret; (Asm.Label "main.if.en.13");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret];
       frame =
       Env.lenv {
         namespace = "main";
         counter = 14;
         offset = -20;
         stack slots = {
           main.tmp.1  -> -4,
           main.tmp.4  -> -8,
           main.tmp.5  -> -12,
           main.tmp.10 -> -16,
           main.tmp.12 -> -20,
         }}};
     Asm.StaticVariable {name = "i"; global = true; alignment = 4;
       init = (Ctype.IntInit 0l)};
     Asm.StaticVariable {name = "j"; global = true; alignment = 4;
       init = (Ctype.IntInit 0l)}
     ])
