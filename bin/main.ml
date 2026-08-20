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

  let enabled_opts = Charr.Passes.unpack_opts opt_flags in

  let () =
    match int_of_string_opt Sys.argv.(4) with
    | Some 0 -> ()
    | Some 1 -> Charr.Debug.enable ()
    | Some _ | None ->
        prerr_endline "Debug mode must be set to 0 (disabled) or 1 (enabled)";
        exit 1
  in

  (* Initialise new environments *)
  let s_env = Charr.Env.make_senv () in
  let t_env = Charr.Env.make_tenv () in
  Charr.Io.with_input_file source_path (fun lexbuf ->
      match phase with
      | 1 -> Charr.Io.run_lexer lexbuf
      | 2 -> Charr.Io.run_parser lexbuf
      | 3 -> Charr.Io.run_validator lexbuf s_env t_env
      | 4 -> Charr.Io.run_irgen lexbuf enabled_opts s_env t_env
      | 5 -> Charr.Io.run_codegen lexbuf enabled_opts s_env t_env
      | 6 -> Charr.Io.run_emit lexbuf enabled_opts s_env t_env
      | 7 -> Charr.Io.run_exe lexbuf enabled_opts target_path s_env t_env
      | _ ->
          prerr_endline
            "Unknown phase. Supported: 1=lex, 2=parse, 3=validate, 4=irgen, \
             5=codegen, 6=emit, 7=exe";
          exit 1)
