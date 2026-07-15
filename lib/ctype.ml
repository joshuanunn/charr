type t = Int | Long | FunType of { params : t list; ret : t }
[@@deriving show, ord]

type const = ConstInt of int32 | ConstLong of int64 [@@deriving show]
