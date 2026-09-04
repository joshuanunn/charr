(Asm.Program
   [Asm.Function {name = "target_if"; global = true;
      instructions =
      [Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
         dst = (Asm.Reg Asm.AX)};
        Asm.Ret];
      frame =
      Env.lenv {
        namespace = "target_if";
        counter = 1;
        offset = 0;
        stack slots = {
        }}};
     Asm.Function {name = "target_if_else_true"; global = true;
       instructions =
       [Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 2L);
          dst = (Asm.Reg Asm.AX)};
         Asm.Ret];
       frame =
       Env.lenv {
         namespace = "target_if_else_true";
         counter = 2;
         offset = 0;
         stack slots = {
         }}};
     Asm.Function {name = "target_if_else_false"; global = true;
       instructions =
       [Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 3L);
          dst = (Asm.Reg Asm.AX)};
         Asm.Ret];
       frame =
       Env.lenv {
         namespace = "target_if_else_false";
         counter = 2;
         offset = 0;
         stack slots = {
         }}};
     Asm.Function {name = "target_conditional_true"; global = true;
       instructions =
       [Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 2L);
          dst = (Asm.Reg Asm.AX)};
         Asm.Ret];
       frame =
       Env.lenv {
         namespace = "target_conditional_true";
         counter = 3;
         offset = 0;
         stack slots = {
         }}};
     Asm.Function {name = "target_conditional_false"; global = true;
       instructions =
       [Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 5L);
          dst = (Asm.Reg Asm.AX)};
         Asm.Ret];
       frame =
       Env.lenv {
         namespace = "target_conditional_false";
         counter = 3;
         offset = 0;
         stack slots = {
         }}};
     Asm.Function {name = "target_do_loop"; global = true;
       instructions =
       [Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 10L);
          dst = (Asm.Reg Asm.AX)};
         Asm.Ret];
       frame =
       Env.lenv {
         namespace = "target_do_loop";
         counter = 0;
         offset = 0;
         stack slots = {
         }}};
     Asm.Function {name = "target_while_loop_false"; global = true;
       instructions =
       [Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Reg Asm.AX)};
         Asm.Ret];
       frame =
       Env.lenv {
         namespace = "target_while_loop_false";
         counter = 0;
         offset = 0;
         stack slots = {
         }}};
     Asm.Function {name = "target_while_loop_true"; global = true;
       instructions =
       [Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 10L);
          dst = (Asm.Reg Asm.AX)};
         Asm.Ret];
       frame =
       Env.lenv {
         namespace = "target_while_loop_true";
         counter = 0;
         offset = 0;
         stack slots = {
         }}};
     Asm.Function {name = "target_for_loop_true"; global = true;
       instructions =
       [Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 100L);
          dst = (Asm.Reg Asm.AX)};
         Asm.Ret];
       frame =
       Env.lenv {
         namespace = "target_for_loop_true";
         counter = 0;
         offset = 0;
         stack slots = {
         }}};
     Asm.Function {name = "target_for_loop_false"; global = true;
       instructions =
       [Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Reg Asm.AX)};
         Asm.Ret];
       frame =
       Env.lenv {
         namespace = "target_for_loop_false";
         counter = 0;
         offset = 0;
         stack slots = {
         }}};
     Asm.Function {name = "main"; global = true;
       instructions =
       [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 80L);
          dst = (Asm.Reg Asm.SP)};
         (Asm.Call "target_if");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
           dst = (Asm.Stack -4)};
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -4)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -8)};
         (Asm.SetCC (Asm.NE, (Asm.Stack -8)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -8)};
         (Asm.JmpCC (Asm.E, "main.if.en.2"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret; (Asm.Label "main.if.en.2");
         (Asm.Call "target_if_else_true");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
           dst = (Asm.Stack -12)};
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 2L);
           dst = (Asm.Stack -12)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -16)};
         (Asm.SetCC (Asm.NE, (Asm.Stack -16)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -16)};
         (Asm.JmpCC (Asm.E, "main.if.en.5"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 2L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret; (Asm.Label "main.if.en.5");
         (Asm.Call "target_if_else_false");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
           dst = (Asm.Stack -20)};
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 3L);
           dst = (Asm.Stack -20)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -24)};
         (Asm.SetCC (Asm.NE, (Asm.Stack -24)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -24)};
         (Asm.JmpCC (Asm.E, "main.if.en.8"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 3L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret; (Asm.Label "main.if.en.8");
         (Asm.Call "target_conditional_true");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
           dst = (Asm.Stack -28)};
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 2L);
           dst = (Asm.Stack -28)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -32)};
         (Asm.SetCC (Asm.NE, (Asm.Stack -32)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -32)};
         (Asm.JmpCC (Asm.E, "main.if.en.11"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 4L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret; (Asm.Label "main.if.en.11");
         (Asm.Call "target_conditional_false");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
           dst = (Asm.Stack -36)};
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 5L);
           dst = (Asm.Stack -36)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -40)};
         (Asm.SetCC (Asm.NE, (Asm.Stack -40)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -40)};
         (Asm.JmpCC (Asm.E, "main.if.en.14"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 5L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret; (Asm.Label "main.if.en.14"); (Asm.Call "target_do_loop");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
           dst = (Asm.Stack -44)};
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 10L);
           dst = (Asm.Stack -44)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -48)};
         (Asm.SetCC (Asm.NE, (Asm.Stack -48)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -48)};
         (Asm.JmpCC (Asm.E, "main.if.en.17"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 6L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret; (Asm.Label "main.if.en.17");
         (Asm.Call "target_while_loop_false");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
           dst = (Asm.Stack -52)};
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -52)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -56)};
         (Asm.SetCC (Asm.NE, (Asm.Stack -56)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -56)};
         (Asm.JmpCC (Asm.E, "main.if.en.20"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 7L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret; (Asm.Label "main.if.en.20");
         (Asm.Call "target_while_loop_true");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
           dst = (Asm.Stack -60)};
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 10L);
           dst = (Asm.Stack -60)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -64)};
         (Asm.SetCC (Asm.NE, (Asm.Stack -64)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -64)};
         (Asm.JmpCC (Asm.E, "main.if.en.23"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 8L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret; (Asm.Label "main.if.en.23");
         (Asm.Call "target_for_loop_true");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
           dst = (Asm.Stack -68)};
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 100L);
           dst = (Asm.Stack -68)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -72)};
         (Asm.SetCC (Asm.NE, (Asm.Stack -72)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -72)};
         (Asm.JmpCC (Asm.E, "main.if.en.26"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 9L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret; (Asm.Label "main.if.en.26");
         (Asm.Call "target_for_loop_false");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
           dst = (Asm.Stack -76)};
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -76)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -80)};
         (Asm.SetCC (Asm.NE, (Asm.Stack -80)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -80)};
         (Asm.JmpCC (Asm.E, "main.if.en.29"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 10L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret; (Asm.Label "main.if.en.29");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret];
       frame =
       Env.lenv {
         namespace = "main";
         counter = 30;
         offset = -80;
         stack slots = {
           main.tmp.0  -> -4,
           main.tmp.1  -> -8,
           main.tmp.3  -> -12,
           main.tmp.4  -> -16,
           main.tmp.6  -> -20,
           main.tmp.7  -> -24,
           main.tmp.9  -> -28,
           main.tmp.10 -> -32,
           main.tmp.12 -> -36,
           main.tmp.13 -> -40,
           main.tmp.15 -> -44,
           main.tmp.16 -> -48,
           main.tmp.18 -> -52,
           main.tmp.19 -> -56,
           main.tmp.21 -> -60,
           main.tmp.22 -> -64,
           main.tmp.24 -> -68,
           main.tmp.25 -> -72,
           main.tmp.27 -> -76,
           main.tmp.28 -> -80,
         }}}
     ])
