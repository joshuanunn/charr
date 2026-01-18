let int_of_bool (b : bool) : int = if b then 1 else 0

let fold_unop (op : Ir.unary_operator) (n : int) : int option =
  match op with
  | Negate -> Some (-n)
  | BwNot -> Some (lnot n)
  | Not -> Some (int_of_bool (n = 0))
  | PreIncrement | PreDecrement | PostIncrement | PostDecrement -> None

let fold_binop (op : Ir.binary_operator) (n1 : int) (n2 : int) : int option =
  match op with
  | Add -> Some (n1 + n2)
  | Subtract -> Some (n1 - n2)
  | Multiply -> Some (n1 * n2)
  | Divide -> if n2 = 0 then None else Some (n1 / n2)
  | Remainder -> if n2 = 0 then None else Some (n1 mod n2)
  | BwLeftShift -> Some (Int.shift_left n1 n2)
  | BwRightShift -> Some (Int.shift_right n1 n2)
  | BwAnd -> Some (n1 land n2)
  | BwXor -> Some (n1 lxor n2)
  | BwOr -> Some (n1 lor n2)
  | Equal -> Some (int_of_bool (n1 = n2))
  | NotEqual -> Some (int_of_bool (n1 <> n2))
  | LessOrEqual -> Some (int_of_bool (n1 <= n2))
  | GreaterOrEqual -> Some (int_of_bool (n1 >= n2))
  | LessThan -> Some (int_of_bool (n1 < n2))
  | GreaterThan -> Some (int_of_bool (n1 > n2))

let apply (i : Ir.instruction) : Ir.instruction option =
  match i with
  | Unary { op; src = Constant n; dst } -> (
      match fold_unop op n with
      | Some v -> Some (Copy { src = Constant v; dst })
      | None -> Some i)
  | Binary { op; src1 = Constant n1; src2 = Constant n2; dst } -> (
      match fold_binop op n1 n2 with
      | Some v -> Some (Copy { src = Constant v; dst })
      | None -> Some i)
  | JumpIfZero { condition = Constant 0; target } -> Some (Jump { target })
  | JumpIfZero { condition = Constant _; _ } -> None
  | JumpIfNotZero { condition = Constant 0; _ } -> None
  | JumpIfNotZero { condition = Constant _; target } -> Some (Jump { target })
  | ins -> Some ins
