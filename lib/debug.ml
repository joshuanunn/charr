(** Global debug handling *)

let enabled = ref false
let enable () = enabled := true
let log thunk = if !enabled then thunk ()
let logf fmt = if !enabled then Format.eprintf fmt
