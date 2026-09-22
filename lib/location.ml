type t = { line : int; col : int }

let of_lexbuf lexbuf =
  let p = lexbuf.Lexing.lex_curr_p in
  { line = p.Lexing.pos_lnum; col = p.Lexing.pos_cnum - p.Lexing.pos_bol }

let to_string t = Printf.sprintf "line %d, column %d" t.line t.col
