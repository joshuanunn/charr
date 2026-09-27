(* Web entry point. *)

open Js_of_ocaml

class type ast_node = object
  method cls : Js.js_string Js.t Js.readonly_prop
  method label : Js.js_string Js.t Js.readonly_prop
  method sub : Js.js_string Js.t Js.opt Js.readonly_prop
  method kids : ast_node Js.t Js.js_array Js.t Js.opt Js.readonly_prop
end

let rec js_of_node (n : Ast_tree.node) : ast_node Js.t =
  let cls_str =
    match n.cls with
    | Ast_tree.Ctor -> "ctor"
    | Ast_tree.Field -> "field"
    | Ast_tree.Leaf -> "leaf"
    | Ast_tree.Ident -> "ident"
  in
  object%js
    val cls = Js.string cls_str
    val label = Js.string n.label
    val sub = Js.Opt.option (Option.map Js.string n.sub)

    val kids =
      match n.kids with
      | [] -> Js.Opt.empty
      | ks -> Js.Opt.return (Js.array (Array.of_list (List.map js_of_node ks)))
  end

let js_stage ?tree (st : Charr.Compile.stage) =
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
    val tree = Js.Opt.option tree
  end

let parse_defines csv =
  csv |> String.split_on_char ','
  |> List.filter (fun s -> s <> "")
  |> Charr.Preprocessor.Define.of_list

let compile (source : Js.js_string Js.t) (defines_csv : Js.js_string Js.t)
    (opt_flags : int) =
  let defines = parse_defines (Js.to_string defines_csv) in
  let result = Charr.Compile.run ~defines ~opt_flags (Js.to_string source) in
  let tree_of prog =
    Option.map (fun p -> js_of_node (Ast_tree.node_of_prog p)) prog
  in
  let ast_tree = tree_of result.ast in
  let vast_tree = tree_of result.vast in
  result.stages
  |> List.map (fun (st : Charr.Compile.stage) ->
      match st.name with
      | "ast" -> js_stage ?tree:ast_tree st
      | "validated_ast" -> js_stage ?tree:vast_tree st
      | _ -> js_stage st)
  |> Array.of_list |> Js.array

let () =
  Js.export "charr"
    (object%js
       method compile source defines_csv opt_flags =
         compile source defines_csv opt_flags
    end)
