let read_file path =
  let chan = open_in path in
  Fun.protect
    ~finally:(fun () -> close_in_noerr chan)
    (fun () ->
      let len = in_channel_length chan in
      really_input_string chan len)

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

let report_errors ~stage f =
  try f () with
  | Diagnostics.Error (loc, msg) ->
      Printf.eprintf "%s error at %s: %s\n" stage (Location.to_string loc) msg;
      exit 1
  | e ->
      prerr_endline (stage ^ " error: " ^ Printexc.to_string e);
      exit 1

let assembly_path path =
  let base = Filename.remove_extension path in
  base ^ ".s"

let run_pp_lexer source = print_string (Preprocessor.Comments.strip source)
let run_preprocess source = print_string (preprocess source)

let run_lexer source =
  report_errors ~stage:"Lexing" (fun () ->
      let lexbuf = Lexing.from_string (preprocess source) in
      let rec loop () =
        try
          let tok = Frontend.Lexer.read lexbuf in
          print_endline (Frontend.Lexer_pp.show_token tok);
          if tok <> Frontend.Parser.EOF then loop ()
        with Frontend.Lexer.Lexing_error msg -> Diagnostics.fail lexbuf msg
      in
      loop ())

let run_parser source =
  report_errors ~stage:"Parsing" (fun () ->
      print_endline (Ast.show_prog (parse source)))

let run_validator source s_env t_env =
  report_errors ~stage:"Semantic analysis" (fun () ->
      let ast = validate source s_env t_env in
      print_endline (Ast.show_prog ast);
      Debug.log (fun () ->
          Format.eprintf "=== Type environment ===\n%a\n\n" Analysis.Tenv.pp
            t_env))

let run_irgen source opts s_env t_env =
  report_errors ~stage:"IR generation" (fun () ->
      print_endline (Ir.show_prog (gen_ir source opts s_env t_env)))

let run_codegen source opts s_env t_env =
  report_errors ~stage:"Code generation" (fun () ->
      let asm, _ = gen_asm source opts s_env t_env in
      print_endline (Targets.X86_64.Asm.show_prog asm))

let run_emit source opts s_env t_env =
  report_errors ~stage:"Assembly emission" (fun () ->
      let asm, _ = gen_asm source opts s_env t_env in
      print_string (Targets.X86_64.Emission.apply asm))

let run_exe source opts output_path s_env t_env =
  report_errors ~stage:"Executable generation" (fun () ->
      let asm, _ = gen_asm source opts s_env t_env in
      let asm_text = Targets.X86_64.Emission.apply asm in
      let oc = open_out output_path in
      Fun.protect
        ~finally:(fun () -> close_out oc)
        (fun () -> output_string oc asm_text))
