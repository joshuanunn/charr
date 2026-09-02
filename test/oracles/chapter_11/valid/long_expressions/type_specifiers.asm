(Asm.Program
   [Asm.Function {name = "my_function"; global = true;
      instructions =
      [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 48L);
         dst = (Asm.Reg Asm.SP)};
        Asm.Mov {typ = Asm.Quadword; src = (Asm.Reg Asm.DI);
          dst = (Asm.Stack -8)};
        Asm.Mov {typ = Asm.Quadword; src = (Asm.Reg Asm.SI);
          dst = (Asm.Stack -16)};
        Asm.Mov {typ = Asm.Quadword; src = (Asm.Reg Asm.DX);
          dst = (Asm.Stack -24)};
        Asm.Mov {typ = Asm.Quadword; src = (Asm.Stack -8);
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Quadword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -32)};
        Asm.Mov {typ = Asm.Quadword; src = (Asm.Stack -16);
          dst = (Asm.Reg Asm.R10)};
        Asm.Binary {op = Asm.Add; typ = Asm.Quadword;
          src = (Asm.Reg Asm.R10); dst = (Asm.Stack -32)};
        Asm.Mov {typ = Asm.Quadword; src = (Asm.Stack -32);
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Quadword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -40)};
        Asm.Mov {typ = Asm.Quadword; src = (Asm.Stack -24);
          dst = (Asm.Reg Asm.R10)};
        Asm.Binary {op = Asm.Add; typ = Asm.Quadword;
          src = (Asm.Reg Asm.R10); dst = (Asm.Stack -40)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -40);
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -44)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -44);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret];
      frame =
      Env.lenv {
        namespace = "my_function";
        counter = 3;
        offset = -44;
        stack slots = {
          x.3   -> -8,
          y.4   -> -16,
          z.5   -> -24,
          tmp.0 -> -32,
          tmp.1 -> -40,
          tmp.2 -> -44,
        }}};
     Asm.Function {name = "main"; global = true;
       instructions =
       [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 96L);
          dst = (Asm.Reg Asm.SP)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Imm 4L);
           dst = (Asm.Data "a")};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -4)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Imm 1099511627776L);
           dst = (Asm.Reg Asm.R10)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -16)};
         (Asm.Label "loop.st.1");
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -24)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Stack -24);
           dst = (Asm.Reg Asm.R10)};
         Asm.Cmp {typ = Asm.Quadword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -16)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -28)};
         (Asm.SetCC (Asm.G, (Asm.Stack -28)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -28)};
         (Asm.JmpCC (Asm.E, "loop.br.1"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -4);
           dst = (Asm.Reg Asm.R10)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -32)};
         Asm.Binary {op = Asm.Add; typ = Asm.Longword; src = (Asm.Imm 1L);
           dst = (Asm.Stack -32)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -32);
           dst = (Asm.Reg Asm.R10)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -4)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Imm 2L);
           dst = (Asm.Stack -40)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Stack -16);
           dst = (Asm.Reg Asm.AX)};
         (Asm.Cdq Asm.Quadword);
         Asm.Idiv {typ = Asm.Quadword; src = (Asm.Stack -40)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Reg Asm.AX);
           dst = (Asm.Stack -48)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Stack -48);
           dst = (Asm.Reg Asm.R10)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -16)};
         (Asm.Jmp "loop.st.1"); (Asm.Label "loop.br.1");
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Imm 1L);
           dst = (Asm.Stack -56)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Imm 1L);
           dst = (Asm.Reg Asm.R11)};
         Asm.Cmp {typ = Asm.Quadword; src = (Asm.Stack -56);
           dst = (Asm.Reg Asm.R11)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -60)};
         (Asm.SetCC (Asm.NE, (Asm.Stack -60)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -60)};
         (Asm.JmpCC (Asm.E, "main.if.en.8"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret; (Asm.Label "main.if.en.8");
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Imm 2L);
           dst = (Asm.Stack -72)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Imm 2L);
           dst = (Asm.Reg Asm.R11)};
         Asm.Cmp {typ = Asm.Quadword; src = (Asm.Stack -72);
           dst = (Asm.Reg Asm.R11)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -76)};
         (Asm.SetCC (Asm.NE, (Asm.Stack -76)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -76)};
         (Asm.JmpCC (Asm.E, "main.if.en.11"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 2L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret; (Asm.Label "main.if.en.11");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -80)};
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -80)};
         (Asm.JmpCC (Asm.E, "main.if.en.14"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 3L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret; (Asm.Label "main.if.en.14");
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Imm 1L);
           dst = (Asm.Reg Asm.DI)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Imm 2L);
           dst = (Asm.Reg Asm.SI)};
         Asm.Mov {typ = Asm.Quadword; src = (Asm.Imm 3L);
           dst = (Asm.Reg Asm.DX)};
         (Asm.Call "my_function");
         Asm.Binary {op = Asm.Add; typ = Asm.Quadword; src = (Asm.Imm 0L);
           dst = (Asm.Reg Asm.SP)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
           dst = (Asm.Stack -84)};
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 6L);
           dst = (Asm.Stack -84)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -88)};
         (Asm.SetCC (Asm.NE, (Asm.Stack -88)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -88)};
         (Asm.JmpCC (Asm.E, "main.if.en.17"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 4L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret; (Asm.Label "main.if.en.17");
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 41L);
           dst = (Asm.Stack -4)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -92)};
         (Asm.SetCC (Asm.NE, (Asm.Stack -92)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -92)};
         (Asm.JmpCC (Asm.E, "main.if.en.19"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 5L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret; (Asm.Label "main.if.en.19");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret];
       frame =
       Env.lenv {
         namespace = "main";
         counter = 20;
         offset = -92;
         stack slots = {
           sum.9  -> -4,
           i.10   -> -16,
           tmp.1  -> -24,
           tmp.2  -> -28,
           tmp.3  -> -32,
           tmp.4  -> -40,
           tmp.5  -> -48,
           tmp.6  -> -56,
           tmp.7  -> -60,
           tmp.9  -> -72,
           tmp.10 -> -76,
           tmp.13 -> -80,
           tmp.15 -> -84,
           tmp.16 -> -88,
           tmp.18 -> -92,
         }}};
     Asm.StaticVariable {name = "a"; global = false; alignment = 8;
       init = (Ctype.LongInit 0L)}
     ])
