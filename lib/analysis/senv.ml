(** ------------------------------------------------------------------------
    Symbol environment
    ------------------------------------------------------------------------
    Handles semantic scoping of identifiers and labels at the AST level. Each
    entry in [ident_stack] and [label_stack] represents one lexical scope. New
    blocks or functions push a new scope; leaving them pops it. *)

type ident_entry = {
  unique : string;
  has_linkage : bool; (* extern or static(file-scope) *)
}

type t = {
  mutable counter : int;  (** Unique counter for generating names *)
  mutable ident_stack : (string, ident_entry) Hashtbl.t list;
  mutable label_stack : (string, string) Hashtbl.t list;
}

(** Create a new symbol environment with a single global scope *)
let make () : t =
  {
    counter = 0;
    ident_stack = [ Hashtbl.create 16 ];
    label_stack = [ Hashtbl.create 16 ];
  }

(** Push a new variable/function scope onto the stack *)
let push_ident_scope (se : t) =
  se.ident_stack <- Hashtbl.create 16 :: se.ident_stack

(** Pop the current variable/function scope *)
let pop_ident_scope (se : t) =
  match se.ident_stack with
  | [] -> failwith "no ident scope to pop"
  | _ :: rest -> se.ident_stack <- rest

(** Push a new label scope onto the stack *)
let push_label_scope (se : t) =
  se.label_stack <- Hashtbl.create 16 :: se.label_stack

(** Pop the current label scope *)
let pop_label_scope (se : t) =
  match se.label_stack with
  | [] -> failwith "no label scope to pop"
  | _ :: rest -> se.label_stack <- rest

(** Look up an identifier in the current (innermost) scope only. *)
let find_in_current_scope (se : t) (id : Ast.ident) =
  match se.ident_stack with
  | scope :: _ -> Hashtbl.find_opt scope (Util.ident_name id)
  | [] -> None

(** Declare a new variable in the current scope. Generates a unique name (e.g.
    "x.3"). Raises if the variable already exists in the same scope. *)
let declare_var (se : t) (id : Ast.ident) : Ast.ident =
  let name = Util.get_identifier_name id in
  let has_linkage = false in
  match se.ident_stack with
  | [] -> failwith "declare var: no active scope"
  | top_scope :: _ ->
      if Hashtbl.mem top_scope name then
        failwith ("variable " ^ name ^ " already declared in current scope");
      let unique = name ^ "." ^ string_of_int se.counter in
      se.counter <- se.counter + 1;
      Hashtbl.add top_scope name { unique; has_linkage };
      Identifier unique

(** Declare a new file scope variable. These always have linkage (true). *)
let declare_var_fscope (se : t) (id : Ast.ident) : Ast.ident =
  let name = Util.get_identifier_name id in
  let has_linkage = true in
  let entry = { unique = name; has_linkage } in
  match se.ident_stack with
  | [] -> failwith "declare_var_fscope: no scope"
  | top_scope :: _ ->
      (match Hashtbl.find_opt top_scope name with
      | Some prev when not prev.has_linkage ->
          failwith ("conflicting file-scope declaration of " ^ name)
      | _ -> ());
      Hashtbl.replace top_scope name entry;
      Ast.Identifier name

(** Declare a new function in the current scope. Functions have linkage (true).
    Raises if a function with the same name already exists in the current scope
    and does not have linkage. *)
let declare_fun (se : t) (id : Ast.ident) : Ast.ident =
  let name = Util.get_identifier_name id in
  let has_linkage = true in
  match se.ident_stack with
  | [] -> failwith "declare fun: no active scope"
  | top_scope :: _ -> (
      match Hashtbl.find_opt top_scope name with
      | Some { has_linkage = false; _ } ->
          failwith ("function " ^ name ^ " already declared in current scope")
      | Some _ | None ->
          Hashtbl.add top_scope name { unique = name; has_linkage };
          Identifier name)

(** Resolve a variable by searching from innermost to outermost scope. Raises if
    the variable is not found. *)
let resolve_var (se : t) (id : Ast.ident) : Ast.ident =
  let name = Util.get_identifier_name id in
  let rec find = function
    | [] -> failwith ("variable " ^ name ^ " is not defined")
    | scope :: rest -> (
        match Hashtbl.find_opt scope name with
        | Some { unique; _ } -> Ast.Identifier unique
        | None -> find rest)
  in
  find se.ident_stack

(** Resolve a function by searching from innermost to outermost scope. Raises if
    the function is not found. *)
let resolve_fun (se : t) (id : Ast.ident) : Ast.ident =
  let name = Util.get_identifier_name id in
  let rec find = function
    | [] -> failwith ("function " ^ name ^ " is not defined")
    | scope :: rest -> (
        match Hashtbl.find_opt scope name with
        | Some { unique; _ } -> Ast.Identifier unique
        | None -> find rest)
  in
  find se.ident_stack

(** Declare a label in the current scope. Labels must be unique within the same
    scope. *)
let declare_lab (se : t) (id : Ast.ident) : Ast.ident =
  let name = Util.get_identifier_name id in
  match se.label_stack with
  | [] -> failwith "declare lab: no active scope"
  | top_scope :: _ ->
      if Hashtbl.mem top_scope name then
        failwith ("label " ^ name ^ " already declared in current scope");
      let unique = name ^ "." ^ string_of_int se.counter in
      se.counter <- se.counter + 1;
      Hashtbl.add top_scope name unique;
      GotoLabel unique

(** Resolve a label by searching outward through the label stack. Raises if the
    label is not found. *)
let resolve_lab (se : t) (id : Ast.ident) : Ast.ident =
  let name = Util.get_identifier_name id in
  let rec find = function
    | [] -> failwith ("label " ^ name ^ " is not defined")
    | scope :: rest -> (
        match Hashtbl.find_opt scope name with
        | Some unique -> Ast.GotoLabel unique
        | None -> find rest)
  in
  find se.label_stack
