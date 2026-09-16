(Asm.Program
   [Asm.Function {name = "ulong_to_int"; global = true;
      instructions =
      [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 32L);
         dst = (Asm.Reg Asm.SP)};
        Asm.Mov {typ = Asm.Quadword; src = (Asm.Reg Asm.DI);
          dst = (Asm.Stack -8)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.SI);
          dst = (Asm.Stack -12)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -8);
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -16)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -12);
          dst = (Asm.Reg Asm.R10)};
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -16)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -20)};
        (Asm.SetCC (Asm.E, (Asm.Stack -20)));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -20);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret];
      frame =
      Env.lenv {
        namespace = "ulong_to_int";
        counter = 2;
        offset = -20;
        stack slots = {
          ul.0               -> -8,
          expected.1         -> -12,
          ulong_to_int.tmp.0 -> -16,
          ulong_to_int.tmp.1 -> -20,
        }}};
     Asm.Function {name = "ulong_to_uint"; global = true;
       instructions =
       [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 32L);
          dst = (Asm.Reg Asm.SP)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Reg Asm.DI);
           dst = (Asm.Stack -8)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.SI);
           dst = (Asm.Stack -12)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -8);
           dst = (Asm.Reg Asm.R10)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -16)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -12);
           dst = (Asm.Reg Asm.R10)};
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -16)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -20)};
         (Asm.SetCC (Asm.E, (Asm.Stack -20)));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -20);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret];
       frame =
       Env.lenv {
         namespace = "ulong_to_uint";
         counter = 2;
         offset = -20;
         stack slots = {
           ul.3                -> -8,
           expected.4          -> -12,
           ulong_to_uint.tmp.0 -> -16,
           ulong_to_uint.tmp.1 -> -20,
         }}};
     Asm.Function {name = "long_to_uint"; global = true;
       instructions =
       [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 32L);
          dst = (Asm.Reg Asm.SP)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Reg Asm.DI);
           dst = (Asm.Stack -8)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.SI);
           dst = (Asm.Stack -12)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -8);
           dst = (Asm.Reg Asm.R10)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -16)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -12);
           dst = (Asm.Reg Asm.R10)};
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -16)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -20)};
         (Asm.SetCC (Asm.E, (Asm.Stack -20)));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -20);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret];
       frame =
       Env.lenv {
         namespace = "long_to_uint";
         counter = 2;
         offset = -20;
         stack slots = {
           l.5                -> -8,
           expected.6         -> -12,
           long_to_uint.tmp.0 -> -16,
           long_to_uint.tmp.1 -> -20,
         }}};
     Asm.Function {name = "main"; global = true;
       instructions =
       [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 64L);
          dst = (Asm.Reg Asm.SP)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Imm 100L);
           dst = (Asm.Reg Asm.DI)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 100L);
           dst = (Asm.Reg Asm.SI)};
         (Asm.Call "long_to_uint");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
           dst = (Asm.Stack -4)};
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -4)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -8)};
         (Asm.SetCC (Asm.E, (Asm.Stack -8)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -8)};
         (Asm.JmpCC (Asm.E, "main.if.en.2"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret; (Asm.Label "main.if.en.2");
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Imm -9223372036854774574L);
           dst = (Asm.Reg Asm.DI)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1234L);
           dst = (Asm.Reg Asm.SI)};
         (Asm.Call "long_to_uint");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
           dst = (Asm.Stack -12)};
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -12)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -16)};
         (Asm.SetCC (Asm.E, (Asm.Stack -16)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -16)};
         (Asm.JmpCC (Asm.E, "main.if.en.6"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 2L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret; (Asm.Label "main.if.en.6");
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Imm 100L);
           dst = (Asm.Reg Asm.DI)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 100L);
           dst = (Asm.Reg Asm.SI)};
         (Asm.Call "ulong_to_int");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
           dst = (Asm.Stack -20)};
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -20)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -24)};
         (Asm.SetCC (Asm.E, (Asm.Stack -24)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -24)};
         (Asm.JmpCC (Asm.E, "main.if.en.9"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 3L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret; (Asm.Label "main.if.en.9");
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Imm 100L);
           dst = (Asm.Reg Asm.DI)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 100L);
           dst = (Asm.Reg Asm.SI)};
         (Asm.Call "ulong_to_uint");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
           dst = (Asm.Stack -28)};
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -28)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -32)};
         (Asm.SetCC (Asm.E, (Asm.Stack -32)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -32)};
         (Asm.JmpCC (Asm.E, "main.if.en.12"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 4L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret; (Asm.Label "main.if.en.12");
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Imm 4294967200L);
           dst = (Asm.Reg Asm.DI)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm -96L);
           dst = (Asm.Reg Asm.SI)};
         (Asm.Call "ulong_to_uint");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
           dst = (Asm.Stack -36)};
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -36)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -40)};
         (Asm.SetCC (Asm.E, (Asm.Stack -40)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -40)};
         (Asm.JmpCC (Asm.E, "main.if.en.15"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 5L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret; (Asm.Label "main.if.en.15");
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Imm 4294967200L);
           dst = (Asm.Reg Asm.DI)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm -96L);
           dst = (Asm.Reg Asm.SI)};
         (Asm.Call "ulong_to_int");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
           dst = (Asm.Stack -44)};
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -44)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -48)};
         (Asm.SetCC (Asm.E, (Asm.Stack -48)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -48)};
         (Asm.JmpCC (Asm.E, "main.if.en.19"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 6L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret; (Asm.Label "main.if.en.19");
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Imm 1152921506754330624L);
           dst = (Asm.Reg Asm.DI)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm -2147483648L);
           dst = (Asm.Reg Asm.SI)};
         (Asm.Call "ulong_to_uint");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
           dst = (Asm.Stack -52)};
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -52)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -56)};
         (Asm.SetCC (Asm.E, (Asm.Stack -56)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -56)};
         (Asm.JmpCC (Asm.E, "main.if.en.22"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 7L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret; (Asm.Label "main.if.en.22");
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Imm 1152921506754330624L);
           dst = (Asm.Reg Asm.DI)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm -2147483648L);
           dst = (Asm.Reg Asm.SI)};
         (Asm.Call "ulong_to_int");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
           dst = (Asm.Stack -60)};
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -60)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -64)};
         (Asm.SetCC (Asm.E, (Asm.Stack -64)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -64)};
         (Asm.JmpCC (Asm.E, "main.if.en.27"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 8L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret; (Asm.Label "main.if.en.27");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret];
       frame =
       Env.lenv {
         namespace = "main";
         counter = 32;
         offset = -64;
         stack slots = {
           main.tmp.0  -> -4,
           main.tmp.1  -> -8,
           main.tmp.4  -> -12,
           main.tmp.5  -> -16,
           main.tmp.7  -> -20,
           main.tmp.8  -> -24,
           main.tmp.10 -> -28,
           main.tmp.11 -> -32,
           main.tmp.13 -> -36,
           main.tmp.14 -> -40,
           main.tmp.17 -> -44,
           main.tmp.18 -> -48,
           main.tmp.20 -> -52,
           main.tmp.21 -> -56,
           main.tmp.25 -> -60,
           main.tmp.26 -> -64,
         }}}
     ])
