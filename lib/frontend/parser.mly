%{
let mk_func_defn specs name params body =
  let ds = Ast.extract_specifiers specs in
  Ast.FunDecl
    {
      name;
      params = List.map snd params;
      body = Some (Ast.Block body);
      fun_type = Ctype.FunType { params = List.map fst params; ret = ds.spec_type };
      storage = ds.spec_storage;
    }

let mk_func_decl specs name params =
  let ds = Ast.extract_specifiers specs in
  Ast.FunDecl
    {
      name;
      params = List.map snd params;
      body = None;
      fun_type = Ctype.FunType { params = List.map fst params; ret = ds.spec_type };
      storage = ds.spec_storage;
    }

let mk_decl_init_stmt specs i v : Ast.var_decl =
  let ds = Ast.extract_specifiers specs in
  {
    name = i;
    init = Some v;
    var_type = ds.spec_type;
    storage = ds.spec_storage;
  }

let mk_decl_stmt specs i : Ast.var_decl =
  let ds = Ast.extract_specifiers specs in
  { name = i; init = None; var_type = ds.spec_type; storage = ds.spec_storage }

let mk_func_call (e : Ast.expr) args =
  match e.e with
  | Ast.Var name -> Ast.untyped_expr (Ast.FunctionCall { name; args })
  | _ -> failwith "Called object is not a function"

let mk_return_stmt s = Ast.Return s
let mk_expr_stmt s = Ast.Expression s
let mk_if_stmt i t e = Ast.If { cond_exp = i; then_smt = t; else_smt = e }
let mk_block_stmt l = Ast.Compound (Block l)
let mk_while_stmt c b = Ast.While { cond = c; body = b; id = None }
let mk_dowhile_stmt b c = Ast.DoWhile { body = b; cond = c; id = None }

let mk_for_stmt i c p b =
  Ast.For { init = i; cond = c; post = p; body = b; id = None }

let mk_goto_stmt l = Ast.Goto l
let mk_label_stmt l s = Ast.Label (l, s)
let mk_switch_stmt e s = Ast.Switch { cond = e; body = s; id = None }
let mk_case_stmt e s = Ast.Case { value = e; body = s; id = None }
let mk_default_stmt s = Ast.Default { body = s; id = None }

let mk_param types name = (Ast.extract_type types, name)

let mk_cast_expr types exp =
  Ast.untyped_expr (Ast.Cast { target_type = Ast.extract_type types; exp })

let mk_binop_expr op left right = Ast.untyped_expr (Ast.Binary { op; left; right })
let mk_unop_expr op exp = Ast.untyped_expr (Ast.Unary { op; exp })
let mk_cond_expr cond_exp then_exp else_exp =
  Ast.untyped_expr (Ast.Conditional { cond_exp; then_exp; else_exp })
let mk_comma_expr left right = Ast.untyped_expr (Ast.Comma (left, right))
let mk_empty_init_exp = Ast.InitExp None
let mk_init_exp e = Ast.InitExp (Some e)

let mk_comp_assign_expr op (left : Ast.expr) (right : Ast.expr) =
  match left.e with
  | Ast.Var _ ->
      let result = mk_binop_expr op left right in
      Ast.untyped_expr (Ast.Assignment (left, result))
  | _ -> failwith "Can only compound assign to a variable"

let mk_unary_update_expr (op : Ast.unop) (exp : Ast.expr) =
  match exp.e with
  | Ast.Var _ -> mk_unop_expr op exp
  | _ -> failwith "Unary increment/decrement can only be applied to variables"

let mk_assign_expr (left : Ast.expr) (right : Ast.expr) =
  match left.e with
  | Ast.Var _ -> Ast.untyped_expr (Ast.Assignment (left, right))
  | _ -> failwith "Can only assign to a variable"

let mk_var_expr i = Ast.untyped_expr (Ast.Var i)

let mk_int_const i = Ast.unsuffixed_int_const i
let mk_uint_const i = Ast.unsuffixed_uint_const i
let mk_long_const i = Ast.suffixed_long_const i
let mk_ulong_const i = Ast.suffixed_ulong_const i
%}

%token <string> IDENTIFIER
%token <int64> LITERAL_INT
%token <int64> LITERAL_UINT
%token <int64> LITERAL_LONG
%token <int64> LITERAL_ULONG
%token KW_STATIC
%token KW_EXTERN
%token KW_SIGNED
%token KW_UNSIGNED
%token KW_INT
%token KW_LONG
%token KW_VOID
%token KW_RETURN
%token KW_IF
%token KW_ELSE
%token KW_DO
%token KW_WHILE
%token KW_FOR
%token KW_BREAK
%token KW_CONTINUE
%token KW_SWITCH
%token KW_CASE
%token KW_DEFAULT
%token KW_GOTO
%token LPAREN
%token RPAREN
%token LBRACE
%token RBRACE
%token SEMICOLON
%token QUESTION
%token COLON
%token COMMA
%token INCREMENT
%token DECREMENT
%token ADD_ASSIGN
%token SUB_ASSIGN
%token MUL_ASSIGN
%token DIV_ASSIGN
%token MOD_ASSIGN
%token LSHIFT_ASSIGN
%token RSHIFT_ASSIGN
%token BW_AND_ASSIGN
%token BW_OR_ASSIGN
%token BW_XOR_ASSIGN
%token ADD
%token SUB
%token MUL
%token DIV
%token MOD
%token AND
%token OR
%token BW_LSHIFT
%token BW_RSHIFT
%token BW_NOT
%token BW_AND
%token BW_OR
%token BW_XOR
%token EQ
%token NE
%token LE
%token GE
%token LT
%token GT
%token NOT
%token ASSIGN
%token EOF

(* Resolve dangling else in if statements by prefering to shift else *)
%nonassoc IFX
%nonassoc KW_ELSE

%start <Ast.prog> prog

(* Type inference is fragile for optional lists, so declare upfront *)
%type <(Ctype.t * Ast.ident) list> param_list_opt
%type <Ast.expr list> arg_expr_list_opt

%%

prog:
  | decl_list EOF { Ast.Program $1 }
  ;

decl_list:
  | decl_list decl { $1 @ [$2] }
  | { [] }
  ;

type_specifier_list:
  | type_specifier_list type_specifier { $1 @ [$2] }
  | type_specifier { [$1] }
  ;

specifier_list:
  | specifier_list specifier { $1 @ [$2] }
  | specifier { [$1] }
  ;

type_specifier:
  | KW_INT { Ast.TSInt }
  | KW_LONG { Ast.TSLong }
  | KW_SIGNED { Ast.TSSigned }
  | KW_UNSIGNED { Ast.TSUnsigned }
  ;

specifier:
  | type_specifier { Ast.SpecType $1 }
  | KW_STATIC { Ast.SpecStorage Ast.Static }
  | KW_EXTERN { Ast.SpecStorage Ast.Extern }
  ;

param_list_opt:
  | /* empty */ { [] }
  | KW_VOID { [] }
  | param_list { $1 }
  ;

param_list:
  | param_decl { [$1] }
  | param_list COMMA param_decl { $1 @ [$3] }
  ;

param_decl:
  | type_specifier_list identifier { mk_param $1 $2 }
  ;

block:
  | LBRACE block_items RBRACE { $2 }
  ;

block_items:
  | block_items block_item { $1 @ [$2] }
  | { [] }
  ;

block_item:
  | decl { Ast.D $1 }
  | stmt { Ast.S $1 }
  ;

decl:
  | var_decl { Ast.VarDecl $1 }
  | fun_decl { $1 }
  ;

var_decl:
  | specifier_list identifier ASSIGN expr SEMICOLON { mk_decl_init_stmt $1 $2 $4 }
  | specifier_list identifier SEMICOLON { mk_decl_stmt $1 $2 }
  ;

fun_decl:
  | specifier_list identifier LPAREN param_list_opt RPAREN block { mk_func_defn $1 $2 $4 $6 }
  | specifier_list identifier LPAREN param_list_opt RPAREN SEMICOLON { mk_func_decl $1 $2 $4 }
  ;

for_init:
  | var_decl { Ast.InclDecl $1 }
  | expr SEMICOLON { mk_init_exp $1 }
  | SEMICOLON { mk_empty_init_exp }
  ;

stmt:
  | KW_RETURN expr SEMICOLON { mk_return_stmt $2 }
  | expr SEMICOLON { mk_expr_stmt $1 }
  | KW_IF LPAREN expr RPAREN stmt KW_ELSE stmt { mk_if_stmt $3 $5 (Some $7) }
  | KW_IF LPAREN expr RPAREN stmt %prec IFX { mk_if_stmt $3 $5 None }
  | block { mk_block_stmt $1 }
  | KW_BREAK SEMICOLON { Ast.Break None }
  | KW_CONTINUE SEMICOLON { Ast.Continue None }
  | KW_WHILE LPAREN expr RPAREN stmt { mk_while_stmt $3 $5 }
  | KW_DO stmt KW_WHILE LPAREN expr RPAREN SEMICOLON { mk_dowhile_stmt $2 $5 }
  | KW_FOR LPAREN for_init expr SEMICOLON expr RPAREN stmt { mk_for_stmt $3 (Some $4) (Some $6) $8 }
  | KW_FOR LPAREN for_init expr SEMICOLON RPAREN stmt { mk_for_stmt $3 (Some $4) None $7 }
  | KW_FOR LPAREN for_init SEMICOLON expr RPAREN stmt { mk_for_stmt $3 None (Some $5) $7 }
  | KW_FOR LPAREN for_init SEMICOLON RPAREN stmt { mk_for_stmt $3 None None $6 }
  | KW_SWITCH LPAREN expr RPAREN stmt { mk_switch_stmt $3 $5 }
  | KW_CASE expr COLON stmt { mk_case_stmt $2 $4 }
  | KW_DEFAULT COLON stmt { mk_default_stmt $3 }
  | KW_GOTO identifier SEMICOLON { mk_goto_stmt $2 }
  | identifier COLON stmt { mk_label_stmt $1 $3 }
  | SEMICOLON { Ast.Null }
  ;

(* Comma operator [left associative] *)
expr:
  | assignment_expr { $1 }
  | expr COMMA assignment_expr { mk_comma_expr $1 $3 }
  ;

(* Assignment operators [right associative] *)
assignment_expr:
  | conditional_expr { $1 }
  | unary_expr ASSIGN assignment_expr { mk_assign_expr $1 $3 }
  | unary_expr MUL_ASSIGN assignment_expr { mk_comp_assign_expr Ast.Multiply $1 $3 }
  | unary_expr DIV_ASSIGN assignment_expr { mk_comp_assign_expr Ast.Divide $1 $3 }
  | unary_expr MOD_ASSIGN assignment_expr { mk_comp_assign_expr Ast.Remainder $1 $3 }
  | unary_expr ADD_ASSIGN assignment_expr { mk_comp_assign_expr Ast.Add $1 $3 }
  | unary_expr SUB_ASSIGN assignment_expr { mk_comp_assign_expr Ast.Subtract $1 $3 }
  | unary_expr LSHIFT_ASSIGN assignment_expr { mk_comp_assign_expr Ast.BwLeftShift $1 $3 }
  | unary_expr RSHIFT_ASSIGN assignment_expr { mk_comp_assign_expr Ast.BwRightShift $1 $3 }
  | unary_expr BW_AND_ASSIGN assignment_expr { mk_comp_assign_expr Ast.BwAnd $1 $3 }
  | unary_expr BW_XOR_ASSIGN assignment_expr { mk_comp_assign_expr Ast.BwXor $1 $3 }
  | unary_expr BW_OR_ASSIGN assignment_expr { mk_comp_assign_expr Ast.BwOr $1 $3 }
  ;

(* Ternary operators [right associative] *)
conditional_expr:
  | logical_or_expr { $1 }
  | logical_or_expr QUESTION expr COLON conditional_expr { mk_cond_expr $1 $3 $5 }
  ;

(* Logical OR operator [left associative] *)
logical_or_expr:
  | logical_and_expr { $1 }
  | logical_or_expr OR logical_and_expr { mk_binop_expr Ast.Or $1 $3 }
  ;

(* Logical AND operator [left associative] *)
logical_and_expr:
  | inclusive_or_expr { $1 }
  | logical_and_expr AND inclusive_or_expr { mk_binop_expr Ast.And $1 $3 }
  ;

(* Bitwise OR operator [left associative] *)
inclusive_or_expr:
  | exclusive_or_expr { $1 }
  | inclusive_or_expr BW_OR exclusive_or_expr { mk_binop_expr Ast.BwOr $1 $3 }
  ;

(* Bitwise XOR operator [left associative] *)
exclusive_or_expr:
  | and_expr { $1 }
  | exclusive_or_expr BW_XOR and_expr { mk_binop_expr Ast.BwXor $1 $3 }
  ;

(* Bitwise AND operator [left associative] *)
and_expr:
  | equality_expr { $1 }
  | and_expr BW_AND equality_expr { mk_binop_expr Ast.BwAnd $1 $3 }
  ;

(* Relational equality operators [left associative] *)
equality_expr:
  | relational_expr { $1 }
  | equality_expr EQ relational_expr { mk_binop_expr Ast.Equal $1 $3 }
  | equality_expr NE relational_expr { mk_binop_expr Ast.NotEqual $1 $3 }
  ;

(* Relational operators [left associative] *)
relational_expr:
  | shift_expr { $1 }
  | relational_expr LT shift_expr { mk_binop_expr Ast.LessThan $1 $3 }
  | relational_expr GT shift_expr { mk_binop_expr Ast.GreaterThan $1 $3 }
  | relational_expr LE shift_expr { mk_binop_expr Ast.LessOrEqual $1 $3 }
  | relational_expr GE shift_expr { mk_binop_expr Ast.GreaterOrEqual $1 $3 }
  ;

(* Bitwise shift operators [left associative] *)
shift_expr:
  | additive_expr { $1 }
  | shift_expr BW_LSHIFT additive_expr { mk_binop_expr Ast.BwLeftShift $1 $3 }
  | shift_expr BW_RSHIFT additive_expr { mk_binop_expr Ast.BwRightShift $1 $3 }
  ;

(* Additive binary operators [left associative] *)
additive_expr:
  | multiplicative_expr { $1 }
  | additive_expr ADD multiplicative_expr { mk_binop_expr Ast.Add $1 $3 }
  | additive_expr SUB multiplicative_expr { mk_binop_expr Ast.Subtract $1 $3 }
  ;

(* Multiplicative binary operators [left associative] *)
multiplicative_expr:
  | cast_expr { $1 }
  | multiplicative_expr MUL cast_expr { mk_binop_expr Ast.Multiply $1 $3 }
  | multiplicative_expr DIV cast_expr { mk_binop_expr Ast.Divide $1 $3 }
  | multiplicative_expr MOD cast_expr { mk_binop_expr Ast.Remainder $1 $3 }
  ;

(* Cast expression [right associative] *)
cast_expr:
  | unary_expr { $1 }
  | LPAREN type_specifier_list RPAREN cast_expr { mk_cast_expr $2 $4 }
  ;

(* Unary operators [right associative] *)
unary_expr:
  | postfix_expr { $1 }
  | INCREMENT unary_expr { mk_unary_update_expr Ast.PreIncrement $2 }
  | DECREMENT unary_expr { mk_unary_update_expr Ast.PreDecrement $2 }
  | SUB unary_expr { mk_unop_expr Ast.Negate $2 }
  | NOT unary_expr { mk_unop_expr Ast.Not $2 }
  | BW_NOT unary_expr { mk_unop_expr Ast.BwNot $2 }
  ;

arg_expr_list_opt:
  | /* empty */ { [] }
  | arg_expr_list { $1 }
  ;

arg_expr_list:
  | assignment_expr { [$1] }
  | arg_expr_list COMMA assignment_expr { $1 @ [$3] }
  ;

(* Postfix operators [left associative] *)
postfix_expr:
  | primary_expr { $1 }
  | postfix_expr LPAREN arg_expr_list_opt RPAREN { mk_func_call $1 $3 }
  | postfix_expr INCREMENT { mk_unary_update_expr Ast.PostIncrement $1 }
  | postfix_expr DECREMENT { mk_unary_update_expr Ast.PostDecrement $1 }
  ;

(* Literals, identifiers, parentheses *)
primary_expr:
  | identifier { mk_var_expr $1 }
  | constant { $1 }
  | LPAREN expr RPAREN { $2 }
  ;

identifier:
  | IDENTIFIER { Ast.Identifier $1 }
  ;

constant:
  | LITERAL_INT { mk_int_const $1 }
  | LITERAL_LONG { mk_long_const $1 }
  | LITERAL_UINT { mk_uint_const $1 }
  | LITERAL_ULONG { mk_ulong_const $1 }
  ;
