{
exception Error = Diagnostics.Error

type frame = { parent_active : bool; taken : bool; ever_taken : bool }

let is_active = function
  | [] -> true
  | f :: _ -> f.parent_active && f.taken

let push_if stack cond =
  let parent_active = is_active !stack in
  let status = parent_active && cond in
  stack := { parent_active; taken = status; ever_taken = status } :: !stack

let do_elif stack lexbuf cond_fn =
  match !stack with
  | [] -> Diagnostics.fail lexbuf "preprocessor error: #elif without #if"
  | f :: rest ->
    let cond = f.parent_active && (not f.ever_taken) && cond_fn () in
    stack := { f with taken = cond; ever_taken = f.ever_taken || cond } :: rest

let do_else stack lexbuf =
  match !stack with
  | [] -> Diagnostics.fail lexbuf "preprocessor error: #else without #if"
  | f :: rest ->
    stack := { f with taken = f.parent_active && not f.ever_taken; ever_taken = true } :: rest

let do_endif stack lexbuf =
  match !stack with
  | [] -> Diagnostics.fail lexbuf "preprocessor error: #endif without #if"
  | _ :: rest -> stack := rest

let blank buf lexbuf =
  let length = Lexing.lexeme_end lexbuf - Lexing.lexeme_start lexbuf in
  Buffer.add_string buf (String.make length ' ')

let eval_cond defines lexbuf expr =
  let defined id = Define.mem id defines in
  try Expression.eval ~defined expr with Expression.Error msg -> Diagnostics.fail lexbuf msg
}

let ws = [' ' '\t']*
let alpha = ['a'-'z' 'A'-'Z' '_']
let alphanum = ['a'-'z' 'A'-'Z' '0'-'9' '_']
let identifier = alpha alphanum*
let rest = [^ '\n']*

rule line_start defines stack buf =
  parse
  | ws '#' ws "ifdef" ws (identifier as id) rest {
      push_if stack (eval_cond defines lexbuf ("defined " ^ id));
      blank buf lexbuf;
      scan defines stack buf lexbuf }
  | ws '#' ws "ifndef" ws (identifier as id) rest {
      push_if stack (eval_cond defines lexbuf ("!defined " ^ id));
      blank buf lexbuf;
      scan defines stack buf lexbuf }
  | ws '#' ws "if" ws (rest as expr) {
      push_if stack (eval_cond defines lexbuf expr);
      blank buf lexbuf;
      scan defines stack buf lexbuf }
  | ws '#' ws "elif" ws (rest as expr) {
      do_elif stack lexbuf (fun () -> eval_cond defines lexbuf expr);
      blank buf lexbuf;
      scan defines stack buf lexbuf }
  | ws '#' ws "else" rest {
      do_else stack lexbuf;
      blank buf lexbuf;
      scan defines stack buf lexbuf }
  | ws '#' ws "endif" rest {
      do_endif stack lexbuf;
      blank buf lexbuf;
      scan defines stack buf lexbuf }
  | ws '#' ws "pragma" rest {
      blank buf lexbuf;
      scan defines stack buf lexbuf }
  | ws '#' ws (identifier as directive) rest {
      (if is_active !stack then
          Diagnostics.fail lexbuf (Printf.sprintf "preprocessor error: unsupported directive #%s" directive));
          blank buf lexbuf;
          scan defines stack buf lexbuf }
  | eof { () }
  | "" { scan defines stack buf lexbuf }

and scan defines stack buf =
  parse
  | '\n' {
      Buffer.add_char buf '\n';
      Lexing.new_line lexbuf;
      line_start defines stack buf lexbuf }
  | eof { () }
  | _ {
      (if is_active !stack then Buffer.add_string buf (Lexing.lexeme lexbuf)
      else Buffer.add_char buf ' ');
      scan defines stack buf lexbuf }

{
let process ~defines source =
  let lexbuf = Lexing.from_string source in
  let buf = Buffer.create (String.length source) in
  let stack = ref [] in
  line_start defines stack buf lexbuf;
  (match !stack with [] -> () | _ :: _ -> Diagnostics.fail lexbuf "preprocessor error: unterminated #if");
  Buffer.contents buf
}
