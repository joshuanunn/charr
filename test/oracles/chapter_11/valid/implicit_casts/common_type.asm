(Asm.Program
   [Asm.Function {name = "addition"; global = true;
      instructions =
      [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 32L);
         dst = (Asm.Reg Asm.SP)};
        Asm.Movsx {src = (Asm.Data "i"); dst = (Asm.Reg Asm.R11)};
        Asm.Mov {typ = Asm.Quadword; src = (Asm.Reg Asm.R11);
          dst = (Asm.Stack -8)};
        Asm.Mov {typ = Asm.Quadword; src = (Asm.Stack -8);
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Quadword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -16)};
        Asm.Mov {typ = Asm.Quadword; src = (Asm.Data "l");
          dst = (Asm.Reg Asm.R10)};
        Asm.Binary {op = Asm.Add; typ = Asm.Quadword;
          src = (Asm.Reg Asm.R10); dst = (Asm.Stack -16)};
        Asm.Mov {typ = Asm.Quadword; src = (Asm.Imm 2147483663L);
          dst = (Asm.Reg Asm.R10)};
        Asm.Cmp {typ = Asm.Quadword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -16)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -20)};
        (Asm.SetCC (Asm.E, (Asm.Stack -20)));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -20);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret];
      frame =
      Env.lenv {
        namespace = "addition";
        counter = 3;
        offset = -20;
        stack slots = {
          addition.tmp.0 -> -8,
          addition.tmp.1 -> -16,
          addition.tmp.2 -> -20,
        }}};
     Asm.Function {name = "division"; global = true;
       instructions =
       [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 32L);
          dst = (Asm.Reg Asm.SP)};
         Asm.Movsx {src = (Asm.Data "i"); dst = (Asm.Reg Asm.R11)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Reg Asm.R11);
           dst = (Asm.Stack -8)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Data "l");
           dst = (Asm.Reg Asm.AX)};
         (Asm.Cdq Asm.Quadword);
         Asm.Idiv {typ = Asm.Quadword; src = (Asm.Stack -8)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Reg Asm.AX);
           dst = (Asm.Stack -16)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -16);
           dst = (Asm.Reg Asm.R10)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -20)};
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 214748364L);
           dst = (Asm.Stack -20)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -24)};
         (Asm.SetCC (Asm.E, (Asm.Stack -24)));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -24);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret];
       frame =
       Env.lenv {
         namespace = "division";
         counter = 4;
         offset = -24;
         stack slots = {
           division.tmp.0 -> -8,
           division.tmp.1 -> -16,
           division.tmp.2 -> -20,
           division.tmp.3 -> -24,
         }}};
     Asm.Function {name = "comparison"; global = true;
       instructions =
       [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 16L);
          dst = (Asm.Reg Asm.SP)};
         Asm.Movsx {src = (Asm.Data "i"); dst = (Asm.Reg Asm.R11)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Reg Asm.R11);
           dst = (Asm.Stack -8)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Data "l");
           dst = (Asm.Reg Asm.R10)};
         Asm.Cmp {typ = Asm.Quadword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -8)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -12)};
         (Asm.SetCC (Asm.LE, (Asm.Stack -12)));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -12);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret];
       frame =
       Env.lenv {
         namespace = "comparison";
         counter = 2;
         offset = -12;
         stack slots = {
           comparison.tmp.0 -> -8,
           comparison.tmp.1 -> -12,
         }}};
     Asm.Function {name = "conditional"; global = true;
       instructions =
       [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 16L);
          dst = (Asm.Reg Asm.SP)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Imm 8589934592L);
           dst = (Asm.Reg Asm.R10)};
         Asm.Cmp {typ = Asm.Quadword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Data "l")};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -4)};
         (Asm.SetCC (Asm.E, (Asm.Stack -4)));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -4);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret];
       frame =
       Env.lenv {
         namespace = "conditional";
         counter = 5;
         offset = -4;
         stack slots = {
           conditional.tmp.4 -> -4,
         }}};
     Asm.Function {name = "main"; global = true;
       instructions =
       [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 32L);
          dst = (Asm.Reg Asm.SP)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Imm 2147483653L);
           dst = (Asm.Reg Asm.R10)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Data "l")};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 10L);
           dst = (Asm.Data "i")};
         (Asm.Call "addition");
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
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Imm 2147483649L);
           dst = (Asm.Reg Asm.R10)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Data "l")};
         (Asm.Call "division");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
           dst = (Asm.Stack -12)};
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -12)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -16)};
         (Asm.SetCC (Asm.E, (Asm.Stack -16)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -16)};
         (Asm.JmpCC (Asm.E, "main.if.en.5"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 2L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret; (Asm.Label "main.if.en.5");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm -100L);
           dst = (Asm.Data "i")};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Imm 2147483648L);
           dst = (Asm.Reg Asm.R10)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Data "l")};
         (Asm.Call "comparison");
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
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Imm 8589934592L);
           dst = (Asm.Reg Asm.R10)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Data "l")};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 10L);
           dst = (Asm.Data "i")};
         (Asm.Call "conditional");
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
         counter = 13;
         offset = -32;
         stack slots = {
           main.tmp.0  -> -4,
           main.tmp.1  -> -8,
           main.tmp.3  -> -12,
           main.tmp.4  -> -16,
           main.tmp.7  -> -20,
           main.tmp.8  -> -24,
           main.tmp.10 -> -28,
           main.tmp.11 -> -32,
         }}};
     Asm.StaticVariable {name = "i"; global = true; alignment = 4;
       init = (Ctype.IntInit 0l)};
     Asm.StaticVariable {name = "l"; global = true; alignment = 8;
       init = (Ctype.LongInit 0L)}
     ])
