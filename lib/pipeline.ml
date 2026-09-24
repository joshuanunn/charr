let preprocess defines source =
  Preprocessor.Comment.strip source |> Preprocessor.Directive.process ~defines

let parse defines source =
  let lexbuf = Lexing.from_string (preprocess defines source) in
  try Frontend.Parser.prog Frontend.Lexer.read lexbuf with
  | Frontend.Lexer.Lexing_error msg -> Diagnostics.fail lexbuf msg
  | Frontend.Parser.Error -> Diagnostics.fail lexbuf "syntax error"

let validate_ast ast s_env t_env =
  let ast = Analysis.Resolution.apply ast s_env in
  let ast = Analysis.Typecheck.apply ast t_env in
  Analysis.Label.apply ast

let validate defines source s_env t_env =
  validate_ast (parse defines source) s_env t_env

let gen_ir_of_ast vast opts t_env =
  let ir = Irgen.Translate.apply vast t_env in
  Opt.Passes.apply ir opts t_env

let gen_ir defines source opts s_env t_env =
  gen_ir_of_ast (validate defines source s_env t_env) opts t_env

let gen_asm_of_ir ir t_env =
  let asm, a_env = Targets.X86_64.Codegen.Translate.apply ir t_env in
  let asm = Targets.X86_64.Codegen.Lower.apply asm a_env in
  let asm = Targets.X86_64.Codegen.Fixup.apply asm in
  (asm, a_env)

let gen_asm defines source opts s_env t_env =
  gen_asm_of_ir (gen_ir defines source opts s_env t_env) t_env
