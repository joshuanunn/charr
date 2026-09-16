(Asm.Program
   [Asm.Function {name = "check_int"; global = true;
      instructions =
      [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 16L);
         dst = (Asm.Reg Asm.SP)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.DI);
          dst = (Asm.Stack -4)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.SI);
          dst = (Asm.Stack -8)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -8);
          dst = (Asm.Reg Asm.R10)};
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -4)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -12)};
        (Asm.SetCC (Asm.E, (Asm.Stack -12)));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -12);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret];
      frame =
      Env.lenv {
        namespace = "check_int";
        counter = 1;
        offset = -12;
        stack slots = {
          converted.0     -> -4,
          expected.1      -> -8,
          check_int.tmp.0 -> -12,
        }}};
     Asm.Function {name = "check_long"; global = true;
       instructions =
       [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 32L);
          dst = (Asm.Reg Asm.SP)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Reg Asm.DI);
           dst = (Asm.Stack -8)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Reg Asm.SI);
           dst = (Asm.Stack -16)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Stack -16);
           dst = (Asm.Reg Asm.R10)};
         Asm.Cmp {typ = Asm.Quadword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -8)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -20)};
         (Asm.SetCC (Asm.E, (Asm.Stack -20)));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -20);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret];
       frame =
       Env.lenv {
         namespace = "check_long";
         counter = 1;
         offset = -20;
         stack slots = {
           converted.2      -> -8,
           expected.3       -> -16,
           check_long.tmp.0 -> -20,
         }}};
     Asm.Function {name = "check_ulong"; global = true;
       instructions =
       [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 32L);
          dst = (Asm.Reg Asm.SP)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Reg Asm.DI);
           dst = (Asm.Stack -8)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Reg Asm.SI);
           dst = (Asm.Stack -16)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Stack -16);
           dst = (Asm.Reg Asm.R10)};
         Asm.Cmp {typ = Asm.Quadword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -8)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -20)};
         (Asm.SetCC (Asm.E, (Asm.Stack -20)));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -20);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret];
       frame =
       Env.lenv {
         namespace = "check_ulong";
         counter = 1;
         offset = -20;
         stack slots = {
           converted.4       -> -8,
           expected.5        -> -16,
           check_ulong.tmp.0 -> -20,
         }}};
     Asm.Function {name = "return_extended_uint"; global = true;
       instructions =
       [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 16L);
          dst = (Asm.Reg Asm.SP)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.DI);
           dst = (Asm.Stack -4)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -4);
           dst = (Asm.Reg Asm.R11)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Reg Asm.R11);
           dst = (Asm.Stack -16)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Stack -16);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret];
       frame =
       Env.lenv {
         namespace = "return_extended_uint";
         counter = 1;
         offset = -16;
         stack slots = {
           u.6                        -> -4,
           return_extended_uint.tmp.0 -> -16,
         }}};
     Asm.Function {name = "return_extended_int"; global = true;
       instructions =
       [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 16L);
          dst = (Asm.Reg Asm.SP)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.DI);
           dst = (Asm.Stack -4)};
         Asm.Movsx {src = (Asm.Stack -4); dst = (Asm.Reg Asm.R11)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Reg Asm.R11);
           dst = (Asm.Stack -16)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Stack -16);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret];
       frame =
       Env.lenv {
         namespace = "return_extended_int";
         counter = 1;
         offset = -16;
         stack slots = {
           i.7                       -> -4,
           return_extended_int.tmp.0 -> -16,
         }}};
     Asm.Function {name = "return_truncated_ulong"; global = true;
       instructions =
       [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 16L);
          dst = (Asm.Reg Asm.SP)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Reg Asm.DI);
           dst = (Asm.Stack -8)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -8);
           dst = (Asm.Reg Asm.R10)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -12)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -12);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret];
       frame =
       Env.lenv {
         namespace = "return_truncated_ulong";
         counter = 1;
         offset = -12;
         stack slots = {
           ul.8                         -> -8,
           return_truncated_ulong.tmp.0 -> -12,
         }}};
     Asm.Function {name = "extend_on_assignment"; global = true;
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
         (Asm.SetCC (Asm.E, (Asm.Stack -28)));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -28);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret];
       frame =
       Env.lenv {
         namespace = "extend_on_assignment";
         counter = 2;
         offset = -28;
         stack slots = {
           ui.9                       -> -4,
           expected.10                -> -16,
           extend_on_assignment.tmp.0 -> -24,
           extend_on_assignment.tmp.1 -> -28,
         }}};
     Asm.Function {name = "main"; global = true;
       instructions =
       [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 80L);
          dst = (Asm.Reg Asm.SP)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 5L);
           dst = (Asm.Reg Asm.DI)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 5L);
           dst = (Asm.Reg Asm.SI)};
         (Asm.Call "check_int");
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
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Imm 2147483658L);
           dst = (Asm.Reg Asm.DI)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Imm 2147483658L);
           dst = (Asm.Reg Asm.SI)};
         (Asm.Call "check_long");
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
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Imm -1L);
           dst = (Asm.Reg Asm.DI)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Imm -1L);
           dst = (Asm.Reg Asm.SI)};
         (Asm.Call "check_ulong");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
           dst = (Asm.Stack -20)};
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -20)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -24)};
         (Asm.SetCC (Asm.E, (Asm.Stack -24)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -24)};
         (Asm.JmpCC (Asm.E, "main.if.en.12"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 3L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret; (Asm.Label "main.if.en.12");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm -2147483638L);
           dst = (Asm.Reg Asm.DI)};
         (Asm.Call "return_extended_uint");
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Reg Asm.AX);
           dst = (Asm.Stack -32)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Imm 2147483658L);
           dst = (Asm.Reg Asm.R10)};
         Asm.Cmp {typ = Asm.Quadword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -32)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -36)};
         (Asm.SetCC (Asm.NE, (Asm.Stack -36)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -36)};
         (Asm.JmpCC (Asm.E, "main.if.en.15"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 4L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret; (Asm.Label "main.if.en.15");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm -1L);
           dst = (Asm.Reg Asm.DI)};
         (Asm.Call "return_extended_int");
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Reg Asm.AX);
           dst = (Asm.Stack -48)};
         Asm.Cmp {typ = Asm.Quadword; src = (Asm.Imm -1L);
           dst = (Asm.Stack -48)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -52)};
         (Asm.SetCC (Asm.NE, (Asm.Stack -52)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -52)};
         (Asm.JmpCC (Asm.E, "main.if.en.19"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 5L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret; (Asm.Label "main.if.en.19");
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Imm 1125902054326372L);
           dst = (Asm.Reg Asm.DI)};
         (Asm.Call "return_truncated_ulong");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
           dst = (Asm.Stack -56)};
         Asm.Movsx {src = (Asm.Stack -56); dst = (Asm.Reg Asm.R11)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Reg Asm.R11);
           dst = (Asm.Stack -64)};
         Asm.Cmp {typ = Asm.Quadword; src = (Asm.Imm -2147483548L);
           dst = (Asm.Stack -64)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -68)};
         (Asm.SetCC (Asm.NE, (Asm.Stack -68)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -68)};
         (Asm.JmpCC (Asm.E, "main.if.en.24"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 6L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret; (Asm.Label "main.if.en.24");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm -2147483638L);
           dst = (Asm.Reg Asm.DI)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Imm 2147483658L);
           dst = (Asm.Reg Asm.SI)};
         (Asm.Call "extend_on_assignment");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
           dst = (Asm.Stack -72)};
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -72)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -76)};
         (Asm.SetCC (Asm.E, (Asm.Stack -76)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -76)};
         (Asm.JmpCC (Asm.E, "main.if.en.27"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 7L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret; (Asm.Label "main.if.en.27");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret];
       frame =
       Env.lenv {
         namespace = "main";
         counter = 32;
         offset = -76;
         stack slots = {
           main.tmp.1  -> -4,
           main.tmp.2  -> -8,
           main.tmp.5  -> -12,
           main.tmp.6  -> -16,
           main.tmp.10 -> -20,
           main.tmp.11 -> -24,
           main.tmp.13 -> -32,
           main.tmp.14 -> -36,
           main.tmp.17 -> -48,
           main.tmp.18 -> -52,
           main.tmp.20 -> -56,
           main.tmp.21 -> -64,
           main.tmp.23 -> -68,
           main.tmp.25 -> -72,
           main.tmp.26 -> -76,
         }}}
     ])
