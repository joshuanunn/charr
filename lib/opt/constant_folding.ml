let fold_unop (op : Ir.unary_operator) (c : Ctype.const) : Ctype.const option =
  let n = Ctype.to_int64 c in
  match op with
  | Negate -> Some (Ctype.of_int64 (Ctype.const_type c) (Int64.neg n))
  | BwNot -> Some (Ctype.of_int64 (Ctype.const_type c) (Int64.lognot n))
  | Not ->
      Some (Ctype.ConstInt (if n = 0L then 1l else 0l))
      (* Not always yields Int *)
  | PreIncrement | PreDecrement | PostIncrement | PostDecrement -> None

let fold_binop (op : Ir.binary_operator) (c1 : Ctype.const) (c2 : Ctype.const) :
    Ctype.const option =
  let n1, n2 = (Ctype.to_int64 c1, Ctype.to_int64 c2) in
  match op with
  | BwLeftShift ->
      Some
        (Ctype.of_int64 (Ctype.const_type c1)
           (Int64.shift_left n1 (Int64.to_int n2)))
  | BwRightShift ->
      Some
        (Ctype.of_int64 (Ctype.const_type c1)
           (Int64.shift_right n1 (Int64.to_int n2)))
  | Equal | NotEqual | LessOrEqual | GreaterOrEqual | LessThan | GreaterThan ->
      let b =
        match op with
        | Equal -> n1 = n2
        | NotEqual -> n1 <> n2
        | LessOrEqual -> n1 <= n2
        | GreaterOrEqual -> n1 >= n2
        | LessThan -> n1 < n2
        | GreaterThan -> n1 > n2
        | _ -> assert false
      in
      Some (Ctype.ConstInt (if b then 1l else 0l))
  | _ -> (
      let t = Ctype.const_type c1 in
      (* matches c2 by construction *)
      match op with
      | Add -> Some (Ctype.of_int64 t (Int64.add n1 n2))
      | Subtract -> Some (Ctype.of_int64 t (Int64.sub n1 n2))
      | Multiply -> Some (Ctype.of_int64 t (Int64.mul n1 n2))
      | Divide ->
          if n2 = 0L then None else Some (Ctype.of_int64 t (Int64.div n1 n2))
      | Remainder ->
          if n2 = 0L then None else Some (Ctype.of_int64 t (Int64.rem n1 n2))
      | BwAnd -> Some (Ctype.of_int64 t (Int64.logand n1 n2))
      | BwXor -> Some (Ctype.of_int64 t (Int64.logxor n1 n2))
      | BwOr -> Some (Ctype.of_int64 t (Int64.logor n1 n2))
      | _ -> assert false)

let apply (i : Ir.instruction) : Ir.instruction option =
  match i with
  | Unary { op; src = Constant c; dst } -> (
      match fold_unop op c with
      | Some v -> Some (Copy { src = Constant v; dst })
      | None -> Some i)
  | Binary { op; src1 = Constant c1; src2 = Constant c2; dst } -> (
      match fold_binop op c1 c2 with
      | Some v -> Some (Copy { src = Constant v; dst })
      | None -> Some i)
  | JumpIfZero { condition = Constant c; target } ->
      if Ctype.is_zero c then Some (Jump { target }) else None
  | JumpIfNotZero { condition = Constant c; target } ->
      if Ctype.is_zero c then None else Some (Jump { target })
  | SignExtend { src = Constant c; dst } ->
      Some (Copy { src = Constant (Ctype.const_convert Ctype.Long c); dst })
  | Truncate { src = Constant c; dst } ->
      Some (Copy { src = Constant (Ctype.const_convert Ctype.Int c); dst })
  | ins -> Some ins
