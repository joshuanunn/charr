(** Extract the string name from an [Ast.Identifier]. Raises if the AST node is
    not an identifier. *)
let get_identifier_name = function
  | Ast.Identifier name -> name
  | _ -> failwith "expected Identifier"

(** Extract the string name from a resolved AST identifier. *)
let ident_name (id : Ast.ident) : string = get_identifier_name id
