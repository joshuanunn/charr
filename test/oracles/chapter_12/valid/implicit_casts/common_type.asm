(Asm.Program
   [Asm.Function {name = "int_gt_uint"; global = true;
      instructions =
      [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 16L);
         dst = (Asm.Reg Asm.SP)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.DI);
          dst = (Asm.Stack -4)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.SI);
          dst = (Asm.Stack -8)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -4);
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -12)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -8);
          dst = (Asm.Reg Asm.R10)};
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -12)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -16)};
        (Asm.SetCC (Asm.A, (Asm.Stack -16)));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -16);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret];
      frame =
      Env.lenv {
        namespace = "int_gt_uint";
        counter = 2;
        offset = -16;
        stack slots = {
          i.0               -> -4,
          u.1               -> -8,
          int_gt_uint.tmp.0 -> -12,
          int_gt_uint.tmp.1 -> -16,
        }}};
     Asm.Function {name = "int_gt_ulong"; global = true;
       instructions =
       [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 32L);
          dst = (Asm.Reg Asm.SP)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.DI);
           dst = (Asm.Stack -4)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Reg Asm.SI);
           dst = (Asm.Stack -16)};
         Asm.Movsx {src = (Asm.Stack -4); dst = (Asm.Reg Asm.R11)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Reg Asm.R11);
           dst = (Asm.Stack -24)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Stack -16);
           dst = (Asm.Reg Asm.R10)};
         Asm.Cmp {typ = Asm.Quadword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -24)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -28)};
         (Asm.SetCC (Asm.A, (Asm.Stack -28)));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -28);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret];
       frame =
       Env.lenv {
         namespace = "int_gt_ulong";
         counter = 2;
         offset = -28;
         stack slots = {
           i.2                -> -4,
           ul.3               -> -16,
           int_gt_ulong.tmp.0 -> -24,
           int_gt_ulong.tmp.1 -> -28,
         }}};
     Asm.Function {name = "uint_gt_long"; global = true;
       instructions =
       [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 32L);
          dst = (Asm.Reg Asm.SP)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.DI);
           dst = (Asm.Stack -4)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Reg Asm.SI);
           dst = (Asm.Stack -16)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -4);
           dst = (Asm.Reg Asm.R11)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Reg Asm.R11);
           dst = (Asm.Stack -24)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Stack -16);
           dst = (Asm.Reg Asm.R10)};
         Asm.Cmp {typ = Asm.Quadword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -24)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -28)};
         (Asm.SetCC (Asm.G, (Asm.Stack -28)));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -28);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret];
       frame =
       Env.lenv {
         namespace = "uint_gt_long";
         counter = 2;
         offset = -28;
         stack slots = {
           u.4                -> -4,
           l.5                -> -16,
           uint_gt_long.tmp.0 -> -24,
           uint_gt_long.tmp.1 -> -28,
         }}};
     Asm.Function {name = "uint_lt_ulong"; global = true;
       instructions =
       [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 32L);
          dst = (Asm.Reg Asm.SP)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.DI);
           dst = (Asm.Stack -4)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Reg Asm.SI);
           dst = (Asm.Stack -16)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -4);
           dst = (Asm.Reg Asm.R11)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Reg Asm.R11);
           dst = (Asm.Stack -24)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Stack -16);
           dst = (Asm.Reg Asm.R10)};
         Asm.Cmp {typ = Asm.Quadword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -24)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -28)};
         (Asm.SetCC (Asm.B, (Asm.Stack -28)));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -28);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret];
       frame =
       Env.lenv {
         namespace = "uint_lt_ulong";
         counter = 2;
         offset = -28;
         stack slots = {
           u.6                 -> -4,
           ul.7                -> -16,
           uint_lt_ulong.tmp.0 -> -24,
           uint_lt_ulong.tmp.1 -> -28,
         }}};
     Asm.Function {name = "long_gt_ulong"; global = true;
       instructions =
       [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 32L);
          dst = (Asm.Reg Asm.SP)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Reg Asm.DI);
           dst = (Asm.Stack -8)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Reg Asm.SI);
           dst = (Asm.Stack -16)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Stack -8);
           dst = (Asm.Reg Asm.R10)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -24)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Stack -16);
           dst = (Asm.Reg Asm.R10)};
         Asm.Cmp {typ = Asm.Quadword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -24)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -28)};
         (Asm.SetCC (Asm.A, (Asm.Stack -28)));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -28);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret];
       frame =
       Env.lenv {
         namespace = "long_gt_ulong";
         counter = 2;
         offset = -28;
         stack slots = {
           l.8                 -> -8,
           ul.9                -> -16,
           long_gt_ulong.tmp.0 -> -24,
           long_gt_ulong.tmp.1 -> -28,
         }}};
     Asm.Function {name = "ternary_int_uint"; global = true;
       instructions =
       [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 48L);
          dst = (Asm.Reg Asm.SP)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.DI);
           dst = (Asm.Stack -4)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.SI);
           dst = (Asm.Stack -8)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.DX);
           dst = (Asm.Stack -12)};
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -4)};
         (Asm.JmpCC (Asm.E, "ternary_int_uint.cond.el.2"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -8);
           dst = (Asm.Reg Asm.R10)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -16)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -16);
           dst = (Asm.Reg Asm.R10)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -20)};
         (Asm.Jmp "ternary_int_uint.cond.en.1");
         (Asm.Label "ternary_int_uint.cond.el.2");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -12);
           dst = (Asm.Reg Asm.R10)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -20)};
         (Asm.Label "ternary_int_uint.cond.en.1");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -20);
           dst = (Asm.Reg Asm.R11)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Reg Asm.R11);
           dst = (Asm.Stack -32)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Imm 4294967295L);
           dst = (Asm.Reg Asm.R10)};
         Asm.Cmp {typ = Asm.Quadword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -32)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -36)};
         (Asm.SetCC (Asm.E, (Asm.Stack -36)));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -36);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret];
       frame =
       Env.lenv {
         namespace = "ternary_int_uint";
         counter = 6;
         offset = -36;
         stack slots = {
           flag.10                -> -4,
           i.11                   -> -8,
           ui.12                  -> -12,
           ternary_int_uint.tmp.3 -> -16,
           ternary_int_uint.tmp.0 -> -20,
           ternary_int_uint.tmp.4 -> -32,
           ternary_int_uint.tmp.5 -> -36,
         }}};
     Asm.Function {name = "main"; global = true;
       instructions =
       [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 48L);
          dst = (Asm.Reg Asm.SP)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm -100L);
           dst = (Asm.Reg Asm.DI)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 100L);
           dst = (Asm.Reg Asm.SI)};
         (Asm.Call "int_gt_uint");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
           dst = (Asm.Stack -4)};
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -4)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -8)};
         (Asm.SetCC (Asm.E, (Asm.Stack -8)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -8)};
         (Asm.JmpCC (Asm.E, "main.if.en.3"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret; (Asm.Label "main.if.en.3");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm -1L);
           dst = (Asm.Reg Asm.DI)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Imm -10L);
           dst = (Asm.Reg Asm.SI)};
         (Asm.Call "int_gt_ulong");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
           dst = (Asm.Stack -12)};
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -12)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -16)};
         (Asm.SetCC (Asm.E, (Asm.Stack -16)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -16)};
         (Asm.JmpCC (Asm.E, "main.if.en.7"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 2L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret; (Asm.Label "main.if.en.7");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 100L);
           dst = (Asm.Reg Asm.DI)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Imm -100L);
           dst = (Asm.Reg Asm.SI)};
         (Asm.Call "uint_gt_long");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
           dst = (Asm.Stack -20)};
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -20)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -24)};
         (Asm.SetCC (Asm.E, (Asm.Stack -24)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -24)};
         (Asm.JmpCC (Asm.E, "main.if.en.11"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 3L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret; (Asm.Label "main.if.en.11");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1073741824L);
           dst = (Asm.Reg Asm.DI)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Imm 34359738368L);
           dst = (Asm.Reg Asm.SI)};
         (Asm.Call "uint_lt_ulong");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
           dst = (Asm.Stack -28)};
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -28)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -32)};
         (Asm.SetCC (Asm.E, (Asm.Stack -32)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -32)};
         (Asm.JmpCC (Asm.E, "main.if.en.14"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 4L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret; (Asm.Label "main.if.en.14");
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Imm -1L);
           dst = (Asm.Reg Asm.DI)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Imm 1000L);
           dst = (Asm.Reg Asm.SI)};
         (Asm.Call "long_gt_ulong");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
           dst = (Asm.Stack -36)};
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -36)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -40)};
         (Asm.SetCC (Asm.E, (Asm.Stack -40)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -40)};
         (Asm.JmpCC (Asm.E, "main.if.en.18"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 5L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret; (Asm.Label "main.if.en.18");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
           dst = (Asm.Reg Asm.DI)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm -1L);
           dst = (Asm.Reg Asm.SI)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
           dst = (Asm.Reg Asm.DX)};
         (Asm.Call "ternary_int_uint");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
           dst = (Asm.Stack -44)};
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -44)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -48)};
         (Asm.SetCC (Asm.E, (Asm.Stack -48)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -48)};
         (Asm.JmpCC (Asm.E, "main.if.en.22"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 6L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret; (Asm.Label "main.if.en.22");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret];
       frame =
       Env.lenv {
         namespace = "main";
         counter = 23;
         offset = -48;
         stack slots = {
           main.tmp.1  -> -4,
           main.tmp.2  -> -8,
           main.tmp.5  -> -12,
           main.tmp.6  -> -16,
           main.tmp.9  -> -20,
           main.tmp.10 -> -24,
           main.tmp.12 -> -28,
           main.tmp.13 -> -32,
           main.tmp.16 -> -36,
           main.tmp.17 -> -40,
           main.tmp.20 -> -44,
           main.tmp.21 -> -48,
         }}}
     ])
