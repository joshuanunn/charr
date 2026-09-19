type storage_class = Static | Extern [@@deriving show]
type type_specifier = TSInt | TSLong | TSSigned | TSUnsigned [@@deriving show]

type specifier = SpecType of type_specifier | SpecStorage of storage_class
[@@deriving show]

type ident =
  | Identifier of string
  | GotoLabel of string
  | LoopLabel of string
  | SwitchLabel of string
  | CaseLabel of string
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

type expr = { e : expr_kind; typ : Ctype.t option }

and expr_kind =
  | Constant of Ctype.const
  | Var of ident
  | Cast of { target_type : Ctype.t; exp : expr }
  | Unary of { op : unop; exp : expr }
  | Binary of { op : binop; left : expr; right : expr }
  | Assignment of expr * expr
  | Conditional of { cond_exp : expr; then_exp : expr; else_exp : expr }
  | FunctionCall of { name : ident; args : expr list }
  | Comma of expr * expr
[@@deriving show]

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
  fun_type : Ctype.t;
  storage : storage_class option;
}
[@@deriving show]

and var_decl = {
  name : ident;
  init : expr option;
  var_type : Ctype.t;
  storage : storage_class option;
}
[@@deriving show]

type prog = Program of decl list [@@deriving show]

type decl_specs = { spec_type : Ctype.t; spec_storage : storage_class option }
[@@deriving show]

let typed_expr kind t = { e = kind; typ = Some t }
let untyped_expr e = { e; typ = None }
let set_type e t = { e with typ = Some t }

let get_type e =
  match e.typ with
  | Some t -> t
  | None -> failwith "Internal error: expression not typed"

let extract_type types =
  let width =
    match
      List.filter (function TSInt | TSLong -> true | _ -> false) types
    with
    | [] | [ TSInt ] -> Ctype.Int
    | [ TSLong; TSInt ] | [ TSInt; TSLong ] | [ TSLong ] -> Ctype.Long
    | _ -> failwith "Invalid type specifier: multiple type keywords"
  in
  let is_signed =
    match
      List.filter (function TSSigned | TSUnsigned -> true | _ -> false) types
    with
    | [] | [ TSSigned ] -> true
    | [ TSUnsigned ] -> false
    | _ -> failwith "Invalid type specifier: conflicting signed/unsigned"
  in
  match (width, is_signed) with
  | Ctype.Int, true -> Ctype.Int
  | Ctype.Int, false -> Ctype.UInt
  | Ctype.Long, true -> Ctype.Long
  | Ctype.Long, false -> Ctype.ULong
  | _ -> failwith "internal error: not able to determine type width"

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

(** Unsuffixed int literals: int if value fits else long. *)
let unsuffixed_int_const (i : int64) : expr =
  if Int64.compare i (Int64.of_int32 Int32.max_int) <= 0 then
    untyped_expr (Constant (Ctype.ConstInt (Int64.to_int32 i)))
  else untyped_expr (Constant (Ctype.ConstLong i))

(** u-suffixed int literals: unsigned int if value fits else unsigned long. *)
let unsuffixed_uint_const (i : int64) : expr =
  if Int64.unsigned_compare i Ctype.uint_max <= 0 then
    untyped_expr (Constant (Ctype.ConstUInt (Int64.to_int32 i)))
  else untyped_expr (Constant (Ctype.ConstULong i))

let suffixed_long_const (i : int64) : expr =
  untyped_expr (Constant (Ctype.ConstLong i))

let suffixed_ulong_const (i : int64) : expr =
  untyped_expr (Constant (Ctype.ConstULong i))

let literal_to_int64 l =
  match l.e with
  | Constant c -> Ctype.const_to_int64 c
  | _ -> failwith "Expected constant"

let identifier_name = function
  | Identifier name -> name
  | _ -> failwith "expected Identifier"
