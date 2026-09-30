(** Common pretty printers for Ctype values. *)

let type_str (t : Charr.Ctype.t) =
  let rec go = function
    | Charr.Ctype.Int -> "int"
    | Charr.Ctype.Long -> "long"
    | Charr.Ctype.UInt -> "unsigned int"
    | Charr.Ctype.ULong -> "unsigned long"
    | Charr.Ctype.FunType { params; ret } ->
        "(" ^ String.concat ", " (List.map go params) ^ ") -> " ^ go ret
  in
  go t

let type_str_opt = function None -> None | Some t -> Some (type_str t)

let const_str (c : Charr.Ctype.const) =
  let v = Charr.Ctype.const_to_int64 c in
  match c with
  | Charr.Ctype.ConstInt _ -> Int64.to_string v
  | Charr.Ctype.ConstLong _ -> Int64.to_string v ^ "L"
  | Charr.Ctype.ConstUInt _ -> Int64.to_string v ^ "U"
  | Charr.Ctype.ConstULong _ -> Int64.to_string v ^ "UL"

let static_init_str : Charr.Ctype.static_init -> string = function
  | IntInit i -> Int32.to_string i
  | LongInit l -> Int64.to_string l ^ "L"
  | UIntInit i -> Printf.sprintf "%luU" i
  | ULongInit l -> Printf.sprintf "%LuUL" l
