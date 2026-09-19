(** ------------------------------------------------------------------------
    Type environment
    ------------------------------------------------------------------------
    Records type and storage information for resolved identifiers.

    This environment is populated during the type-checking pass, after name
    resolution has ensured that all identifiers are uniquely scoped. It is used
    to validate variable and function usage and to enforce C’s rules around
    linkage, storage duration, and definitions. *)

(** Initial value information for objects with static storage duration. *)
type initial_value =
  | Tentative  (** Tentative definition (no initialiser seen yet) *)
  | Initial of Ctype.static_init  (** Explicit constant initialiser *)
  | NoInitialiser  (** Declared without initialiser (e.g. extern) *)

(** Attributes associated with a typed identifier. *)
type identifier_attrs =
  | FunAttr of {
      defined : bool;  (** Whether a function body has been seen *)
      global : bool;  (** Whether the function has external linkage *)
    }
  | StaticAttr of {
      init : initial_value;  (** Static object initialiser state *)
      global : bool;  (** Whether the object has external linkage *)
    }
  | LocalAttr  (** Automatic storage duration (block-scope variable) *)

type type_entry = {
  c_type : Ctype.t;  (** The C type of the identifier *)
  attrs : identifier_attrs;  (** Storage, linkage, and definition metadata *)
}

type t = { typed_idents : (string, type_entry) Hashtbl.t }
(** Type information for identifiers and IR temporaries. Names must be globally
    unique within a translation unit. *)

let pp_initial_value fmt = function
  | Tentative -> Format.fprintf fmt "Tentative"
  | Initial init ->
      Format.fprintf fmt "Initial (%s)" (Ctype.show_static_init init)
  | NoInitialiser -> Format.fprintf fmt "NoInitialiser"

let pp_identifier_attrs fmt = function
  | FunAttr { defined; global } ->
      Format.fprintf fmt "FunAttr { defined = %b; global = %b }" defined global
  | StaticAttr { init; global } ->
      Format.fprintf fmt "StaticAttr { init = %a; global = %b }"
        pp_initial_value init global
  | LocalAttr -> Format.fprintf fmt "LocalAttr"

let pp_type_entry fmt (entry : type_entry) =
  Format.fprintf fmt "{ c_type = %s; attrs = %a }" (Ctype.show entry.c_type)
    pp_identifier_attrs entry.attrs

let pp_t fmt (te : t) =
  let entries =
    Hashtbl.fold (fun name entry acc -> (name, entry) :: acc) te.typed_idents []
    |> List.sort (fun (name1, _) (name2, _) -> String.compare name1 name2)
  in
  Format.fprintf fmt "@[<v>";
  Format.fprintf fmt "Tenv.t {@;<2 2>@[<v>";
  List.iteri
    (fun i (name, entry) ->
      if i > 0 then Format.fprintf fmt "@,";
      Format.fprintf fmt "%s -> %a" name pp_type_entry entry)
    entries;
  Format.fprintf fmt "@]@,}@]"

(** Pretty printer for t, as not fully supported by ppx_deriving show. *)
let show_t te = Format.asprintf "%a" pp_t te

(** Create a new type environment with an empty global scope *)
let make () : t = { typed_idents = Hashtbl.create 16 }

(** Look up a typed identifier in the environment. *)
let find (te : t) (id : Ast.ident) : type_entry option =
  Hashtbl.find_opt te.typed_idents (Ast.identifier_name id)

(** Add a new typed identifier to the environment. Assumes the identifier has
    not already been declared. *)
let add (te : t) (id : Ast.ident) (entry : type_entry) : unit =
  let name = Ast.identifier_name id in
  if Hashtbl.mem te.typed_idents name then
    failwith ("internal error: duplicate type entry for " ^ name);
  Hashtbl.add te.typed_idents name entry

(** Insert or update a typed identifier in the environment. *)
let replace (te : t) (id : Ast.ident) (entry : type_entry) : unit =
  Hashtbl.replace te.typed_idents (Ast.identifier_name id) entry

(** Determine whether a function has external linkage. Looks up the function
    [id] in the type environment and returns [true] if the function has external
    linkage (i.e. should be emitted as a global symbol), or [false] if it has
    internal linkage (declared [static]).*)
let fun_is_global (te : t) (id : Ast.ident) : bool =
  match find te id with
  | Some { attrs = FunAttr { global; _ }; _ } -> global
  | _ -> failwith "internal error: function not found in type environment"

(** Collect all static variables recorded in the type environment. Returns a
    list of triples [(name, init, global)] for each identifier with
    [StaticAttr]. Entries with other attributes are ignored. *)
let static_vars (te : t) : (string * bool * Ctype.t * initial_value) list =
  Hashtbl.fold
    (fun name entry acc ->
      match entry.attrs with
      | StaticAttr { init; global } -> (name, global, entry.c_type, init) :: acc
      | _ -> acc)
    te.typed_idents []

(** Return [true] if the identifier has static storage duration. *)
let is_static (te : t) (id : Ast.ident) : bool =
  match find te id with Some { attrs = StaticAttr _; _ } -> true | _ -> false

let is_static_name (te : t) (name : string) : bool =
  is_static te (Ast.Identifier name)
