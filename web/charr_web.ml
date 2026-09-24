(* Web entry point. *)

open Js_of_ocaml

let js_stage (st : Charr.Compile.stage) =
  let status_str, output_str =
    match st.status with
    | Charr.Compile.Done s -> ("done", s)
    | Charr.Compile.Failed s -> ("error", s)
    | Charr.Compile.Skipped -> ("skipped", "")
  in
  object%js
    val name = Js.string st.name
    val status = Js.string status_str
    val output = Js.string output_str
  end

let parse_defines csv =
  csv |> String.split_on_char ','
  |> List.filter (fun s -> s <> "")
  |> Charr.Preprocessor.Define.of_list

let compile (source : Js.js_string Js.t) (defines_csv : Js.js_string Js.t)
    (opt_flags : int) =
  let defines = parse_defines (Js.to_string defines_csv) in
  Charr.Compile.run ~defines ~opt_flags (Js.to_string source)
  |> List.map js_stage |> Array.of_list |> Js.array

let () =
  Js.export "charr"
    (object%js
       method compile source defines_csv opt_flags =
         compile source defines_csv opt_flags
    end)
