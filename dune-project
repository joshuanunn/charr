(lang dune 3.20)

(using menhir 3.0)

(name charr)

(generate_opam_files true)

(source
 (github joshuanunn/charr))

(authors "Joshua Nunn <gh@joshua.nu>")

(maintainers "Joshua Nunn <gh@joshua.nu>")

(license MIT)

(formatting
 (enabled_for ocaml))

(package
 (name charr)
 (synopsis "A compiler for a large subset of C, targeting x86-64 assembly")
 (description
  "charr is a compiler for a large subset of the C programming language, \
   written in OCaml. It compiles C source to x86-64 assembly through a \
   multi-stage pipeline: lexing, parsing, semantic analysis and type \
   checking, a three-address intermediate representation, and code \
   generation. It also includes optimisation passes comprising constant \
   folding, copy propagation, dead store elimination, and unreachable \
   code elimination. Inspired by Nora Sandler's book Writing a C Compiler.")
 (depends
  (ocaml
   (>= 4.14.0))
  ocamlformat
  dune
  menhir
  ppx_deriving
  ppx_expect
  ppx_inline_test))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/reference/dune-project/index.html
