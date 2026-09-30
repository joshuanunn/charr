(** Common representation shared by the IR and Asm IR tab listing view. *)

type op_kind = Imm | Var | Reg | Mem | Label_ref
type op = { kind : op_kind; text : string }

type row =
  | Instr of {
      mnemonic : string;
      badge : string option;
      ops : op list;
      result : op option;
    }
  | Label of string

type block = {
  name : string;
  global : bool;
  params : op list;
  badge : string option;
  rows : row list;
}

type listing = block list

let imm text = { kind = Imm; text }
let var text = { kind = Var; text }
let reg text = { kind = Reg; text }
let mem text = { kind = Mem; text }
let label_ref text = { kind = Label_ref; text }
let instr ?badge ?result mnemonic ops = Instr { mnemonic; badge; ops; result }
