(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 96L);
         dst = (Asm.Reg Asm.SP)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Data "one_hundred");
          dst = (Asm.Reg Asm.R10)};
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Data "large_uint")};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L); dst = (Asm.Stack -4)};
        (Asm.SetCC (Asm.B, (Asm.Stack -4)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L); dst = (Asm.Stack -4)};
        (Asm.JmpCC (Asm.E, "main.if.en.1"));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 1L);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret; (Asm.Label "main.if.en.1");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Data "one_hundred");
          dst = (Asm.Reg Asm.R10)};
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Data "large_uint")};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L); dst = (Asm.Stack -8)};
        (Asm.SetCC (Asm.BE, (Asm.Stack -8)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L); dst = (Asm.Stack -8)};
        (Asm.JmpCC (Asm.E, "main.if.en.3"));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 2L);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret; (Asm.Label "main.if.en.3");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Data "large_uint");
          dst = (Asm.Reg Asm.R10)};
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Data "one_hundred")};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -12)};
        (Asm.SetCC (Asm.AE, (Asm.Stack -12)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -12)};
        (Asm.JmpCC (Asm.E, "main.if.en.5"));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 3L);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret; (Asm.Label "main.if.en.5");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Data "large_uint");
          dst = (Asm.Reg Asm.R10)};
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Data "one_hundred")};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -16)};
        (Asm.SetCC (Asm.A, (Asm.Stack -16)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -16)};
        (Asm.JmpCC (Asm.E, "main.if.en.7"));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 4L);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret; (Asm.Label "main.if.en.7");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Data "large_uint");
          dst = (Asm.Reg Asm.R10)};
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Data "one_hundred")};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -20)};
        (Asm.SetCC (Asm.BE, (Asm.Stack -20)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -20)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -24)};
        (Asm.SetCC (Asm.E, (Asm.Stack -24)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -24)};
        (Asm.JmpCC (Asm.E, "main.if.en.10"));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 5L);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret; (Asm.Label "main.if.en.10");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Data "large_uint");
          dst = (Asm.Reg Asm.R10)};
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Data "one_hundred")};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -28)};
        (Asm.SetCC (Asm.B, (Asm.Stack -28)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -28)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -32)};
        (Asm.SetCC (Asm.E, (Asm.Stack -32)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -32)};
        (Asm.JmpCC (Asm.E, "main.if.en.13"));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 6L);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret; (Asm.Label "main.if.en.13");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Data "one_hundred");
          dst = (Asm.Reg Asm.R10)};
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Data "large_uint")};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -36)};
        (Asm.SetCC (Asm.A, (Asm.Stack -36)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -36)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -40)};
        (Asm.SetCC (Asm.E, (Asm.Stack -40)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -40)};
        (Asm.JmpCC (Asm.E, "main.if.en.16"));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 7L);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret; (Asm.Label "main.if.en.16");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Data "one_hundred");
          dst = (Asm.Reg Asm.R10)};
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Data "large_uint")};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -44)};
        (Asm.SetCC (Asm.AE, (Asm.Stack -44)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -44)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -48)};
        (Asm.SetCC (Asm.E, (Asm.Stack -48)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -48)};
        (Asm.JmpCC (Asm.E, "main.if.en.19"));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 8L);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret; (Asm.Label "main.if.en.19");
        Asm.Mov {typ = Asm.Quadword; src = (Asm.Data "one_hundred_ulong");
          dst = (Asm.Reg Asm.R10)};
        Asm.Cmp {typ = Asm.Quadword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Data "large_ulong")};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -52)};
        (Asm.SetCC (Asm.B, (Asm.Stack -52)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -52)};
        (Asm.JmpCC (Asm.E, "main.if.en.21"));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 9L);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret; (Asm.Label "main.if.en.21");
        Asm.Mov {typ = Asm.Quadword; src = (Asm.Data "one_hundred_ulong");
          dst = (Asm.Reg Asm.R10)};
        Asm.Cmp {typ = Asm.Quadword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Data "large_ulong")};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -56)};
        (Asm.SetCC (Asm.BE, (Asm.Stack -56)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -56)};
        (Asm.JmpCC (Asm.E, "main.if.en.23"));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 10L);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret; (Asm.Label "main.if.en.23");
        Asm.Mov {typ = Asm.Quadword; src = (Asm.Data "large_ulong");
          dst = (Asm.Reg Asm.R10)};
        Asm.Cmp {typ = Asm.Quadword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Data "one_hundred_ulong")};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -60)};
        (Asm.SetCC (Asm.AE, (Asm.Stack -60)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -60)};
        (Asm.JmpCC (Asm.E, "main.if.en.25"));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 11L);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret; (Asm.Label "main.if.en.25");
        Asm.Mov {typ = Asm.Quadword; src = (Asm.Data "large_ulong");
          dst = (Asm.Reg Asm.R10)};
        Asm.Cmp {typ = Asm.Quadword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Data "one_hundred_ulong")};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -64)};
        (Asm.SetCC (Asm.A, (Asm.Stack -64)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -64)};
        (Asm.JmpCC (Asm.E, "main.if.en.27"));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 12L);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret; (Asm.Label "main.if.en.27");
        Asm.Mov {typ = Asm.Quadword; src = (Asm.Data "large_ulong");
          dst = (Asm.Reg Asm.R10)};
        Asm.Cmp {typ = Asm.Quadword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Data "one_hundred_ulong")};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -68)};
        (Asm.SetCC (Asm.BE, (Asm.Stack -68)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -68)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -72)};
        (Asm.SetCC (Asm.E, (Asm.Stack -72)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -72)};
        (Asm.JmpCC (Asm.E, "main.if.en.30"));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 13L);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret; (Asm.Label "main.if.en.30");
        Asm.Mov {typ = Asm.Quadword; src = (Asm.Data "large_ulong");
          dst = (Asm.Reg Asm.R10)};
        Asm.Cmp {typ = Asm.Quadword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Data "one_hundred_ulong")};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -76)};
        (Asm.SetCC (Asm.B, (Asm.Stack -76)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -76)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -80)};
        (Asm.SetCC (Asm.E, (Asm.Stack -80)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -80)};
        (Asm.JmpCC (Asm.E, "main.if.en.33"));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 14L);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret; (Asm.Label "main.if.en.33");
        Asm.Mov {typ = Asm.Quadword; src = (Asm.Data "one_hundred_ulong");
          dst = (Asm.Reg Asm.R10)};
        Asm.Cmp {typ = Asm.Quadword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Data "large_ulong")};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -84)};
        (Asm.SetCC (Asm.A, (Asm.Stack -84)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -84)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -88)};
        (Asm.SetCC (Asm.E, (Asm.Stack -88)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -88)};
        (Asm.JmpCC (Asm.E, "main.if.en.36"));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 15L);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret; (Asm.Label "main.if.en.36");
        Asm.Mov {typ = Asm.Quadword; src = (Asm.Data "one_hundred_ulong");
          dst = (Asm.Reg Asm.R10)};
        Asm.Cmp {typ = Asm.Quadword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Data "large_ulong")};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -92)};
        (Asm.SetCC (Asm.AE, (Asm.Stack -92)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -92)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -96)};
        (Asm.SetCC (Asm.E, (Asm.Stack -96)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -96)};
        (Asm.JmpCC (Asm.E, "main.if.en.39"));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 16L);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret; (Asm.Label "main.if.en.39");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 40;
        offset = -96;
        stack slots = {
          main.tmp.0  -> -4,
          main.tmp.2  -> -8,
          main.tmp.4  -> -12,
          main.tmp.6  -> -16,
          main.tmp.8  -> -20,
          main.tmp.9  -> -24,
          main.tmp.11 -> -28,
          main.tmp.12 -> -32,
          main.tmp.14 -> -36,
          main.tmp.15 -> -40,
          main.tmp.17 -> -44,
          main.tmp.18 -> -48,
          main.tmp.20 -> -52,
          main.tmp.22 -> -56,
          main.tmp.24 -> -60,
          main.tmp.26 -> -64,
          main.tmp.28 -> -68,
          main.tmp.29 -> -72,
          main.tmp.31 -> -76,
          main.tmp.32 -> -80,
          main.tmp.34 -> -84,
          main.tmp.35 -> -88,
          main.tmp.37 -> -92,
          main.tmp.38 -> -96,
        }}};
     Asm.StaticVariable {name = "one_hundred_ulong"; global = true;
       alignment = 8; init = (Ctype.ULongInit 100L)};
     Asm.StaticVariable {name = "large_ulong"; global = true; alignment = 8;
       init = (Ctype.ULongInit 4294967294L)};
     Asm.StaticVariable {name = "one_hundred"; global = true; alignment = 4;
       init = (Ctype.UIntInit 100l)};
     Asm.StaticVariable {name = "large_uint"; global = true; alignment = 4;
       init = (Ctype.UIntInit -2l)}
     ])
