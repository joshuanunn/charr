(** This preprocessor pass strips comments from source files by replacement
    with spaces and maintaining newlines. *)

{

}

let newline = '\n'
let block_comment_open = "/*"
let block_comment_close = "*/"
let inline_comment = "//" [^'\n']*

rule read buf =
  parse
  | block_comment_open { Buffer.add_string buf "  "; block_comment buf lexbuf; read buf lexbuf }
  | inline_comment { Buffer.add_string buf (String.make (Lexing.lexeme_end lexbuf - Lexing.lexeme_start lexbuf) ' '); read buf lexbuf }
  | '"' { Buffer.add_char buf '"'; string_lit buf lexbuf; read buf lexbuf }
  | '\'' { Buffer.add_char buf '\''; char_lit buf lexbuf; read buf lexbuf }
  | newline { Buffer.add_char buf '\n'; Lexing.new_line lexbuf; read buf lexbuf }
  | eof { () }
  | _ { Buffer.add_string buf (Lexing.lexeme lexbuf); read buf lexbuf }

and block_comment buf =
  parse
  | block_comment_close { Buffer.add_string buf "  " }
  | newline { Buffer.add_char buf '\n'; Lexing.new_line lexbuf; block_comment buf lexbuf }
  | eof { Diagnostics.fail lexbuf "unterminated comment" }
  | _ { Buffer.add_char buf ' '; block_comment buf lexbuf }

and string_lit buf =
  parse
  | '\\' _ { Buffer.add_string buf (Lexing.lexeme lexbuf); string_lit buf lexbuf }
  | '"' { Buffer.add_char buf '"' }
  | newline | eof { Diagnostics.fail lexbuf "unterminated string literal" }
  | _ { Buffer.add_string buf (Lexing.lexeme lexbuf); string_lit buf lexbuf }

and char_lit buf =
  parse
  | '\\' _ { Buffer.add_string buf (Lexing.lexeme lexbuf); char_lit buf lexbuf }
  | '\'' { Buffer.add_char buf '\'' }
  | newline | eof { Diagnostics.fail lexbuf "unterminated char literal" }
  | _ { Buffer.add_string buf (Lexing.lexeme lexbuf); char_lit buf lexbuf }

{
let strip source =
  let lexbuf = Lexing.from_string source in
  let buf = Buffer.create (String.length source) in
  read buf lexbuf;
  Buffer.contents buf
}
