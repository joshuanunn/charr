(Asm.Program
   [Asm.Function {name = "target_negate"; global = true;
      instructions =
      [Asm.Mov {typ = Asm.Longword; src = (Asm.Imm -3L);
         dst = (Asm.Reg Asm.AX)};
        Asm.Ret];
      frame =
      Env.lenv {
        namespace = "target_negate";
        counter = 1;
        offset = 0;
        stack slots = {
        }}};
     Asm.Function {name = "target_negate_zero"; global = true;
       instructions =
       [Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Reg Asm.AX)};
         Asm.Ret];
       frame =
       Env.lenv {
         namespace = "target_negate_zero";
         counter = 1;
         offset = 0;
         stack slots = {
         }}};
     Asm.Function {name = "target_not"; global = true;
       instructions =
       [Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Reg Asm.AX)};
         Asm.Ret];
       frame =
       Env.lenv {
         namespace = "target_not";
         counter = 1;
         offset = 0;
         stack slots = {
         }}};
     Asm.Function {name = "target_not_zero"; global = true;
       instructions =
       [Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
          dst = (Asm.Reg Asm.AX)};
         Asm.Ret];
       frame =
       Env.lenv {
         namespace = "target_not_zero";
         counter = 1;
         offset = 0;
         stack slots = {
         }}};
     Asm.Function {name = "target_complement"; global = true;
       instructions =
       [Asm.Mov {typ = Asm.Longword; src = (Asm.Imm -2L);
          dst = (Asm.Reg Asm.AX)};
         Asm.Ret];
       frame =
       Env.lenv {
         namespace = "target_complement";
         counter = 1;
         offset = 0;
         stack slots = {
         }}};
     Asm.Function {name = "main"; global = true;
       instructions =
       [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 48L);
          dst = (Asm.Reg Asm.SP)};
         (Asm.Call "target_negate");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
           dst = (Asm.Stack -4)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Data "three");
           dst = (Asm.Reg Asm.R10)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -8)};
         Asm.Unary {op = Asm.Neg; typ = Asm.Longword; dst = (Asm.Stack -8)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -8);
           dst = (Asm.Reg Asm.R10)};
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -4)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -12)};
         (Asm.SetCC (Asm.NE, (Asm.Stack -12)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -12)};
         (Asm.JmpCC (Asm.E, "main.if.en.3"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret; (Asm.Label "main.if.en.3");
         (Asm.Call "target_negate_zero");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
           dst = (Asm.Stack -16)};
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -16)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -20)};
         (Asm.SetCC (Asm.NE, (Asm.Stack -20)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -20)};
         (Asm.JmpCC (Asm.E, "main.if.en.6"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 2L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret; (Asm.Label "main.if.en.6"); (Asm.Call "target_not");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
           dst = (Asm.Stack -24)};
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -24)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -28)};
         (Asm.SetCC (Asm.NE, (Asm.Stack -28)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -28)};
         (Asm.JmpCC (Asm.E, "main.if.en.9"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 3L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret; (Asm.Label "main.if.en.9"); (Asm.Call "target_not_zero");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
           dst = (Asm.Stack -32)};
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 1L);
           dst = (Asm.Stack -32)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -36)};
         (Asm.SetCC (Asm.NE, (Asm.Stack -36)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -36)};
         (Asm.JmpCC (Asm.E, "main.if.en.12"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 4L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret; (Asm.Label "main.if.en.12");
         (Asm.Call "target_complement");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
           dst = (Asm.Stack -40)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Data "two");
           dst = (Asm.Reg Asm.R10)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -44)};
         Asm.Unary {op = Asm.Neg; typ = Asm.Longword; dst = (Asm.Stack -44)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -44);
           dst = (Asm.Reg Asm.R10)};
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -40)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -48)};
         (Asm.SetCC (Asm.NE, (Asm.Stack -48)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -48)};
         (Asm.JmpCC (Asm.E, "main.if.en.16"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 5L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret; (Asm.Label "main.if.en.16");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret];
       frame =
       Env.lenv {
         namespace = "main";
         counter = 17;
         offset = -48;
         stack slots = {
           main.tmp.0  -> -4,
           main.tmp.1  -> -8,
           main.tmp.2  -> -12,
           main.tmp.4  -> -16,
           main.tmp.5  -> -20,
           main.tmp.7  -> -24,
           main.tmp.8  -> -28,
           main.tmp.10 -> -32,
           main.tmp.11 -> -36,
           main.tmp.13 -> -40,
           main.tmp.14 -> -44,
           main.tmp.15 -> -48,
         }}};
     Asm.StaticVariable {name = "two"; global = true; alignment = 4;
       init = (Ctype.IntInit 2l)};
     Asm.StaticVariable {name = "three"; global = true; alignment = 4;
       init = (Ctype.IntInit 3l)}
     ])
