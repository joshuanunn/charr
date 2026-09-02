let parse lexbuf = Parser.prog Lexer.read lexbuf

let validate lexbuf s_env t_env =
  let ast = parse lexbuf in
  let ast = Ast_resolution.resolve_prog ast s_env in
  let ast = Ast_type_check.type_prog ast t_env in
  Ast_flow_label.label_prog ast

let gen_ir lexbuf opts s_env t_env =
  let ir = Irgen.convert_prog (validate lexbuf s_env t_env) t_env in
  Passes.optimise_prog ir opts t_env

let gen_asm lexbuf opts s_env t_env =
  let asm, a_env =
    Codegen.compile_prog (gen_ir lexbuf opts s_env t_env) t_env
  in
  let asm = Codegen_lower.lower_prog asm a_env in
  let asm = Codegen_fixup.fixup_prog asm in
  (asm, a_env)

let report_errors ~stage lexbuf f =
  try f () with
  | Lexer.Lexing_error msg ->
      let pos = lexbuf.Lexing.lex_curr_p in
      Printf.eprintf "Lexing error at line %d, column %d: %s\n"
        pos.Lexing.pos_lnum
        (pos.Lexing.pos_cnum - pos.Lexing.pos_bol)
        msg;
      exit 1
  | Parser.Error ->
      let pos = lexbuf.Lexing.lex_curr_p in
      Printf.eprintf "Parse error at line %d, column %d\n" pos.Lexing.pos_lnum
        (pos.Lexing.pos_cnum - pos.Lexing.pos_bol);
      exit 1
  | e ->
      prerr_endline (stage ^ " error: " ^ Printexc.to_string e);
      exit 1

let assembly_path path =
  let base = Filename.remove_extension path in
  base ^ ".s"

let with_input_file path f =
  let chan = open_in path in
  Fun.protect
    ~finally:(fun () -> close_in_noerr chan)
    (fun () -> f (Lexing.from_channel chan))

let run_lexer lexbuf =
  let rec loop () =
    try
      let tok = Lexer.read lexbuf in
      print_endline (Lexer_pp.show_token tok);
      if tok != Parser.EOF then loop ()
    with Lexer.Lexing_error msg ->
      let pos = lexbuf.Lexing.lex_curr_p in
      Printf.eprintf "Lexing error at line %d, column %d: %s\n"
        pos.Lexing.pos_lnum
        (pos.Lexing.pos_cnum - pos.Lexing.pos_bol)
        msg;
      exit 1
  in
  loop ()

let run_parser lexbuf =
  report_errors ~stage:"Parsing" lexbuf (fun () ->
      print_endline (Ast.show_prog (parse lexbuf)))

let run_validator lexbuf s_env t_env =
  report_errors ~stage:"Semantic analysis" lexbuf (fun () ->
      print_endline (Ast.show_prog (validate lexbuf s_env t_env)))

let run_irgen lexbuf opts s_env t_env =
  report_errors ~stage:"IR generation" lexbuf (fun () ->
      print_endline (Ir.show_prog (gen_ir lexbuf opts s_env t_env)))

let run_codegen lexbuf opts s_env t_env =
  report_errors ~stage:"Code generation" lexbuf (fun () ->
      let asm, _ = gen_asm lexbuf opts s_env t_env in
      print_endline (Asm.show_prog asm))

let run_emit lexbuf opts s_env t_env =
  report_errors ~stage:"Assembly emission" lexbuf (fun () ->
      let asm, a_env = gen_asm lexbuf opts s_env t_env in
      print_string (Emit.emit_prog asm a_env))

let run_exe lexbuf opts output_path s_env t_env =
  report_errors ~stage:"Executable generation" lexbuf (fun () ->
      let asm, a_env = gen_asm lexbuf opts s_env t_env in
      let asm_text = Emit.emit_prog asm a_env in
      let oc = open_out output_path in
      Fun.protect
        ~finally:(fun () -> close_out oc)
        (fun () -> output_string oc asm_text))
