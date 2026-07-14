type storage_class = Static | Extern [@@deriving show]

type ctype = Int | Long | FunType of { params : ctype list; ret : ctype }
[@@deriving show, ord]

type const = ConstInt of int32 | ConstLong of int64 [@@deriving show]

type specifier = SpecType of ctype | SpecStorage of storage_class
[@@deriving show]

type ident =
  | Identifier of string
  | GotoLabel of string
  | LoopLabel of string
  | SwitchLabel of string
[@@deriving show]

type unop =
  | Negate
  | Not
  | BwNot
  | PreIncrement
  | PreDecrement
  | PostIncrement
  | PostDecrement
[@@deriving show]

type binop =
  | Add
  | Subtract
  | Multiply
  | Divide
  | Remainder
  | And
  | Or
  | BwLeftShift
  | BwRightShift
  | BwAnd
  | BwXor
  | BwOr
  | Equal
  | NotEqual
  | LessOrEqual
  | GreaterOrEqual
  | LessThan
  | GreaterThan
[@@deriving show]

type expr = { e : expr_kind; typ : ctype option }

and expr_kind =
  | Constant of const
  | Var of ident
  | Cast of { target_type : ctype; exp : expr }
  | Unary of { op : unop; exp : expr }
  | Binary of { op : binop; left : expr; right : expr }
  | Assignment of expr * expr
  | Conditional of { cond_exp : expr; then_exp : expr; else_exp : expr }
  | FunctionCall of { name : ident; args : expr list }
  | Comma of expr * expr
[@@deriving show]

let set_type e t = { e with typ = Some t }

let get_type e =
  match e.typ with
  | Some t -> t
  | None -> failwith "Internal error: expression not typed"

let untyped_expr e = { e; typ = None }

type stmt =
  | Return of expr
  | Expression of expr
  | If of { cond_exp : expr; then_smt : stmt; else_smt : stmt option }
  | Compound of block
  | Break of ident option
  | Continue of ident option
  | While of { cond : expr; body : stmt; id : ident option }
  | DoWhile of { body : stmt; cond : expr; id : ident option }
  | For of {
      init : for_init;
      cond : expr option;
      post : expr option;
      body : stmt;
      id : ident option;
    }
  | Switch of { cond : expr; body : stmt; id : ident option }
  | Case of { value : expr; body : stmt; id : ident option }
  | Default of { body : stmt; id : ident option }
  | Goto of ident
  | Label of ident * stmt
  | Null
[@@deriving show]

and decl = FunDecl of fun_decl | VarDecl of var_decl [@@deriving show]
and for_init = InclDecl of var_decl | InitExp of expr option [@@deriving show]
and block_item = S of stmt | D of decl [@@deriving show]
and block = Block of block_item list [@@deriving show]

and fun_decl = {
  name : ident;
  params : ident list;
  body : block option;
  fun_type : ctype;
  storage : storage_class option;
}
[@@deriving show]

and var_decl = {
  name : ident;
  init : expr option;
  var_type : ctype;
  storage : storage_class option;
}
[@@deriving show]

type prog = Program of decl list [@@deriving show]

type decl_specs = { spec_type : ctype; spec_storage : storage_class option }
[@@deriving show]

let extract_type types =
  match List.sort compare_ctype types with
  | [] -> failwith "No type specifier"
  | [ Int ] -> Int
  | [ Long ] | [ Int; Long ] -> Long
  | _ ->
      failwith
        ("Invalid type specifier: "
        ^ String.concat " " (List.map show_ctype types))

let extract_specifiers (sl : specifier list) : decl_specs =
  let types, storages =
    List.partition_map
      (function SpecType t -> Either.left t | SpecStorage s -> Either.right s)
      sl
  in

  let spec_storage =
    match storages with
    | [] -> None
    | [ s ] -> Some s
    | _ -> failwith "Invalid storage specifier"
  in
  { spec_type = extract_type types; spec_storage }

let mk_prog f = Program f

let mk_func_defn specs name params body =
  let ds = extract_specifiers specs in
  FunDecl
    {
      name;
      params = List.map snd params;
      body = Some (Block body);
      fun_type = FunType { params = List.map fst params; ret = ds.spec_type };
      storage = ds.spec_storage;
    }

let mk_func_decl specs name params =
  let ds = extract_specifiers specs in
  FunDecl
    {
      name;
      params = List.map snd params;
      body = None;
      fun_type = FunType { params = List.map fst params; ret = ds.spec_type };
      storage = ds.spec_storage;
    }

let mk_func_call e args =
  match e.e with
  | Var name -> untyped_expr (FunctionCall { name; args })
  | _ -> failwith "Called object is not a function"

let mk_ident i = Identifier i

let mk_int_const i =
  if Int64.compare i (Int64.of_int32 Int32.max_int) <= 0 then
    untyped_expr (Constant (ConstInt (Int64.to_int32 i)))
  else untyped_expr (Constant (ConstLong i))

let mk_long_const i = untyped_expr (Constant (ConstLong i))
let mk_var_expr i = untyped_expr (Var i)
let mk_binop_expr op left right = untyped_expr (Binary { op; left; right })
let mk_unop_expr op exp = untyped_expr (Unary { op; exp })

let mk_assign_expr left right =
  match left.e with
  | Var _ -> untyped_expr (Assignment (left, right))
  | _ -> failwith "Can only assign to a variable"

let mk_cond_expr cond_exp then_exp else_exp =
  untyped_expr (Conditional { cond_exp; then_exp; else_exp })

let mk_comma_expr left right = untyped_expr (Comma (left, right))
let mk_return_stmt s = Return s
let mk_expr_stmt s = Expression s
let mk_if_stmt i t e = If { cond_exp = i; then_smt = t; else_smt = e }
let mk_block_stmt l = Compound (Block l)
let mk_while_stmt c b = While { cond = c; body = b; id = None }
let mk_dowhile_stmt b c = DoWhile { body = b; cond = c; id = None }
let mk_empty_init_exp = InitExp None
let mk_init_exp e = InitExp (Some e)

let mk_for_stmt i c p b =
  For { init = i; cond = c; post = p; body = b; id = None }

let mk_goto_stmt l = Goto l
let mk_label_stmt l s = Label (l, s)
let mk_switch_stmt e s = Switch { cond = e; body = s; id = None }
let mk_case_stmt e s = Case { value = e; body = s; id = None }
let mk_default_stmt s = Default { body = s; id = None }

let mk_decl_init_stmt specs i v =
  let ds = extract_specifiers specs in
  {
    name = i;
    init = Some v;
    var_type = ds.spec_type;
    storage = ds.spec_storage;
  }

let mk_decl_stmt specs i =
  let ds = extract_specifiers specs in
  { name = i; init = None; var_type = ds.spec_type; storage = ds.spec_storage }

let mk_stmt_block_item s = S s
let mk_decl_block_item d = D d

(** [mk_comp_assign_expr op left right] resolves compound ops by evaluating the
    binary expression [left] [op] [right], then assigning result to [left] *)
let mk_comp_assign_expr op left right =
  match left.e with
  | Var _ ->
      let result = mk_binop_expr op left right in
      untyped_expr (Assignment (left, result))
  | _ -> failwith "Can only compound assign to a variable"

let mk_unary_update_expr (op : unop) (exp : expr) =
  match exp.e with
  | Var _ -> mk_unop_expr op exp
  | _ -> failwith "Unary increment/decrement can only be applied to variables"

let mk_param types name = (extract_type types, name)

let mk_cast_expr types exp =
  untyped_expr (Cast { target_type = extract_type types; exp })

let literal_to_int l =
  match l.e with
  | Constant (ConstInt i) -> Int32.to_int i
  | Constant (ConstLong _) -> failwith "Not implemented"
  | _ -> failwith "Expected constant"
