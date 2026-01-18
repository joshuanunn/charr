(Asm.Program
   [Asm.Function {name = "target"; global = true;
      instructions =
      [(Asm.AllocateStack 96); (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX)));
        Asm.Ret];
      frame =
      Env.lenv {
        namespace = "target";
        counter = 27;
        offset = -88;
        stack slots = {
          x.0    -> -4,
          y.1    -> -8,
          tmp.0  -> -12,
          z.2    -> -16,
          a.3    -> -20,
          b.4    -> -24,
          c.5    -> -28,
          tmp.1  -> -32,
          tmp.2  -> -36,
          tmp.3  -> -40,
          tmp.4  -> -44,
          tmp.7  -> -48,
          tmp.8  -> -52,
          tmp.11 -> -56,
          tmp.12 -> -60,
          tmp.13 -> -64,
          tmp.16 -> -68,
          tmp.17 -> -72,
          tmp.18 -> -76,
          tmp.21 -> -80,
          tmp.22 -> -84,
          tmp.23 -> -88,
        }}};
     Asm.Function {name = "main"; global = true;
       instructions =
       [(Asm.AllocateStack 16); (Asm.Call "target");
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
