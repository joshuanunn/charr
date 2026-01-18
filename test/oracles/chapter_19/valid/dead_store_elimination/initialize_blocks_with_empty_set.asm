(Asm.Program
   [Asm.Function {name = "target"; global = true;
      instructions =
      [(Asm.AllocateStack 16); (Asm.Label "loop.ct.1");
        (Asm.Cmp ((Asm.Imm 0), (Asm.Data "j")));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.SetCC (Asm.G, (Asm.Stack -4)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.JmpCC (Asm.E, "loop.br.1"));
        (Asm.Mov ((Asm.Data "j"), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -8)));
        Asm.Binary {op = Asm.Sub; src = (Asm.Imm 1); dst = (Asm.Stack -8)};
        (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Data "j"))); (Asm.Jmp "loop.ct.1");
        (Asm.Label "loop.br.1"); (Asm.Mov ((Asm.Imm 0), (Asm.Data "i.0")));
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "target";
        counter = 2;
        offset = -8;
        stack slots = {
          tmp.0 -> -4,
          tmp.1 -> -8,
        }}};
     Asm.Function {name = "main"; global = true;
       instructions =
       [(Asm.AllocateStack 16); (Asm.Call "target");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -4)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Data "j")));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8)));
         (Asm.SetCC (Asm.E, (Asm.Stack -8)));
         (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         namespace = "main";
         counter = 2;
         offset = -8;
         stack slots = {
           tmp.0 -> -4,
           tmp.1 -> -8,
         }}};
     Asm.StaticVariable {name = "j"; global = true; init = 3};
     Asm.StaticVariable {name = "i.0"; global = false; init = 0}])
