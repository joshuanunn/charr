let report_errors ~stage f =
  try f () with
  | Diagnostics.Error (loc, msg) ->
      Printf.eprintf "%s error at %s: %s\n" stage (Location.to_string loc) msg;
      exit 1
  | e ->
      prerr_endline (stage ^ " error: " ^ Printexc.to_string e);
      exit 1

let run_pp_lexer source = print_string (Preprocessor.Comment.strip source)

let run_preprocess defines source =
  print_string (Pipeline.preprocess defines source)

let run_lexer defines source =
  report_errors ~stage:"Lexing" (fun () ->
      let lexbuf = Lexing.from_string (Pipeline.preprocess defines source) in
      let rec loop () =
        try
          let tok = Frontend.Lexer.read lexbuf in
          print_endline (Frontend.Lexer_pp.show_token tok);
          if tok <> Frontend.Parser.EOF then loop ()
        with Frontend.Lexer.Lexing_error msg -> Diagnostics.fail lexbuf msg
      in
      loop ())

let run_parser defines source =
  report_errors ~stage:"Parsing" (fun () ->
      print_endline (Ast.show_prog (Pipeline.parse defines source)))

let run_validator defines source s_env t_env =
  report_errors ~stage:"Semantic analysis" (fun () ->
      let ast = Pipeline.validate defines source s_env t_env in
      print_endline (Ast.show_prog ast);
      Debug.log (fun () ->
          Format.eprintf "=== Type environment ===\n%a\n\n" Analysis.Tenv.pp
            t_env))

let run_irgen defines source opts s_env t_env =
  report_errors ~stage:"IR generation" (fun () ->
      print_endline
        (Ir.show_prog (Pipeline.gen_ir defines source opts s_env t_env)))

let run_codegen defines source opts s_env t_env =
  report_errors ~stage:"Code generation" (fun () ->
      let asm, _ = Pipeline.gen_asm defines source opts s_env t_env in
      print_endline (Targets.X86_64.Asm.show_prog asm))

let run_emit defines source opts s_env t_env =
  report_errors ~stage:"Assembly emission" (fun () ->
      let asm, _ = Pipeline.gen_asm defines source opts s_env t_env in
      print_string (Targets.X86_64.Emission.apply asm))

let run_exe defines source opts output_path s_env t_env =
  report_errors ~stage:"Executable generation" (fun () ->
      let asm, _ = Pipeline.gen_asm defines source opts s_env t_env in
      let asm_text = Targets.X86_64.Emission.apply asm in
      let oc = open_out output_path in
      Fun.protect
        ~finally:(fun () -> close_out oc)
        (fun () -> output_string oc asm_text))
