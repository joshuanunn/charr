(Asm.Program
   [Asm.Function {name = "int_to_ulong"; global = true;
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
        (Asm.SetCC (Asm.E, (Asm.Stack -28)));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -28);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret];
      frame =
      Env.lenv {
        namespace = "int_to_ulong";
        counter = 2;
        offset = -28;
        stack slots = {
          i.0                -> -4,
          expected.1         -> -16,
          int_to_ulong.tmp.0 -> -24,
          int_to_ulong.tmp.1 -> -28,
        }}};
     Asm.Function {name = "uint_to_long"; global = true;
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
         namespace = "uint_to_long";
         counter = 2;
         offset = -28;
         stack slots = {
           ui.3               -> -4,
           expected.4         -> -16,
           uint_to_long.tmp.0 -> -24,
           uint_to_long.tmp.1 -> -28,
         }}};
     Asm.Function {name = "uint_to_ulong"; global = true;
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
         namespace = "uint_to_ulong";
         counter = 2;
         offset = -28;
         stack slots = {
           ui.6                -> -4,
           expected.7          -> -16,
           uint_to_ulong.tmp.0 -> -24,
           uint_to_ulong.tmp.1 -> -28,
         }}};
     Asm.Function {name = "main"; global = true;
       instructions =
       [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 32L);
          dst = (Asm.Reg Asm.SP)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 10L);
           dst = (Asm.Reg Asm.DI)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Imm 10L);
           dst = (Asm.Reg Asm.SI)};
         (Asm.Call "int_to_ulong");
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
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm -10L);
           dst = (Asm.Reg Asm.DI)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Imm -10L);
           dst = (Asm.Reg Asm.SI)};
         (Asm.Call "int_to_ulong");
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
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm -96L);
           dst = (Asm.Reg Asm.DI)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Imm 4294967200L);
           dst = (Asm.Reg Asm.SI)};
         (Asm.Call "uint_to_long");
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
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm -96L);
           dst = (Asm.Reg Asm.DI)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Imm 4294967200L);
           dst = (Asm.Reg Asm.SI)};
         (Asm.Call "uint_to_ulong");
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
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret];
       frame =
       Env.lenv {
         namespace = "main";
         counter = 16;
         offset = -32;
         stack slots = {
           main.tmp.0  -> -4,
           main.tmp.1  -> -8,
           main.tmp.4  -> -12,
           main.tmp.5  -> -16,
           main.tmp.7  -> -20,
           main.tmp.8  -> -24,
           main.tmp.10 -> -28,
           main.tmp.11 -> -32,
         }}}
     ])
