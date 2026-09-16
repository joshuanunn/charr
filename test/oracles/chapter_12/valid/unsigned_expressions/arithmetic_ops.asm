(Asm.Program
   [Asm.Function {name = "addition"; global = true;
      instructions =
      [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 16L);
         dst = (Asm.Reg Asm.SP)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Data "ui_a");
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -4)};
        Asm.Binary {op = Asm.Add; typ = Asm.Longword;
          src = (Asm.Imm -2147483643L); dst = (Asm.Stack -4)};
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm -2147483633L);
          dst = (Asm.Stack -4)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L); dst = (Asm.Stack -8)};
        (Asm.SetCC (Asm.E, (Asm.Stack -8)));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -8);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret];
      frame =
      Env.lenv {
        namespace = "addition";
        counter = 2;
        offset = -8;
        stack slots = {
          addition.tmp.0 -> -4,
          addition.tmp.1 -> -8,
        }}};
     Asm.Function {name = "subtraction"; global = true;
       instructions =
       [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 16L);
          dst = (Asm.Reg Asm.SP)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Data "ul_a");
           dst = (Asm.Reg Asm.R10)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -8)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Data "ul_b");
           dst = (Asm.Reg Asm.R10)};
         Asm.Binary {op = Asm.Sub; typ = Asm.Quadword;
           src = (Asm.Reg Asm.R10); dst = (Asm.Stack -8)};
         Asm.Cmp {typ = Asm.Quadword; src = (Asm.Imm -1073742824L);
           dst = (Asm.Stack -8)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -12)};
         (Asm.SetCC (Asm.E, (Asm.Stack -12)));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -12);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret];
       frame =
       Env.lenv {
         namespace = "subtraction";
         counter = 2;
         offset = -12;
         stack slots = {
           subtraction.tmp.0 -> -8,
           subtraction.tmp.1 -> -12,
         }}};
     Asm.Function {name = "multiplication"; global = true;
       instructions =
       [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 16L);
          dst = (Asm.Reg Asm.SP)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Data "ui_a");
           dst = (Asm.Reg Asm.R10)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -4)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -4);
           dst = (Asm.Reg Asm.R11)};
         Asm.Binary {op = Asm.Mult; typ = Asm.Longword;
           src = (Asm.Data "ui_b"); dst = (Asm.Reg Asm.R11)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R11);
           dst = (Asm.Stack -4)};
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm -1073741824L);
           dst = (Asm.Stack -4)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -8)};
         (Asm.SetCC (Asm.E, (Asm.Stack -8)));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -8);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret];
       frame =
       Env.lenv {
         namespace = "multiplication";
         counter = 2;
         offset = -8;
         stack slots = {
           multiplication.tmp.0 -> -4,
           multiplication.tmp.1 -> -8,
         }}};
     Asm.Function {name = "division"; global = true;
       instructions =
       [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 16L);
          dst = (Asm.Reg Asm.SP)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Data "ui_a");
           dst = (Asm.Reg Asm.AX)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Reg Asm.DX)};
         Asm.Idiv {typ = Asm.Longword; src = (Asm.Data "ui_b")};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
           dst = (Asm.Stack -4)};
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -4)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -8)};
         (Asm.SetCC (Asm.E, (Asm.Stack -8)));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -8);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret];
       frame =
       Env.lenv {
         namespace = "division";
         counter = 3;
         offset = -8;
         stack slots = {
           division.tmp.0 -> -4,
           division.tmp.2 -> -8,
         }}};
     Asm.Function {name = "division_large_dividend"; global = true;
       instructions =
       [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 16L);
          dst = (Asm.Reg Asm.SP)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Data "ui_a");
           dst = (Asm.Reg Asm.AX)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Reg Asm.DX)};
         Asm.Idiv {typ = Asm.Longword; src = (Asm.Data "ui_b")};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
           dst = (Asm.Stack -4)};
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 2L);
           dst = (Asm.Stack -4)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -8)};
         (Asm.SetCC (Asm.E, (Asm.Stack -8)));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -8);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret];
       frame =
       Env.lenv {
         namespace = "division_large_dividend";
         counter = 3;
         offset = -8;
         stack slots = {
           division_large_dividend.tmp.0 -> -4,
           division_large_dividend.tmp.2 -> -8,
         }}};
     Asm.Function {name = "division_by_literal"; global = true;
       instructions =
       [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 16L);
          dst = (Asm.Reg Asm.SP)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Data "ul_a");
           dst = (Asm.Reg Asm.AX)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Imm 0L);
           dst = (Asm.Reg Asm.DX)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Imm 5L);
           dst = (Asm.Reg Asm.R10)};
         Asm.Idiv {typ = Asm.Quadword; src = (Asm.Reg Asm.R10)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Reg Asm.AX);
           dst = (Asm.Stack -8)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Imm 219902325555L);
           dst = (Asm.Reg Asm.R10)};
         Asm.Cmp {typ = Asm.Quadword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -8)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -12)};
         (Asm.SetCC (Asm.E, (Asm.Stack -12)));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -12);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret];
       frame =
       Env.lenv {
         namespace = "division_by_literal";
         counter = 2;
         offset = -12;
         stack slots = {
           division_by_literal.tmp.0 -> -8,
           division_by_literal.tmp.1 -> -12,
         }}};
     Asm.Function {name = "remaind"; global = true;
       instructions =
       [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 16L);
          dst = (Asm.Reg Asm.SP)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Data "ul_b");
           dst = (Asm.Reg Asm.AX)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Imm 0L);
           dst = (Asm.Reg Asm.DX)};
         Asm.Idiv {typ = Asm.Quadword; src = (Asm.Data "ul_a")};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Reg Asm.DX);
           dst = (Asm.Stack -8)};
         Asm.Cmp {typ = Asm.Quadword; src = (Asm.Imm 5L);
           dst = (Asm.Stack -8)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -12)};
         (Asm.SetCC (Asm.E, (Asm.Stack -12)));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -12);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret];
       frame =
       Env.lenv {
         namespace = "remaind";
         counter = 2;
         offset = -12;
         stack slots = {
           remaind.tmp.0 -> -8,
           remaind.tmp.1 -> -12,
         }}};
     Asm.Function {name = "complement"; global = true;
       instructions =
       [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 16L);
          dst = (Asm.Reg Asm.SP)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Data "ui_a");
           dst = (Asm.Reg Asm.R10)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -4)};
         Asm.Unary {op = Asm.BwNot; typ = Asm.Longword; dst = (Asm.Stack -4)};
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -4)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -8)};
         (Asm.SetCC (Asm.E, (Asm.Stack -8)));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -8);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret];
       frame =
       Env.lenv {
         namespace = "complement";
         counter = 3;
         offset = -8;
         stack slots = {
           complement.tmp.0 -> -4,
           complement.tmp.2 -> -8,
         }}};
     Asm.Function {name = "main"; global = true;
       instructions =
       [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 64L);
          dst = (Asm.Reg Asm.SP)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 10L);
           dst = (Asm.Data "ui_a")};
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
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Imm -1073741824L);
           dst = (Asm.Data "ul_a")};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Imm 1000L);
           dst = (Asm.Data "ul_b")};
         (Asm.Call "subtraction");
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
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1073741824L);
           dst = (Asm.Data "ui_a")};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 3L);
           dst = (Asm.Data "ui_b")};
         (Asm.Call "multiplication");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
           dst = (Asm.Stack -20)};
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -20)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -24)};
         (Asm.SetCC (Asm.E, (Asm.Stack -24)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -24)};
         (Asm.JmpCC (Asm.E, "main.if.en.8"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 3L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret; (Asm.Label "main.if.en.8");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 100L);
           dst = (Asm.Data "ui_a")};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm -2L);
           dst = (Asm.Data "ui_b")};
         (Asm.Call "division");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
           dst = (Asm.Stack -28)};
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -28)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -32)};
         (Asm.SetCC (Asm.E, (Asm.Stack -32)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -32)};
         (Asm.JmpCC (Asm.E, "main.if.en.11"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 4L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret; (Asm.Label "main.if.en.11");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm -2L);
           dst = (Asm.Data "ui_a")};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 2147483647L);
           dst = (Asm.Data "ui_b")};
         (Asm.Call "division_large_dividend");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
           dst = (Asm.Stack -36)};
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -36)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -40)};
         (Asm.SetCC (Asm.E, (Asm.Stack -40)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -40)};
         (Asm.JmpCC (Asm.E, "main.if.en.14"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 5L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret; (Asm.Label "main.if.en.14");
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Imm 1099511627775L);
           dst = (Asm.Reg Asm.R10)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Data "ul_a")};
         (Asm.Call "division_by_literal");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
           dst = (Asm.Stack -44)};
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -44)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -48)};
         (Asm.SetCC (Asm.E, (Asm.Stack -48)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -48)};
         (Asm.JmpCC (Asm.E, "main.if.en.17"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 6L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret; (Asm.Label "main.if.en.17");
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Imm 100L);
           dst = (Asm.Data "ul_a")};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Imm -11L);
           dst = (Asm.Data "ul_b")};
         (Asm.Call "remaind");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
           dst = (Asm.Stack -52)};
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -52)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -56)};
         (Asm.SetCC (Asm.E, (Asm.Stack -56)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -56)};
         (Asm.JmpCC (Asm.E, "main.if.en.20"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 7L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret; (Asm.Label "main.if.en.20");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm -1L);
           dst = (Asm.Data "ui_a")};
         (Asm.Call "complement");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
           dst = (Asm.Stack -60)};
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -60)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -64)};
         (Asm.SetCC (Asm.E, (Asm.Stack -64)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -64)};
         (Asm.JmpCC (Asm.E, "main.if.en.23"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 8L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret; (Asm.Label "main.if.en.23");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret];
       frame =
       Env.lenv {
         namespace = "main";
         counter = 24;
         offset = -64;
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
         }}};
     Asm.StaticVariable {name = "ui_b"; global = true; alignment = 4;
       init = (Ctype.UIntInit 0l)};
     Asm.StaticVariable {name = "ui_a"; global = true; alignment = 4;
       init = (Ctype.UIntInit 0l)};
     Asm.StaticVariable {name = "ul_b"; global = true; alignment = 8;
       init = (Ctype.ULongInit 0L)};
     Asm.StaticVariable {name = "ul_a"; global = true; alignment = 8;
       init = (Ctype.ULongInit 0L)}
     ])
