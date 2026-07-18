type t = Int | Long | FunType of { params : t list; ret : t }
[@@deriving show, ord]

type const = ConstInt of int32 | ConstLong of int64 [@@deriving show]

let const_convert (target : t) (c : const) : const =
  match (target, c) with
  | Int, ConstInt i -> ConstInt i
  | Int, ConstLong l ->
      ConstInt (Int64.to_int32 l)
      (* Ocaml applies modular wraparound as required *)
  | Long, ConstInt i -> ConstLong (Int64.of_int32 i)
  | Long, ConstLong l -> ConstLong l
  | FunType _, _ ->
      failwith "internal error: cannot convert constant to function type"
