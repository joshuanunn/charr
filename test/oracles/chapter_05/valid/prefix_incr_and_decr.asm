(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 48); (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.AX)));
        Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 13;
        offset = -44;
        stack slots = {
          a.0    -> -4,
          b.1    -> -8,
          c.2    -> -12,
          d.3    -> -16,
          tmp.0  -> -20,
          tmp.1  -> -24,
          tmp.2  -> -28,
          tmp.5  -> -32,
          tmp.6  -> -36,
          tmp.9  -> -40,
          tmp.10 -> -44,
        }}}
     ])
