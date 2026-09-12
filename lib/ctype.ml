let uint_max = 0xFFFF_FFFFL

type t = Int | Long | UInt | ULong | FunType of { params : t list; ret : t }
[@@deriving show, ord, eq]

type const =
  | ConstInt of int32
  | ConstLong of int64
  | ConstUInt of int32
  | ConstULong of int64
[@@deriving show]

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
  | _ -> failwith "TODO"

let const_one = function
  | Int -> ConstInt 1l
  | Long -> ConstLong 1L
  | UInt -> ConstUInt 1l
  | ULong -> ConstULong 1L
  | FunType _ -> failwith "internal error: no unit constant for function type"

type static_init = IntInit of int32 | LongInit of int64 [@@deriving show]

let to_int64 = function
  | ConstInt i -> Int64.of_int32 i
  | ConstLong l -> l
  | ConstUInt i -> Int64.logand (Int64.of_int32 i) uint_max
  | ConstULong l -> l

let of_int64 t v =
  match t with
  | Int -> ConstInt (Int64.to_int32 v)
  | Long -> ConstLong v
  | UInt -> ConstUInt (Int64.to_int32 v)
  | ULong -> ConstULong v
  | FunType _ -> failwith "internal error: constant with function type"

let const_type = function
  | ConstInt _ -> Int
  | ConstLong _ -> Long
  | ConstUInt _ -> UInt
  | ConstULong _ -> ULong

let is_zero c = to_int64 c = 0L
