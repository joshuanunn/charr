(Asm.Program
   [Asm.Function {name = "target"; global = true;
      instructions =
      [(Asm.AllocateStack 64); (Asm.Mov ((Asm.Reg Asm.DI), (Asm.Stack -44)));
        (Asm.Mov ((Asm.Reg Asm.SI), (Asm.Stack -48)));
        (Asm.Mov ((Asm.Reg Asm.DX), (Asm.Stack -52)));
        (Asm.Mov ((Asm.Reg Asm.CX), (Asm.Stack -56)));
        (Asm.Label "loop.ct.1"); (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -44)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.SetCC (Asm.G, (Asm.Stack -4)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.JmpCC (Asm.E, "loop.br.1")); (Asm.Label "loop.ct.2");
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -52)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8)));
        (Asm.SetCC (Asm.G, (Asm.Stack -8)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -8)));
        (Asm.JmpCC (Asm.E, "loop.br.2"));
        (Asm.Mov ((Asm.Stack -52), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -12)));
        (Asm.Mov ((Asm.Stack -56), (Asm.Reg Asm.R10)));
        Asm.Binary {op = Asm.Add; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -12)};
        (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.DI))); (Asm.Call "putchar");
        (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -16)));
        (Asm.Mov ((Asm.Stack -52), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -20)));
        Asm.Binary {op = Asm.Sub; src = (Asm.Imm 1); dst = (Asm.Stack -20)};
        (Asm.Mov ((Asm.Stack -20), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -52)));
        (Asm.Mov ((Asm.Stack -56), (Asm.Reg Asm.AX))); Asm.Cdq;
        (Asm.Mov ((Asm.Imm 2), (Asm.Reg Asm.R10)));
        (Asm.Idiv (Asm.Reg Asm.R10));
        (Asm.Mov ((Asm.Reg Asm.DX), (Asm.Stack -24)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -24)));
        (Asm.JmpCC (Asm.E, "target.if.en.6"));
        (Asm.Mov ((Asm.Stack -20), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -28)));
        Asm.Binary {op = Asm.Sub; src = (Asm.Imm 2); dst = (Asm.Stack -28)};
        (Asm.Mov ((Asm.Stack -28), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -52)));
        (Asm.Label "target.if.en.6"); (Asm.Jmp "loop.ct.2");
        (Asm.Label "loop.br.2"); (Asm.Label "loop.ct.3");
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -48)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -32)));
        (Asm.SetCC (Asm.G, (Asm.Stack -32)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -32)));
        (Asm.JmpCC (Asm.E, "loop.br.3"));
        (Asm.Mov ((Asm.Imm 10), (Asm.Stack -52)));
        (Asm.Mov ((Asm.Stack -48), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -36)));
        Asm.Binary {op = Asm.Sub; src = (Asm.Imm 1); dst = (Asm.Stack -36)};
        (Asm.Mov ((Asm.Stack -36), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -48)));
        (Asm.Jmp "loop.ct.3"); (Asm.Label "loop.br.3");
        (Asm.Mov ((Asm.Stack -44), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -40)));
        Asm.Binary {op = Asm.Sub; src = (Asm.Imm 1); dst = (Asm.Stack -40)};
        (Asm.Mov ((Asm.Stack -40), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -44)));
        (Asm.Jmp "loop.ct.1"); (Asm.Label "loop.br.1");
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "target";
        counter = 11;
        offset = -56;
        stack slots = {
          tmp.0  -> -4,
          tmp.1  -> -8,
          tmp.2  -> -12,
          tmp.3  -> -16,
          tmp.4  -> -20,
          tmp.5  -> -24,
          tmp.7  -> -28,
          tmp.8  -> -32,
          tmp.9  -> -36,
          tmp.10 -> -40,
          a.1    -> -44,
          b.2    -> -48,
          c.3    -> -52,
          d.4    -> -56,
        }}};
     Asm.Function {name = "main"; global = true;
       instructions =
       [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 5), (Asm.Reg Asm.DI)));
         (Asm.Mov ((Asm.Imm 4), (Asm.Reg Asm.SI)));
         (Asm.Mov ((Asm.Imm 3), (Asm.Reg Asm.DX)));
         (Asm.Mov ((Asm.Imm 65), (Asm.Reg Asm.CX))); (Asm.Call "target");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -4)));
         (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         namespace = "main";
         counter = 1;
         offset = -4;
         stack slots = {
           tmp.0 -> -4,
         }}}
     ])
