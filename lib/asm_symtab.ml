(** Backend symbol table built at the end of IR to assembly conversion, used by
    the remaining assembly-level passes. This table stores the assembly types,
    rather than C types. *)

type entry =
  | ObjEntry of { typ : Asm.assembly_type; is_static : bool }
  | FunEntry of { defined : bool }

type t = (string, entry) Hashtbl.t

let make () : t = Hashtbl.create 16

let add_obj (a_env : t) (name : string) (typ : Asm.assembly_type)
    (is_static : bool) : unit =
  Hashtbl.replace a_env name (ObjEntry { typ; is_static })

let add_fun (a_env : t) (name : string) (defined : bool) : unit =
  Hashtbl.replace a_env name (FunEntry { defined })

let find (a_env : t) (name : string) : entry option =
  Hashtbl.find_opt a_env name
