let () =
  if Array.length Sys.argv <> 5 && Array.length Sys.argv <> 6 then (
    prerr_endline
      "Usage: .charr <file.c> <phase> <opt_flags> <debug> \
       [comma,separated,defines]";
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

  (* Read any preprocessor defines into Define set *)
  let defines =
    if Array.length Sys.argv = 6 then
      Sys.argv.(5) |> String.split_on_char ','
      |> List.filter (fun s -> s <> "")
      |> Charr.Preprocessor.Define.of_list
    else Charr.Preprocessor.Define.empty
  in

  (* Read C source file into string *)
  let source = Charr.Io.read_file source_path in

  (* Initialise new environments *)
  let s_env = Charr.Analysis.Senv.make () in
  let t_env = Charr.Analysis.Tenv.make () in

  match phase with
  | 0 -> Charr.Driver.run_pp_lexer source
  | 1 -> Charr.Driver.run_preprocess defines source
  | 2 -> Charr.Driver.run_lexer defines source
  | 3 -> Charr.Driver.run_parser defines source
  | 4 -> Charr.Driver.run_validator defines source s_env t_env
  | 5 -> Charr.Driver.run_irgen defines source enabled_opts s_env t_env
  | 6 -> Charr.Driver.run_codegen defines source enabled_opts s_env t_env
  | 7 -> Charr.Driver.run_emit defines source enabled_opts s_env t_env
  | 8 ->
      Charr.Driver.run_exe defines source enabled_opts target_path s_env t_env
  | _ ->
      prerr_endline
        "Unknown phase. Supported: 0=pp-lex 1=preprocess 2=lex, 3=parse, \
         4=validate, 5=irgen, 6=codegen, 7=emit, 8=exe";
      exit 1
