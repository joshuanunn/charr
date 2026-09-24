(** Whole-pipeline entry point that returns every intermediate representation as
    text, which is used by the web build. *)

type status =
  | Done of string  (** contains serialised output. *)
  | Failed of string  (** contains the error message. *)
  | Skipped

type stage = { name : string; status : status }

let error_message = function
  | Diagnostics.Error (loc, msg) ->
      Printf.sprintf "%s: %s" (Location.to_string loc) msg
  | e -> Printexc.to_string e

let run_stage name prev f show =
  match prev with
  | None -> ({ name; status = Skipped }, None)
  | Some x -> (
      match f x with
      | y -> ({ name; status = Done (show y) }, Some y)
      | exception e -> ({ name; status = Failed (error_message e) }, None))

let lex_tokens preprocessed =
  let lexbuf = Lexing.from_string preprocessed in
  let buf = Buffer.create 256 in
  let rec loop () =
    let tok = Frontend.Lexer.read lexbuf in
    Buffer.add_string buf (Frontend.Lexer_pp.show_token tok);
    Buffer.add_char buf '\n';
    if tok <> Frontend.Parser.EOF then loop ()
  in
  loop ();
  Buffer.contents buf

let parse_preprocessed preprocessed =
  let lexbuf = Lexing.from_string preprocessed in
  try Frontend.Parser.prog Frontend.Lexer.read lexbuf with
  | Frontend.Lexer.Lexing_error msg -> Diagnostics.fail lexbuf msg
  | Frontend.Parser.Error -> Diagnostics.fail lexbuf "syntax error"

(** [run ~defines ~opt_flags source] compiles [source] and reports each stage in
    order: preprocess, tokens, ast, validated_ast, ir, asm_ir, asm. *)
let run ~defines ~opt_flags source =
  (* Label numbering is global, so reset it before each run. *)
  Analysis.Label.reset ();
  let opts = Opt.Passes.unpack_opts opt_flags in
  let s_env = Analysis.Senv.make () in
  let t_env = Analysis.Tenv.make () in

  let preprocess, preprocess_v =
    run_stage "preprocess" (Some source) (Pipeline.preprocess defines) Fun.id
  in
  let tokens, _ = run_stage "tokens" preprocess_v lex_tokens Fun.id in
  let ast, ast_v =
    run_stage "ast" preprocess_v parse_preprocessed Ast.show_prog
  in
  let vast, vast_v =
    run_stage "validated_ast" ast_v
      (fun a -> Pipeline.validate_ast a s_env t_env)
      Ast.show_prog
  in
  let ir, ir_v =
    run_stage "ir" vast_v
      (fun a -> Pipeline.gen_ir_of_ast a opts t_env)
      Ir.show_prog
  in
  let asm_ir, asm_ir_v =
    run_stage "asm_ir" ir_v
      (fun i -> Pipeline.gen_asm_of_ir i t_env)
      (fun (a, _) -> Targets.X86_64.Asm.show_prog a)
  in
  let asm, _ =
    run_stage "asm" asm_ir_v
      (fun (a, _) -> Targets.X86_64.Emission.apply a)
      Fun.id
  in
  [ preprocess; tokens; ast; vast; ir; asm_ir; asm ]
