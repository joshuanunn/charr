let () =
  if Array.length Sys.argv <> 5 then (
    prerr_endline "Usage: .charr <file.c> <phase> <opt_flags> <debug>";
    exit 1);

  let source_path = Sys.argv.(1) in
  let target_path = Charr.Io.assembly_path source_path in
  let phase =
    match int_of_string_opt Sys.argv.(2) with
    | Some n -> n
    | None ->
        prerr_endline "Phase must be an integer";
        exit 1
  in

  let opt_flags =
    match int_of_string_opt Sys.argv.(3) with
    | Some n -> n
    | None ->
        prerr_endline "Opt_flags must be an integer";
        exit 1
  in

  let enabled_opts = Charr.Opt.Passes.unpack_opts opt_flags in

  let () =
    match int_of_string_opt Sys.argv.(4) with
    | Some 0 -> ()
    | Some 1 -> Charr.Debug.enable ()
    | Some _ | None ->
        prerr_endline "Debug mode must be set to 0 (disabled) or 1 (enabled)";
        exit 1
  in

  (* Read C source file into string *)
  let source = Charr.Io.read_file source_path in

  (* Initialise new environments *)
  let s_env = Charr.Analysis.Senv.make () in
  let t_env = Charr.Analysis.Tenv.make () in

  match phase with
  | 0 -> Charr.Io.run_pp_lexer source
  | 1 -> Charr.Io.run_preprocess source
  | 2 -> Charr.Io.run_lexer source
  | 3 -> Charr.Io.run_parser source
  | 4 -> Charr.Io.run_validator source s_env t_env
  | 5 -> Charr.Io.run_irgen source enabled_opts s_env t_env
  | 6 -> Charr.Io.run_codegen source enabled_opts s_env t_env
  | 7 -> Charr.Io.run_emit source enabled_opts s_env t_env
  | 8 -> Charr.Io.run_exe source enabled_opts target_path s_env t_env
  | _ ->
      prerr_endline
        "Unknown phase. Supported: 0=pp-lex 1=preprocess 2=lex, 3=parse, \
         4=validate, 5=irgen, 6=codegen, 7=emit, 8=exe";
      exit 1
