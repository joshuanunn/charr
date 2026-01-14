(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 64); (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.AX)));
        Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 17;
        offset = -56;
        stack slots = {
          switch1.0 -> -4,
          switch2.1 -> -8,
          switch3.2 -> -12,
          tmp.0     -> -16,
          tmp.1     -> -20,
          tmp.2     -> -24,
          tmp.4     -> -28,
          tmp.5     -> -32,
          tmp.8     -> -36,
          i.3       -> -40,
          tmp.9     -> -44,
          tmp.10    -> -48,
          tmp.11    -> -52,
          tmp.14    -> -56,
        }}}
     ])
