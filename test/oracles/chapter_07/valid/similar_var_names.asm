(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 80); (Asm.Mov ((Asm.Imm 28), (Asm.Reg Asm.AX)));
        Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 3;
        offset = -72;
        stack slots = {
          a.0      -> -4,
          result.1 -> -8,
          a1.2     -> -12,
          a.3      -> -16,
          a1.4     -> -20,
          a.5      -> -24,
          a.6      -> -28,
          a.7      -> -32,
          a.8      -> -36,
          a.9      -> -40,
          a.10     -> -44,
          a.11     -> -48,
          a.12     -> -52,
          a.13     -> -56,
          a.14     -> -60,
          tmp.0    -> -64,
          tmp.1    -> -68,
          tmp.2    -> -72,
        }}}
     ])
