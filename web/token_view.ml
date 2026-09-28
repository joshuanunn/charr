(** Classifies lexer tokens for the interactive web UI display. *)

type cat = Keyword | Ident | Literal | Punct
type t = { cat : cat; label : string }

(* Deliberately no wildcard, so a new token must be classified here. *)
let cat_of_token : Charr.Frontend.Parser.token -> cat = function
  | IDENTIFIER _ -> Ident
  | LITERAL_INT _ | LITERAL_UINT _ | LITERAL_LONG _ | LITERAL_ULONG _ -> Literal
  | KW_STATIC | KW_EXTERN | KW_SIGNED | KW_UNSIGNED | KW_INT | KW_LONG | KW_VOID
  | KW_RETURN | KW_IF | KW_ELSE | KW_DO | KW_WHILE | KW_FOR | KW_BREAK
  | KW_CONTINUE | KW_SWITCH | KW_CASE | KW_DEFAULT | KW_GOTO ->
      Keyword
  | LPAREN | RPAREN | LBRACE | RBRACE | SEMICOLON | QUESTION | COLON | COMMA
  | INCREMENT | DECREMENT | ADD_ASSIGN | SUB_ASSIGN | MUL_ASSIGN | DIV_ASSIGN
  | MOD_ASSIGN | LSHIFT_ASSIGN | RSHIFT_ASSIGN | BW_AND_ASSIGN | BW_OR_ASSIGN
  | BW_XOR_ASSIGN | ADD | SUB | MUL | DIV | MOD | AND | OR | BW_LSHIFT
  | BW_RSHIFT | BW_NOT | BW_AND | BW_OR | BW_XOR | EQ | NE | LE | GE | LT | GT
  | NOT | ASSIGN | EOF ->
      Punct

let of_token tok =
  { cat = cat_of_token tok; label = Charr.Frontend.Lexer_pp.show_token tok }
