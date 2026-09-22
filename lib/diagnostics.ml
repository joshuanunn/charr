exception Error of Location.t * string

let fail lexbuf msg = raise (Error (Location.of_lexbuf lexbuf, msg))
