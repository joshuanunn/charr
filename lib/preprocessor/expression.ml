exception Error of string

type token =
  | PP_NOT
  | PP_AND
  | PP_OR
  | PP_LPAREN
  | PP_RPAREN
  | PP_DEFINED
  | PP_IDENTIFIER of string

let is_ident_start c =
  (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z') || c = '_'

let is_ident_char c = is_ident_start c || (c >= '0' && c <= '9')

let lex input =
  let len = String.length input in
  let tokens = ref [] in
  let pos = ref 0 in
  while !pos < len do
    match input.[!pos] with
    | ' ' | '\t' | '\r' | '\n' -> incr pos
    | '!' ->
        tokens := PP_NOT :: !tokens;
        incr pos
    | '(' ->
        tokens := PP_LPAREN :: !tokens;
        incr pos
    | ')' ->
        tokens := PP_RPAREN :: !tokens;
        incr pos
    | '&' ->
        if !pos + 1 < len && input.[!pos + 1] = '&' then (
          tokens := PP_AND :: !tokens;
          pos := !pos + 2)
        else raise (Error "preprocessor error: expected '&&'")
    | '|' ->
        if !pos + 1 < len && input.[!pos + 1] = '|' then (
          tokens := PP_OR :: !tokens;
          pos := !pos + 2)
        else raise (Error "preprocessor error: expected '||'")
    | c when is_ident_start c ->
        let start = !pos in
        while !pos < len && is_ident_char input.[!pos] do
          incr pos
        done;
        let word = String.sub input start (!pos - start) in
        tokens :=
          (if word = "defined" then PP_DEFINED else PP_IDENTIFIER word)
          :: !tokens
    | c ->
        raise
          (Error
             (Printf.sprintf
                "preprocessor error: unsupported character '%c' in #if/#elif \
                 expression"
                c))
  done;
  List.rev !tokens

let rec parse_or ~defined tokens =
  let result_1, rest = parse_and ~defined tokens in
  match rest with
  | PP_OR :: rest' ->
      let result_2, rest'' = parse_or ~defined rest' in
      (result_1 || result_2, rest'')
  | _ -> (result_1, rest)

and parse_and ~defined tokens =
  let result_1, rest = parse_unary ~defined tokens in
  match rest with
  | PP_AND :: rest' ->
      let result_2, rest'' = parse_and ~defined rest' in
      (result_1 && result_2, rest'')
  | _ -> (result_1, rest)

and parse_unary ~defined tokens =
  match tokens with
  | PP_NOT :: rest ->
      let result, rest' = parse_unary ~defined rest in
      (not result, rest')
  | PP_DEFINED :: PP_LPAREN :: PP_IDENTIFIER id :: PP_RPAREN :: rest ->
      (defined id, rest)
  | PP_DEFINED :: PP_IDENTIFIER id :: rest -> (defined id, rest)
  | PP_DEFINED :: _ ->
      raise (Error "preprocessor error: expected an identifier after 'defined'")
  | PP_LPAREN :: rest -> (
      let result, rest' = parse_or ~defined rest in
      match rest' with
      | PP_RPAREN :: rest'' -> (result, rest'')
      | _ ->
          raise
            (Error
               "preprocessor error: expected closing ')' in #if/#elif \
                expression"))
  | _ ->
      raise
        (Error
           "preprocessor error: unsupported operation in #if/#elif expression")

let eval ~defined s =
  match parse_or ~defined (lex s) with
  | result, [] -> result
  | _, _ :: _ ->
      raise
        (Error
           "preprocessor error: unexpected trailing tokens in #if/#elif \
            expression")
