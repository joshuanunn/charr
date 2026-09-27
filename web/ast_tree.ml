(** Converts a validated Ast.prog into a suitable tree for the interactive web
    UI display. *)

type cls = Ctor | Field | Leaf | Ident

type node = {
  cls : cls;
  label : string;
  sub : string option;
  kids : node list;
}

let leaf ?sub label = { cls = Leaf; label; sub; kids = [] }
let ident ?sub label = { cls = Ident; label; sub; kids = [] }
let ctor ?sub label kids = { cls = Ctor; label; sub; kids }
let field label kids = { cls = Field; label; sub = None; kids }

let field_or_none label = function
  | [] -> field label [ leaf "(none)" ]
  | kids -> field label kids

let type_str (t : Charr.Ctype.t) =
  let rec go = function
    | Charr.Ctype.Int -> "int"
    | Charr.Ctype.Long -> "long"
    | Charr.Ctype.UInt -> "unsigned int"
    | Charr.Ctype.ULong -> "unsigned long"
    | Charr.Ctype.FunType { params; ret } ->
        "(" ^ String.concat ", " (List.map go params) ^ ") -> " ^ go ret
  in
  go t

let type_str_opt = function None -> None | Some t -> Some (type_str t)

let const_str (c : Charr.Ctype.const) =
  let v = Charr.Ctype.const_to_int64 c in
  match c with
  | Charr.Ctype.ConstInt _ -> Int64.to_string v
  | Charr.Ctype.ConstLong _ -> Int64.to_string v ^ "L"
  | Charr.Ctype.ConstUInt _ -> Int64.to_string v ^ "U"
  | Charr.Ctype.ConstULong _ -> Int64.to_string v ^ "UL"

let storage_str = function
  | Charr.Ast.Static -> "static"
  | Charr.Ast.Extern -> "extern"

let storage_str_opt = function None -> "(none)" | Some s -> storage_str s

let binop_str : Charr.Ast.binop -> string = function
  | Add -> "Add"
  | Subtract -> "Subtract"
  | Multiply -> "Multiply"
  | Divide -> "Divide"
  | Remainder -> "Remainder"
  | And -> "And"
  | Or -> "Or"
  | BwLeftShift -> "BwLeftShift"
  | BwRightShift -> "BwRightShift"
  | BwAnd -> "BwAnd"
  | BwXor -> "BwXor"
  | BwOr -> "BwOr"
  | Equal -> "Equal"
  | NotEqual -> "NotEqual"
  | LessOrEqual -> "LessOrEqual"
  | GreaterOrEqual -> "GreaterOrEqual"
  | LessThan -> "LessThan"
  | GreaterThan -> "GreaterThan"

let unop_str : Charr.Ast.unop -> string = function
  | Negate -> "Negate"
  | Not -> "Not"
  | BwNot -> "BwNot"
  | PreIncrement -> "PreIncrement"
  | PreDecrement -> "PreDecrement"
  | PostIncrement -> "PostIncrement"
  | PostDecrement -> "PostDecrement"

(* Note that label-like identifiers should be kind-prefixed to avoid collisions
   with variables of the same name, when applying UI highlighting. *)
let ident_label : Charr.Ast.ident -> string = function
  | Identifier s -> s
  | GotoLabel s -> "goto " ^ s
  | LoopLabel s -> "loop " ^ s
  | SwitchLabel s -> "switch " ^ s
  | CaseLabel s -> "case " ^ s

let ident_node (id : Charr.Ast.ident) = ident (ident_label id)

let rec node_of_expr (e : Charr.Ast.expr) = node_of_expr_kind e.typ e.e

and node_of_expr_kind (typ : Charr.Ctype.t option) (ek : Charr.Ast.expr_kind) =
  let sub = type_str_opt typ in
  match ek with
  | Constant c -> leaf ?sub (const_str c)
  | Var id -> ident ?sub (ident_label id)
  | Cast { target_type; exp } ->
      ctor ?sub "Cast" [ leaf ("as " ^ type_str target_type); node_of_expr exp ]
  | Unary { op; exp } -> ctor ?sub ("Unary " ^ unop_str op) [ node_of_expr exp ]
  | Binary { op; left; right } ->
      ctor ?sub
        ("Binary " ^ binop_str op)
        [ node_of_expr left; node_of_expr right ]
  | Assignment (lhs, rhs) ->
      ctor ?sub "Assignment" [ node_of_expr lhs; node_of_expr rhs ]
  | Conditional { cond_exp; then_exp; else_exp } ->
      ctor ?sub "Conditional"
        [
          field "cond" [ node_of_expr cond_exp ];
          field "then" [ node_of_expr then_exp ];
          field "else" [ node_of_expr else_exp ];
        ]
  | FunctionCall { name; args } ->
      ctor ?sub
        ("FunctionCall " ^ ident_label name)
        [ field_or_none "args" (List.map node_of_expr args) ]
  | Comma (e1, e2) -> ctor ?sub "Comma" [ node_of_expr e1; node_of_expr e2 ]

let rec node_of_stmt (s : Charr.Ast.stmt) =
  match s with
  | Return e -> ctor "Return" [ node_of_expr e ]
  | Expression e -> ctor "Expression" [ node_of_expr e ]
  | If { cond_exp; then_smt; else_smt } ->
      ctor "If"
        [
          field "cond" [ node_of_expr cond_exp ];
          field "then" [ node_of_stmt then_smt ];
          field "else"
            (match else_smt with
            | Some s -> [ node_of_stmt s ]
            | None -> [ leaf "(none)" ]);
        ]
  | Compound b -> ctor "Compound" [ node_of_block b ]
  | Break id -> ctor "Break" [ field_id id ]
  | Continue id -> ctor "Continue" [ field_id id ]
  | While { cond; body; id } ->
      ctor "While"
        [
          field "cond" [ node_of_expr cond ];
          field "body" [ node_of_stmt body ];
          field_id id;
        ]
  | DoWhile { body; cond; id } ->
      ctor "DoWhile"
        [
          field "body" [ node_of_stmt body ];
          field "cond" [ node_of_expr cond ];
          field_id id;
        ]
  | For { init; cond; post; body; id } ->
      ctor "For"
        [
          field "init" [ node_of_for_init init ];
          field "cond"
            (match cond with
            | Some c -> [ node_of_expr c ]
            | None -> [ leaf "(none)" ]);
          field "post"
            (match post with
            | Some p -> [ node_of_expr p ]
            | None -> [ leaf "(none)" ]);
          field "body" [ node_of_stmt body ];
          field_id id;
        ]
  | Switch { cond; body; id } ->
      ctor "Switch"
        [
          field "cond" [ node_of_expr cond ];
          field "body" [ node_of_stmt body ];
          field_id id;
        ]
  | Case { value; body; id } ->
      ctor "Case"
        [
          field "value" [ node_of_expr value ];
          field "body" [ node_of_stmt body ];
          field_id id;
        ]
  | Default { body; id } ->
      ctor "Default" [ field "body" [ node_of_stmt body ]; field_id id ]
  | Goto id -> ctor ("Goto " ^ ident_label id) []
  | Label (id, s) -> ctor ("Label " ^ ident_label id) [ node_of_stmt s ]
  | Null -> leaf "Null"

and field_id (id : Charr.Ast.ident option) =
  field "id"
    (match id with Some i -> [ ident_node i ] | None -> [ leaf "(none)" ])

and node_of_for_init (fi : Charr.Ast.for_init) =
  match fi with
  | InclDecl vd -> node_of_var_decl vd
  | InitExp None -> leaf "(none)"
  | InitExp (Some e) -> node_of_expr e

and node_of_block_item (bi : Charr.Ast.block_item) =
  match bi with S s -> node_of_stmt s | D d -> node_of_decl d

and node_of_block (Charr.Ast.Block items : Charr.Ast.block) =
  ctor "Block"
    (match items with
    | [] -> [ leaf "(empty)" ]
    | _ -> List.map node_of_block_item items)

and node_of_decl (d : Charr.Ast.decl) =
  match d with
  | FunDecl fd -> node_of_fun_decl fd
  | VarDecl vd -> node_of_var_decl vd

and node_of_var_decl (vd : Charr.Ast.var_decl) =
  ctor
    ("VarDecl " ^ ident_label vd.name)
    [
      field "init"
        (match vd.init with
        | Some e -> [ node_of_expr e ]
        | None -> [ leaf "(none)" ]);
      field "var_type" [ leaf (type_str vd.var_type) ];
      field "storage" [ leaf (storage_str_opt vd.storage) ];
    ]

and node_of_fun_decl (fd : Charr.Ast.fun_decl) =
  ctor
    ("FunDecl " ^ ident_label fd.name)
    [
      field_or_none "params" (List.map ident_node fd.params);
      field "body"
        (match fd.body with
        | Some b -> [ node_of_block b ]
        | None -> [ leaf "(none)" ]);
      field "fun_type" [ node_of_fun_type fd.fun_type ];
      field "storage" [ leaf (storage_str_opt fd.storage) ];
    ]

and node_of_fun_type (t : Charr.Ctype.t) =
  match t with
  | Charr.Ctype.FunType { params; ret } ->
      ctor "FunType"
        [
          field_or_none "params" (List.map (fun p -> leaf (type_str p)) params);
          field "ret" [ leaf (type_str ret) ];
        ]
  | t -> leaf (type_str t)

let node_of_prog (Charr.Ast.Program decls : Charr.Ast.prog) =
  ctor "Program"
    (match decls with
    | [] -> [ leaf "(empty)" ]
    | _ -> List.map node_of_decl decls)
