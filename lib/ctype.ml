type t = Int | Long | FunType of { params : t list; ret : t }
[@@deriving show, ord, eq]

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

let const_one = function
  | Int -> ConstInt 1l
  | Long -> ConstLong 1L
  | FunType _ -> failwith "internal error: no unit constant for function type"

type static_init = IntInit of int32 | LongInit of int64 [@@deriving show]

let to_int64 = function ConstInt i -> Int64.of_int32 i | ConstLong l -> l

let of_int64 t v =
  match t with
  | Int -> ConstInt (Int64.to_int32 v)
  | Long -> ConstLong v
  | FunType _ -> failwith "internal error: constant with function type"

let const_type = function ConstInt _ -> Int | ConstLong _ -> Long
let is_zero c = to_int64 c = 0L
