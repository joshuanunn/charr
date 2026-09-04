(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 144L);
         dst = (Asm.Reg Asm.SP)};
        Asm.Mov {typ = Asm.Quadword; src = (Asm.Data "glob");
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Quadword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -8)};
        Asm.Mov {typ = Asm.Quadword; src = (Asm.Imm 4294967307L);
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Quadword; src = (Asm.Stack -8);
          dst = (Asm.Reg Asm.R11)};
        Asm.Binary {op = Asm.Mult; typ = Asm.Quadword;
          src = (Asm.Reg Asm.R10); dst = (Asm.Reg Asm.R11)};
        Asm.Mov {typ = Asm.Quadword; src = (Asm.Reg Asm.R11);
          dst = (Asm.Stack -8)};
        Asm.Mov {typ = Asm.Quadword; src = (Asm.Data "glob");
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Quadword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -16)};
        Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 4L);
          dst = (Asm.Stack -16)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -16);
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -20)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -20);
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -24)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -20);
          dst = (Asm.Reg Asm.R10)};
        Asm.Binary {op = Asm.Add; typ = Asm.Longword;
          src = (Asm.Reg Asm.R10); dst = (Asm.Stack -24)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 2L);
          dst = (Asm.Stack -28)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -20);
          dst = (Asm.Reg Asm.R10)};
        Asm.Binary {op = Asm.Add; typ = Asm.Longword;
          src = (Asm.Reg Asm.R10); dst = (Asm.Stack -28)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -24);
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -32)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -32);
          dst = (Asm.Reg Asm.R11)};
        Asm.Binary {op = Asm.Mult; typ = Asm.Longword; src = (Asm.Stack -24);
          dst = (Asm.Reg Asm.R11)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R11);
          dst = (Asm.Stack -32)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 6L);
          dst = (Asm.Stack -36)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -20);
          dst = (Asm.Reg Asm.R10)};
        Asm.Binary {op = Asm.Sub; typ = Asm.Longword;
          src = (Asm.Reg Asm.R10); dst = (Asm.Stack -36)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -24);
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -40)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -40);
          dst = (Asm.Reg Asm.R11)};
        Asm.Binary {op = Asm.Mult; typ = Asm.Longword; src = (Asm.Stack -28);
          dst = (Asm.Reg Asm.R11)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R11);
          dst = (Asm.Stack -40)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -20);
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -44)};
        Asm.Binary {op = Asm.Add; typ = Asm.Longword; src = (Asm.Imm 6L);
          dst = (Asm.Stack -44)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -24);
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -48)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -48);
          dst = (Asm.Reg Asm.R11)};
        Asm.Binary {op = Asm.Mult; typ = Asm.Longword; src = (Asm.Imm 4L);
          dst = (Asm.Reg Asm.R11)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R11);
          dst = (Asm.Stack -48)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -28);
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -52)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -52);
          dst = (Asm.Reg Asm.R11)};
        Asm.Binary {op = Asm.Mult; typ = Asm.Longword; src = (Asm.Stack -28);
          dst = (Asm.Reg Asm.R11)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R11);
          dst = (Asm.Stack -52)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -32);
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -56)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -40);
          dst = (Asm.Reg Asm.R10)};
        Asm.Binary {op = Asm.Add; typ = Asm.Longword;
          src = (Asm.Reg Asm.R10); dst = (Asm.Stack -56)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 16L);
          dst = (Asm.Stack -60)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -36);
          dst = (Asm.Reg Asm.R10)};
        Asm.Binary {op = Asm.Sub; typ = Asm.Longword;
          src = (Asm.Reg Asm.R10); dst = (Asm.Stack -60)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -40);
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -64)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -40);
          dst = (Asm.Reg Asm.R10)};
        Asm.Binary {op = Asm.Add; typ = Asm.Longword;
          src = (Asm.Reg Asm.R10); dst = (Asm.Stack -64)};
        Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 8L);
          dst = (Asm.Reg Asm.SP)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -20);
          dst = (Asm.Reg Asm.DI)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -24);
          dst = (Asm.Reg Asm.SI)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -28);
          dst = (Asm.Reg Asm.DX)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -32);
          dst = (Asm.Reg Asm.CX)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -36);
          dst = (Asm.Reg Asm.R8)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -40);
          dst = (Asm.Reg Asm.R9)};
        (Asm.Push (Asm.Imm 1L));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -64);
          dst = (Asm.Reg Asm.AX)};
        (Asm.Push (Asm.Reg Asm.AX));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -60);
          dst = (Asm.Reg Asm.AX)};
        (Asm.Push (Asm.Reg Asm.AX));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -56);
          dst = (Asm.Reg Asm.AX)};
        (Asm.Push (Asm.Reg Asm.AX));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -52);
          dst = (Asm.Reg Asm.AX)};
        (Asm.Push (Asm.Reg Asm.AX));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -48);
          dst = (Asm.Reg Asm.AX)};
        (Asm.Push (Asm.Reg Asm.AX));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -44);
          dst = (Asm.Reg Asm.AX)};
        (Asm.Push (Asm.Reg Asm.AX)); (Asm.Call "check_12_ints");
        Asm.Binary {op = Asm.Add; typ = Asm.Quadword; src = (Asm.Imm 64L);
          dst = (Asm.Reg Asm.SP)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
          dst = (Asm.Stack -68)};
        Asm.Mov {typ = Asm.Quadword; src = (Asm.Data "glob");
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Quadword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -80)};
        Asm.Binary {op = Asm.Add; typ = Asm.Quadword; src = (Asm.Imm 8L);
          dst = (Asm.Stack -80)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -80);
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -84)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -84);
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -88)};
        Asm.Binary {op = Asm.Add; typ = Asm.Longword; src = (Asm.Imm 1L);
          dst = (Asm.Stack -88)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 28L);
          dst = (Asm.Stack -92)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -84);
          dst = (Asm.Reg Asm.R10)};
        Asm.Binary {op = Asm.Sub; typ = Asm.Longword;
          src = (Asm.Reg Asm.R10); dst = (Asm.Stack -92)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -88);
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -96)};
        Asm.Binary {op = Asm.Add; typ = Asm.Longword; src = (Asm.Imm 2L);
          dst = (Asm.Stack -96)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 4L);
          dst = (Asm.Stack -100)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -84);
          dst = (Asm.Reg Asm.R10)};
        Asm.Binary {op = Asm.Add; typ = Asm.Longword;
          src = (Asm.Reg Asm.R10); dst = (Asm.Stack -100)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 32L);
          dst = (Asm.Stack -104)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -88);
          dst = (Asm.Reg Asm.R10)};
        Asm.Binary {op = Asm.Sub; typ = Asm.Longword;
          src = (Asm.Reg Asm.R10); dst = (Asm.Stack -104)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 35L);
          dst = (Asm.Stack -108)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -96);
          dst = (Asm.Reg Asm.R10)};
        Asm.Binary {op = Asm.Sub; typ = Asm.Longword;
          src = (Asm.Reg Asm.R10); dst = (Asm.Stack -108)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -92);
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -112)};
        Asm.Binary {op = Asm.Add; typ = Asm.Longword; src = (Asm.Imm 5L);
          dst = (Asm.Stack -112)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -84);
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -116)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -116);
          dst = (Asm.Reg Asm.R11)};
        Asm.Binary {op = Asm.Mult; typ = Asm.Longword; src = (Asm.Imm 2L);
          dst = (Asm.Reg Asm.R11)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R11);
          dst = (Asm.Stack -116)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -116);
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -120)};
        Asm.Binary {op = Asm.Sub; typ = Asm.Longword; src = (Asm.Imm 5L);
          dst = (Asm.Stack -120)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -92);
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -124)};
        Asm.Binary {op = Asm.Add; typ = Asm.Longword; src = (Asm.Imm 7L);
          dst = (Asm.Stack -124)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 6L);
          dst = (Asm.Stack -128)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -100);
          dst = (Asm.Reg Asm.R10)};
        Asm.Binary {op = Asm.Add; typ = Asm.Longword;
          src = (Asm.Reg Asm.R10); dst = (Asm.Stack -128)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -84);
          dst = (Asm.Reg Asm.R10)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -132)};
        Asm.Binary {op = Asm.Add; typ = Asm.Longword; src = (Asm.Imm 11L);
          dst = (Asm.Stack -132)};
        Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 8L);
          dst = (Asm.Reg Asm.SP)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -84);
          dst = (Asm.Reg Asm.DI)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -88);
          dst = (Asm.Reg Asm.SI)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -92);
          dst = (Asm.Reg Asm.DX)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -96);
          dst = (Asm.Reg Asm.CX)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -100);
          dst = (Asm.Reg Asm.R8)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -104);
          dst = (Asm.Reg Asm.R9)};
        (Asm.Push (Asm.Imm 13L));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -132);
          dst = (Asm.Reg Asm.AX)};
        (Asm.Push (Asm.Reg Asm.AX));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -128);
          dst = (Asm.Reg Asm.AX)};
        (Asm.Push (Asm.Reg Asm.AX));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -124);
          dst = (Asm.Reg Asm.AX)};
        (Asm.Push (Asm.Reg Asm.AX));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -120);
          dst = (Asm.Reg Asm.AX)};
        (Asm.Push (Asm.Reg Asm.AX));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -112);
          dst = (Asm.Reg Asm.AX)};
        (Asm.Push (Asm.Reg Asm.AX));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -108);
          dst = (Asm.Reg Asm.AX)};
        (Asm.Push (Asm.Reg Asm.AX)); (Asm.Call "check_12_ints");
        Asm.Binary {op = Asm.Add; typ = Asm.Quadword; src = (Asm.Imm 64L);
          dst = (Asm.Reg Asm.SP)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.AX);
          dst = (Asm.Stack -136)};
        Asm.Mov {typ = Asm.Quadword; src = (Asm.Imm 21474836535L);
          dst = (Asm.Reg Asm.R10)};
        Asm.Cmp {typ = Asm.Quadword; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -8)};
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -140)};
        (Asm.SetCC (Asm.NE, (Asm.Stack -140)));
        Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Stack -140)};
        (Asm.JmpCC (Asm.E, "main.if.en.33"));
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm -1L);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret; (Asm.Label "main.if.en.33");
        Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
          dst = (Asm.Reg Asm.AX)};
        Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 35;
        offset = -140;
        stack slots = {
          main.tmp.0  -> -8,
          main.tmp.2  -> -16,
          main.tmp.3  -> -20,
          main.tmp.4  -> -24,
          main.tmp.5  -> -28,
          main.tmp.6  -> -32,
          main.tmp.7  -> -36,
          main.tmp.8  -> -40,
          main.tmp.9  -> -44,
          main.tmp.10 -> -48,
          main.tmp.11 -> -52,
          main.tmp.12 -> -56,
          main.tmp.13 -> -60,
          main.tmp.14 -> -64,
          main.tmp.15 -> -68,
          main.tmp.17 -> -80,
          main.tmp.18 -> -84,
          main.tmp.19 -> -88,
          main.tmp.20 -> -92,
          main.tmp.21 -> -96,
          main.tmp.22 -> -100,
          main.tmp.23 -> -104,
          main.tmp.24 -> -108,
          main.tmp.25 -> -112,
          main.tmp.26 -> -116,
          main.tmp.27 -> -120,
          main.tmp.28 -> -124,
          main.tmp.29 -> -128,
          main.tmp.30 -> -132,
          main.tmp.31 -> -136,
          main.tmp.32 -> -140,
        }}};
     Asm.Function {name = "check_12_ints"; global = true;
       instructions =
       [Asm.Binary {op = Asm.Sub; typ = Asm.Quadword; src = (Asm.Imm 160L);
          dst = (Asm.Reg Asm.SP)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.DI);
           dst = (Asm.Stack -4)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.SI);
           dst = (Asm.Stack -8)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.DX);
           dst = (Asm.Stack -12)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.CX);
           dst = (Asm.Stack -16)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R8);
           dst = (Asm.Stack -20)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R9);
           dst = (Asm.Stack -24)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack 16);
           dst = (Asm.Reg Asm.R10)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -28)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack 24);
           dst = (Asm.Reg Asm.R10)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -32)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack 32);
           dst = (Asm.Reg Asm.R10)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -36)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack 40);
           dst = (Asm.Reg Asm.R10)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -40)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack 48);
           dst = (Asm.Reg Asm.R10)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -44)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack 56);
           dst = (Asm.Reg Asm.R10)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -48)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack 64);
           dst = (Asm.Reg Asm.R10)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -52)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -52);
           dst = (Asm.Reg Asm.R10)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -56)};
         Asm.Binary {op = Asm.Add; typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -56)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -56);
           dst = (Asm.Reg Asm.R10)};
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -4)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -60)};
         (Asm.SetCC (Asm.NE, (Asm.Stack -60)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -60)};
         (Asm.JmpCC (Asm.E, "check_12_ints.if.en.2"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -56);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret; (Asm.Label "check_12_ints.if.en.2");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -52);
           dst = (Asm.Reg Asm.R10)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -64)};
         Asm.Binary {op = Asm.Add; typ = Asm.Longword; src = (Asm.Imm 1L);
           dst = (Asm.Stack -64)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -64);
           dst = (Asm.Reg Asm.R10)};
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -8)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -68)};
         (Asm.SetCC (Asm.NE, (Asm.Stack -68)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -68)};
         (Asm.JmpCC (Asm.E, "check_12_ints.if.en.5"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -64);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret; (Asm.Label "check_12_ints.if.en.5");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -52);
           dst = (Asm.Reg Asm.R10)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -72)};
         Asm.Binary {op = Asm.Add; typ = Asm.Longword; src = (Asm.Imm 2L);
           dst = (Asm.Stack -72)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -72);
           dst = (Asm.Reg Asm.R10)};
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -12)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -76)};
         (Asm.SetCC (Asm.NE, (Asm.Stack -76)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -76)};
         (Asm.JmpCC (Asm.E, "check_12_ints.if.en.8"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -72);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret; (Asm.Label "check_12_ints.if.en.8");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -52);
           dst = (Asm.Reg Asm.R10)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -80)};
         Asm.Binary {op = Asm.Add; typ = Asm.Longword; src = (Asm.Imm 3L);
           dst = (Asm.Stack -80)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -80);
           dst = (Asm.Reg Asm.R10)};
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -16)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -84)};
         (Asm.SetCC (Asm.NE, (Asm.Stack -84)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -84)};
         (Asm.JmpCC (Asm.E, "check_12_ints.if.en.11"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -80);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret; (Asm.Label "check_12_ints.if.en.11");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -52);
           dst = (Asm.Reg Asm.R10)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -88)};
         Asm.Binary {op = Asm.Add; typ = Asm.Longword; src = (Asm.Imm 4L);
           dst = (Asm.Stack -88)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -88);
           dst = (Asm.Reg Asm.R10)};
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -20)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -92)};
         (Asm.SetCC (Asm.NE, (Asm.Stack -92)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -92)};
         (Asm.JmpCC (Asm.E, "check_12_ints.if.en.14"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -88);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret; (Asm.Label "check_12_ints.if.en.14");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -52);
           dst = (Asm.Reg Asm.R10)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -96)};
         Asm.Binary {op = Asm.Add; typ = Asm.Longword; src = (Asm.Imm 5L);
           dst = (Asm.Stack -96)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -96);
           dst = (Asm.Reg Asm.R10)};
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -24)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -100)};
         (Asm.SetCC (Asm.NE, (Asm.Stack -100)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -100)};
         (Asm.JmpCC (Asm.E, "check_12_ints.if.en.17"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -96);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret; (Asm.Label "check_12_ints.if.en.17");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -52);
           dst = (Asm.Reg Asm.R10)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -104)};
         Asm.Binary {op = Asm.Add; typ = Asm.Longword; src = (Asm.Imm 6L);
           dst = (Asm.Stack -104)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -104);
           dst = (Asm.Reg Asm.R10)};
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -28)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -108)};
         (Asm.SetCC (Asm.NE, (Asm.Stack -108)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -108)};
         (Asm.JmpCC (Asm.E, "check_12_ints.if.en.20"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -104);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret; (Asm.Label "check_12_ints.if.en.20");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -52);
           dst = (Asm.Reg Asm.R10)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -112)};
         Asm.Binary {op = Asm.Add; typ = Asm.Longword; src = (Asm.Imm 7L);
           dst = (Asm.Stack -112)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -112);
           dst = (Asm.Reg Asm.R10)};
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -32)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -116)};
         (Asm.SetCC (Asm.NE, (Asm.Stack -116)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -116)};
         (Asm.JmpCC (Asm.E, "check_12_ints.if.en.23"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -112);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret; (Asm.Label "check_12_ints.if.en.23");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -52);
           dst = (Asm.Reg Asm.R10)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -120)};
         Asm.Binary {op = Asm.Add; typ = Asm.Longword; src = (Asm.Imm 8L);
           dst = (Asm.Stack -120)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -120);
           dst = (Asm.Reg Asm.R10)};
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -36)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -124)};
         (Asm.SetCC (Asm.NE, (Asm.Stack -124)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -124)};
         (Asm.JmpCC (Asm.E, "check_12_ints.if.en.26"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -120);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret; (Asm.Label "check_12_ints.if.en.26");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -52);
           dst = (Asm.Reg Asm.R10)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -128)};
         Asm.Binary {op = Asm.Add; typ = Asm.Longword; src = (Asm.Imm 9L);
           dst = (Asm.Stack -128)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -128);
           dst = (Asm.Reg Asm.R10)};
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -40)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -132)};
         (Asm.SetCC (Asm.NE, (Asm.Stack -132)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -132)};
         (Asm.JmpCC (Asm.E, "check_12_ints.if.en.29"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -128);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret; (Asm.Label "check_12_ints.if.en.29");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -52);
           dst = (Asm.Reg Asm.R10)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -136)};
         Asm.Binary {op = Asm.Add; typ = Asm.Longword; src = (Asm.Imm 10L);
           dst = (Asm.Stack -136)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -136);
           dst = (Asm.Reg Asm.R10)};
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -44)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -140)};
         (Asm.SetCC (Asm.NE, (Asm.Stack -140)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -140)};
         (Asm.JmpCC (Asm.E, "check_12_ints.if.en.32"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -136);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret; (Asm.Label "check_12_ints.if.en.32");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -52);
           dst = (Asm.Reg Asm.R10)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -144)};
         Asm.Binary {op = Asm.Add; typ = Asm.Longword; src = (Asm.Imm 11L);
           dst = (Asm.Stack -144)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -144);
           dst = (Asm.Reg Asm.R10)};
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -48)};
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -148)};
         (Asm.SetCC (Asm.NE, (Asm.Stack -148)));
         Asm.Cmp {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Stack -148)};
         (Asm.JmpCC (Asm.E, "check_12_ints.if.en.35"));
         Asm.Mov {typ = Asm.Longword; src = (Asm.Stack -144);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret; (Asm.Label "check_12_ints.if.en.35");
         Asm.Mov {typ = Asm.Longword; src = (Asm.Imm 0L);
           dst = (Asm.Reg Asm.AX)};
         Asm.Ret];
       frame =
       Env.lenv {
         namespace = "check_12_ints";
         counter = 36;
         offset = -148;
         stack slots = {
           a.38                 -> -4,
           b.39                 -> -8,
           c.40                 -> -12,
           d.41                 -> -16,
           e.42                 -> -20,
           f.43                 -> -24,
           g.44                 -> -28,
           h.45                 -> -32,
           i.46                 -> -36,
           j.47                 -> -40,
           k.48                 -> -44,
           l.49                 -> -48,
           start.50             -> -52,
           check_12_ints.tmp.0  -> -56,
           check_12_ints.tmp.1  -> -60,
           check_12_ints.tmp.3  -> -64,
           check_12_ints.tmp.4  -> -68,
           check_12_ints.tmp.6  -> -72,
           check_12_ints.tmp.7  -> -76,
           check_12_ints.tmp.9  -> -80,
           check_12_ints.tmp.10 -> -84,
           check_12_ints.tmp.12 -> -88,
           check_12_ints.tmp.13 -> -92,
           check_12_ints.tmp.15 -> -96,
           check_12_ints.tmp.16 -> -100,
           check_12_ints.tmp.18 -> -104,
           check_12_ints.tmp.19 -> -108,
           check_12_ints.tmp.21 -> -112,
           check_12_ints.tmp.22 -> -116,
           check_12_ints.tmp.24 -> -120,
           check_12_ints.tmp.25 -> -124,
           check_12_ints.tmp.27 -> -128,
           check_12_ints.tmp.28 -> -132,
           check_12_ints.tmp.30 -> -136,
           check_12_ints.tmp.31 -> -140,
           check_12_ints.tmp.33 -> -144,
           check_12_ints.tmp.34 -> -148,
         }}};
     Asm.StaticVariable {name = "glob"; global = true; alignment = 8;
       init = (Ctype.LongInit 5L)}
     ])
