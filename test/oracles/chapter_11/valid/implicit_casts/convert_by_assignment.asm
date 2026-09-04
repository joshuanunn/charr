(Asm.Program
   [Asm.Function {name = "return_truncated_long"; global = true;
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
        namespace = "return_truncated_long";
        counter = 1;
        offset = -12;
        stack slots = {
          l.0                         -> -8,
          return_truncated_long.tmp.0 -> -12,
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
           i.1                       -> -4,
           return_extended_int.tmp.0 -> -16,
         }}};
     Asm.Function {name = "truncate_on_assignment"; global = true;
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
         namespace = "truncate_on_assignment";
         counter = 2;
         offset = -20;
         stack slots = {
           l.2                          -> -8,
           expected.3                   -> -12,
           truncate_on_assignment.tmp.0 -> -16,
           truncate_on_assignment.tmp.1 -> -20,
         }}};
     Asm.Function {name = "main"; global = true;
       instructions =
       [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 48L);
          dst = (Asm.Reg Asm.SP)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Imm 4294967298L);
           dst = (Asm.Reg Asm.DI)};
         (Asm.Call "return_truncated_long");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
           dst = (Asm.Stack -4)};
         Asm.Movsx {src = (Asm.Stack -4); dst = (Asm.Reg Asm.R11)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Reg Asm.R11);
           dst = (Asm.Stack -16)};
         Asm.Cmp {typ = Asm.Quadword; src = (Asm.Imm 2L);
           dst = (Asm.Stack -16)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -20)};
         (Asm.SetCC (Asm.NE, (Asm.Stack -20)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -20)};
         (Asm.JmpCC (Asm.E, "main.if.en.3"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret; (Asm.Label "main.if.en.3");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm -10L);
           dst = (Asm.Reg Asm.DI)};
         (Asm.Call "return_extended_int");
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Reg Asm.AX);
           dst = (Asm.Stack -32)};
         Asm.Cmp {typ = Asm.Quadword; src = (Asm.Imm -10L);
           dst = (Asm.Stack -32)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -36)};
         (Asm.SetCC (Asm.NE, (Asm.Stack -36)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -36)};
         (Asm.JmpCC (Asm.E, "main.if.en.9"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 2L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret; (Asm.Label "main.if.en.9");
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Imm 17179869184L);
           dst = (Asm.Reg Asm.DI)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Reg Asm.SI)};
         (Asm.Call "truncate_on_assignment");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
           dst = (Asm.Stack -40)};
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -40)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -44)};
         (Asm.SetCC (Asm.E, (Asm.Stack -44)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -44)};
         (Asm.JmpCC (Asm.E, "main.if.en.15"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 4L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret; (Asm.Label "main.if.en.15");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret];
       frame =
       Env.lenv {
         namespace = "main";
         counter = 16;
         offset = -44;
         stack slots = {
           main.tmp.0  -> -4,
           main.tmp.1  -> -16,
           main.tmp.2  -> -20,
           main.tmp.5  -> -32,
           main.tmp.8  -> -36,
           main.tmp.13 -> -40,
           main.tmp.14 -> -44,
         }}}
     ])
