(* Rules defined in "usual arithmetic conversions" from the C standard *)
let get_common_type type1 type2 =
  if Ctype.compare type1 type2 = 0 then type1 else Ctype.Long

let convert_to e t =
  if Ctype.compare (Ast.get_type e) t = 0 then e
  else Ast.typed_expr (Ast.Cast { target_type = t; exp = e }) t

(** Type check a file-scope variable declaration.

    Enforces C rules for external and internal linkage, constant initialisers,
    tentative definitions, and conflicting redeclarations. Updates the type
    environment with storage and initialisation information. *)
let rec type_fscope_var_decl (v : Ast.var_decl) (te : Env.tenv) : Ast.var_decl =
  let storage = v.storage in
  let init = v.init in
  let init_val =
    match init with
    | Some { e = Ast.Constant c; _ } -> (
        match Ctype.const_convert v.var_type c with
        | ConstInt i -> Env.Initial (Env.IntInit i)
        | ConstLong l -> Env.Initial (Env.LongInit l))
    | None -> (
        match storage with
        | Some Extern -> Env.NoInitialiser
        | _ -> Env.Tentative)
    | Some _ -> failwith "non-constant initialiser!"
  in

  let global = storage <> Some Static in

  match Env.find te v.name with
  | None ->
      Env.add te v.name
        {
          c_type = v.var_type;
          attrs = Env.StaticAttr { init = init_val; global };
        };
      v
  | Some { c_type; attrs = Env.StaticAttr old } ->
      (* Check that the type of a redeclaration has not changed *)
      if c_type <> v.var_type then
        failwith "conflicting filescope variable declarations";

      (* linkage reconciliation *)
      let global =
        if storage = Some Extern then old.global
        else if old.global <> global then
          failwith "conflicting variable linkage"
        else global
      in

      (* initialiser reconciliation *)
      let init =
        match (old.init, init_val) with
        | Env.Initial _, Env.Initial _ ->
            failwith "conflicting file scope variable definitions"
        | Env.Initial _, _ -> old.init
        | _, Env.Initial _ -> init_val
        | Env.Tentative, Env.Tentative -> Env.Tentative
        | Env.NoInitialiser, Env.Tentative | Env.Tentative, Env.NoInitialiser ->
            Env.Tentative
        | Env.NoInitialiser, Env.NoInitialiser -> Env.NoInitialiser
      in

      Env.replace te v.name
        { c_type = v.var_type; attrs = Env.StaticAttr { init; global } };
      v
  | Some _ -> failwith "identifier redeclared with incompatible kind"

(** Type check a block-scope variable declaration.

    Handles [extern], [static], and automatic variables, enforcing initialiser
    rules and updating the type environment accordingly. *)
and type_local_var_decl (v : Ast.var_decl) (te : Env.tenv) : Ast.var_decl =
  match v.storage with
  (* extern local variable *)
  | Some Extern ->
      if v.init <> None then
        failwith "initialiser on local extern variable declaration";

      begin match Env.find te v.name with
      | Some { c_type; _ } ->
          if c_type <> v.var_type then
            failwith "conflicting local variable declarations";
          v
      | None ->
          Env.add te v.name
            {
              c_type = v.var_type;
              attrs = Env.StaticAttr { init = Env.NoInitialiser; global = true };
            };
          v
      end
  (* static local variable *)
  | Some Static ->
      let init =
        match v.init with
        | None -> (
            match v.var_type with
            | Ctype.Int -> Env.Initial (Env.IntInit 0l)
            | Ctype.Long -> Env.Initial (Env.LongInit 0L)
            | Ctype.FunType _ ->
                failwith "internal error: variable with function type")
        | Some { e = Ast.Constant c; _ } -> (
            match Ctype.const_convert v.var_type c with
            | ConstInt i -> Env.Initial (Env.IntInit i)
            | ConstLong l -> Env.Initial (Env.LongInit l))
        | Some _ -> failwith "non-constant initialiser on local static variable"
      in
      Env.add te v.name
        { c_type = v.var_type; attrs = Env.StaticAttr { init; global = false } };
      v
  (* automatic local variable *)
  | None ->
      Env.add te v.name { c_type = v.var_type; attrs = Env.LocalAttr };
      (* typecheck initialiser AFTER declaration *)
      let init =
        Option.map (fun e -> convert_to (type_expr e te) v.var_type) v.init
      in
      { v with init }

(** Type check a function parameter declaration.

    Adds the parameter as a local variable to the current type environment and
    rejects duplicate parameter names. *)
and type_param_decl (id : Ast.ident) (t : Ctype.t) (te : Env.tenv) : unit =
  match Env.find te id with
  | Some _ -> failwith "duplicate parameter name"
  | None -> Env.add te id { c_type = t; attrs = Env.LocalAttr }

(** Type check a [for] loop initialiser.

    Validates either a variable declaration (without storage-class specifiers)
    or an optional initialisation expression. *)
and type_for_init (i : Ast.for_init) (te : Env.tenv) : Ast.for_init =
  match i with
  | InclDecl decl ->
      if decl.storage <> None then
        failwith "storage-class specifiers cannot be used in for-loop headers";
      InclDecl (type_local_var_decl decl te)
  | InitExp e -> InitExp (type_opt_expr e te)

(** Type check a function declaration or definition.

    Validates consistency with any previous declarations and records function
    type, linkage, and definition status in the type environment. *)
and type_fun_decl (f : Ast.fun_decl) (te : Env.tenv) : Ast.fun_decl =
  let has_body = Option.is_some f.body in
  let fun_type = f.fun_type in
  let global = f.storage <> Some Static in

  let defined, global =
    match Env.find te f.name with
    | None -> (has_body, global)
    | Some { c_type; attrs = FunAttr a } ->
        if c_type <> fun_type then failwith "incompatible function declarations";
        if a.defined && has_body then failwith "function defined more than once";
        if a.global && f.storage = Some Static then
          failwith "static function declaration follows non-static";
        (a.defined || has_body, a.global)
    | Some _ -> failwith "variable redeclared as function"
  in
  Env.replace te f.name
    { c_type = fun_type; attrs = FunAttr { defined; global } };
  f

(** Type check an expression for correctness.

    Ensures variables and functions are used consistently with their declared
    types and recursively checks all subexpressions. *)
and type_expr (e : Ast.expr) (te : Env.tenv) : Ast.expr =
  match e.e with
  | Constant c -> (
      match c with
      | Ctype.ConstInt _ -> Ast.set_type e Ctype.Int
      | Ctype.ConstLong _ -> Ast.set_type e Ctype.Long)
  | Var v -> (
      match Env.find te v with
      | Some { c_type = Ctype.FunType _; _ } ->
          failwith "Function name used as a variable"
      | Some { c_type; _ } -> Ast.set_type e c_type
      | None -> failwith "internal error: variable not in symbol table")
  | Cast { target_type; exp } ->
      let typed_inner = type_expr exp te in
      let cast_exp = Ast.Cast { target_type; exp = typed_inner } in
      Ast.typed_expr cast_exp target_type
  | Unary { op; exp } -> (
      let typed_inner = type_expr exp te in
      let unary_exp = Ast.Unary { op; exp = typed_inner } in
      match op with
      | Not -> Ast.typed_expr unary_exp Ctype.Int
      | _ -> Ast.typed_expr unary_exp (Ast.get_type typed_inner))
  | Binary { op; left; right } -> (
      let typed_left = type_expr left te in
      let typed_right = type_expr right te in
      let binary l r t =
        Ast.typed_expr (Ast.Binary { op; left = l; right = r }) t
      in
      match op with
      | And | Or -> binary typed_left typed_right Ctype.Int
      | BwLeftShift | BwRightShift ->
          (* shifts retain left's type *)
          binary typed_left typed_right (Ast.get_type typed_left)
      | _ ->
          let common_type =
            get_common_type (Ast.get_type typed_left) (Ast.get_type typed_right)
          in
          let converted_left = convert_to typed_left common_type in
          let converted_right = convert_to typed_right common_type in
          let result =
            match op with
            | Add | Subtract | Multiply | Divide | Remainder -> common_type
            | _ -> Ctype.Int (* comparisons *)
          in
          binary converted_left converted_right result)
  | Assignment (lvalue, rvalue) -> (
      match lvalue.e with
      | Var _ ->
          let typed_lvalue = type_expr lvalue te in
          let typed_rvalue = type_expr rvalue te in
          let converted_rvalue =
            convert_to typed_rvalue (Ast.get_type typed_lvalue)
          in
          let assign_exp = Ast.Assignment (typed_lvalue, converted_rvalue) in
          Ast.typed_expr assign_exp (Ast.get_type typed_lvalue)
      | _ -> failwith "lvalues in assignments must be variables")
  | Conditional { cond_exp; then_exp; else_exp } ->
      let typed_cond = type_expr cond_exp te in
      let typed_then = type_expr then_exp te in
      let typed_else = type_expr else_exp te in
      let common_type =
        get_common_type (Ast.get_type typed_then) (Ast.get_type typed_else)
      in
      let converted_then = convert_to typed_then common_type in
      let converted_else = convert_to typed_else common_type in
      Ast.typed_expr
        (Ast.Conditional
           {
             cond_exp = typed_cond;
             then_exp = converted_then;
             else_exp = converted_else;
           })
        common_type
  | FunctionCall { name; args } -> (
      match Env.find te name with
      | Some { c_type = Ctype.FunType { params; ret }; _ } ->
          if List.length params <> List.length args then
            failwith "function called with the wrong number of arguments";
          let converted_args =
            List.map2 (fun arg t -> convert_to (type_expr arg te) t) args params
          in
          Ast.typed_expr (Ast.FunctionCall { name; args = converted_args }) ret
      | Some _ -> failwith "variable used as function name"
      | None -> failwith "internal error: function not in symbol table")
  | Comma (left, right) ->
      let typed_left = type_expr left te in
      let typed_right = type_expr right te in
      Ast.typed_expr
        (Ast.Comma (typed_left, typed_right))
        (Ast.get_type typed_right)

(** Type check an optional expression, if present. *)
and type_opt_expr (e : Ast.expr option) (te : Env.tenv) : Ast.expr option =
  Option.map (fun exp -> type_expr exp te) e

(** Type check a statement.

    Recursively validates all expressions and nested statements contained within
    the statement. *)
and type_stmt (s : Ast.stmt) (ret : Ctype.t) (swt : Ctype.t option)
    (te : Env.tenv) : Ast.stmt =
  match s with
  | Return expr ->
      (* Function return values are implicitly converted to return type *)
      Ast.Return (convert_to (type_expr expr te) ret)
  | Expression expr -> Expression (type_expr expr te)
  | If { cond_exp; then_smt; else_smt = None } ->
      let cond_exp' = type_expr cond_exp te in
      let then_smt' = type_stmt then_smt ret swt te in
      Ast.If { cond_exp = cond_exp'; then_smt = then_smt'; else_smt = None }
  | If { cond_exp; then_smt; else_smt = Some stmt } ->
      let cond_exp' = type_expr cond_exp te in
      let then_smt' = type_stmt then_smt ret swt te in
      let else_smt' = Some (type_stmt stmt ret swt te) in
      Ast.If
        { cond_exp = cond_exp'; then_smt = then_smt'; else_smt = else_smt' }
  | Compound b -> Ast.Compound (type_block b ret swt te)
  | Break _ -> s
  | Continue _ -> s
  | While { cond; body; id } ->
      let cond' = type_expr cond te in
      let body' = type_stmt body ret swt te in
      Ast.While { cond = cond'; body = body'; id }
  | DoWhile { body; cond; id } ->
      let body' = type_stmt body ret swt te in
      let cond' = type_expr cond te in
      Ast.DoWhile { body = body'; cond = cond'; id }
  | For { init; cond; post; body; id } ->
      let init' = type_for_init init te in
      let cond' = type_opt_expr cond te in
      let post' = type_opt_expr post te in
      let body' = type_stmt body ret swt te in
      Ast.For { init = init'; cond = cond'; post = post'; body = body'; id }
  | Switch { cond; body; id } ->
      let cond' = type_expr cond te in
      let switch_type = Some (Ast.get_type cond') in
      let body' = type_stmt body ret switch_type te in
      Ast.Switch { cond = cond'; body = body'; id }
  | Case { value = { e = Constant c; _ }; body; id } ->
      (* convert case values to the switch's controlling type *)
      let t =
        match swt with
        | Some t -> t
        | None -> failwith "case label outside of switch statement"
      in
      let value = Ast.typed_expr (Ast.Constant (Ctype.const_convert t c)) t in
      Ast.Case { value; body = type_stmt body ret swt te; id }
  | Case _ -> failwith "case label must be a constant integer expression"
  | Default { body; id } -> Ast.Default { body = type_stmt body ret swt te; id }
  | Goto _ -> s
  | Label (l, body) -> Ast.Label (l, type_stmt body ret swt te)
  | Null -> s

(** Type check a declaration.

    Dispatches to either file-scope or block-scope variable handling, or
    validates a function declaration. *)
and type_decl ~(file_scope : bool) (d : Ast.decl) (te : Env.tenv) : Ast.decl =
  match d with
  | VarDecl v ->
      Ast.VarDecl
        (if file_scope then type_fscope_var_decl v te
         else type_local_var_decl v te)
  | FunDecl f -> Ast.FunDecl (type_fun_decl f te)

(** Type check a function.

    Records the function declaration and, if a definition is present, type
    checks parameters and the function body. *)
and type_func (f : Ast.fun_decl) (te : Env.tenv) : Ast.fun_decl =
  let f = type_fun_decl f te in
  let param_types, ret =
    match f.fun_type with
    | Ctype.FunType { params; ret } -> (params, ret)
    | _ -> failwith "internal error: function without function type"
  in
  (* Only typecheck function parameters and body if a definition (done once) *)
  if Option.is_some f.body then
    List.iter2 (fun id t -> type_param_decl id t te) f.params param_types;
  let body = Option.map (fun b -> type_block b ret None te) f.body in
  { f with body }

(** Type check a block.

    Processes declarations and statements in sequence using the current type
    environment. *)
and type_block (b : Ast.block) (ret : Ctype.t) (swt : Ctype.t option)
    (te : Env.tenv) : Ast.block =
  let (Block item_list) = b in
  Ast.Block
    (List.map
       (function
         | Ast.D d -> Ast.D (type_decl ~file_scope:false d te)
         | Ast.S s -> Ast.S (type_stmt s ret swt te))
       item_list)

(** Type check an entire program.

    Processes all top-level declarations and function definitions using a shared
    global type environment. *)
and type_prog (Program p : Ast.prog) (te : Env.tenv) : Ast.prog =
  Ast.Program
    (List.map
       (function
         | Ast.FunDecl f -> Ast.FunDecl (type_func f te)
         | Ast.VarDecl v -> type_decl ~file_scope:true (Ast.VarDecl v) te)
       p)
