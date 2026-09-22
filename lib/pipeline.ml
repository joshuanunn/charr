let preprocess source = Preprocessor.Comments.strip source
(* TODO: |> Preprocessor.Macro.expand *)

let parse source =
  let lexbuf = Lexing.from_string (preprocess source) in
  try Frontend.Parser.prog Frontend.Lexer.read lexbuf with
  | Frontend.Lexer.Lexing_error msg -> Diagnostics.fail lexbuf msg
  | Frontend.Parser.Error -> Diagnostics.fail lexbuf "syntax error"

let validate source s_env t_env =
  let ast = parse source in
  let ast = Analysis.Resolution.apply ast s_env in
  let ast = Analysis.Typecheck.apply ast t_env in
  Analysis.Label.apply ast

let gen_ir source opts s_env t_env =
  let ir = Irgen.Translate.apply (validate source s_env t_env) t_env in
  Opt.Passes.apply ir opts t_env

let gen_asm source opts s_env t_env =
  let asm, a_env =
    Targets.X86_64.Codegen.Translate.apply
      (gen_ir source opts s_env t_env)
      t_env
  in
  let asm = Targets.X86_64.Codegen.Lower.apply asm a_env in
  let asm = Targets.X86_64.Codegen.Fixup.apply asm in
  (asm, a_env)
