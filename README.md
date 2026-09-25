<picture>
  <source media="(prefers-color-scheme: dark)" srcset="assets/charr-dark.svg">
  <img alt="charr" src="assets/charr-light.svg" width="200">
</picture>

A compiler for a large subset of the C programming language, implemented in OCaml. Inspired by the book [Writing a C Compiler](https://nostarch.com/writing-c-compiler), written by Nora Sandler.

## Supported C Language Features

### Types
- `int` and `long` integers
- `signed` and `unsigned` integer specifiers
- Implicit conversions between integer types
- Explicit casts, e.g. `(long)`, `(int)`

### Expressions & Operators
- Integer constants
- Unary operators: `-`, `~`
- Binary arithmetic operators: `+`, `-`, `*`, `/`, `%`
- Logical operators: `&&`, `||`, `!`
- Bitwise operators: `&`, `|`, `^`, `<<`, `>>`
- Relational operators: `==`, `!=`, `<`, `<=`, `>`, `>=`
- Conditional expressions: `a ? b : c`
- Comma operator

### Statements & Control Flow
- `return`
- `if` / `else`
- Compound statements (`{ ... }`)
- Loops: `for`, `while`, `do … while`
- `break` and `continue`
- `switch`, `case` and `default`
- `goto` and labelled statements

### Variables & Scope
- Local variable declarations
- Assignment: `=`
- Compound assignment: `+=`, `-=`, `*=`, `/=`, `%=`
- Bitwise compound assignment: `&=`, `|=`, `^=`, `<<=`, `>>=`
- Lexical scoping rules
- Semantic analysis for:
  - Undeclared variables
  - Invalid control-flow usage

### Functions
- Definition of functions beyond `main`
- Function calls
- Argument passing
- Return values
- Type checking for function calls
- System V x86-64 calling convention

### File Scope Declarations
- File-scope variables
- `extern` and `static` storage-class specifiers
- Correct handling of:
  - Linkage
  - Storage duration
- Code generation for global data

### Optimisation
- IR optimisations:
  - Constant folding
  - Dead store elimination
  - Unreachable code elimination
  - Copy propagation

## Preprocessor

Charr includes a C preprocessor, implemented in OCaml. This currently supports:
- Comment removal: `/* */` and `//`
- Command-line macro definitions with `-D`
- Conditional compilation: `#if`, `#ifdef`, `#ifndef`, `#elif`, `#else`, `#endif`
- Expression evaluation: `defined`, `!`, `&&`, `||`, `()`

## In Progress Features

### Types
- Floating-point (`double`)
- Pointers: `*`, `&`
- Arrays and pointer arithmetic
- Characters and strings
- `void`, `sizeof`, and dynamic memory allocation
- Structures (`struct`, `.`, `->`)

### Optimisation
- Register allocation
  - graph colouring
  - Register coalescing

### Preprocessor
- Macro expansion and function-like macros
- `#define`, `#undef`
- `#include`
- Full C preprocessor expression evaluation

## Unplanned Features

A line must be drawn somewhere, and it is therefore unlikely that the following important C language features will be implemented:
- Function pointers
- Variable-length argument lists
- `typedef`
- Type qualifiers like `const`

## Build and Installation

### Requirements

- Linux environment (WSL is fine)
- opam (>= 2.0)
- OCaml (via opam, >= 4.14)
- make
- GNU compiler suite (for C preprocessor and linker)

On Ubuntu, all requirements can be installed with `sudo apt install opam build-essential`

### Setup

It's recommended to create a new opam local switch in the project directory, which will install all required dependencies in an isolated environment:

```bash
git clone https://github.com/joshuanunn/charr.git
cd charr
opam switch create . -y
eval $(opam env)
opam install . --deps-only
make
```

### Testing

Check that the compiler executable works using `charr --help` or run the full regression test suite using `make test`.

## Compilation Overview

`charr` handles preprocessing and the source-to-assembly stages of compilation (highlighted); assembling and linking are delegated to the system toolchain.

```mermaid
flowchart LR
    src("C source<br/>.c")
    asm("Assembly<br/>.s")
    obj("Object<br/>.o")
    exe("Executable")

    src -->|charr| asm
    asm -->|Assembler| obj
    obj -->|Linker| exe

    classDef stage fill:#EFF2F4,stroke:#4A6273,stroke-width:1px,color:#2E3D48;
    classDef out fill:#FCEBE0,stroke:#E2622B,stroke-width:2px,color:#2E3D48;
    class obj,exe stage;
    class src,asm out;
    linkStyle 0 stroke:#E2622B,stroke-width:3px;
```

Within `charr`, preprocessing is followed by lexing, parsing, semantic analysis, IR generation, optimisation, and code generation:

```mermaid
flowchart LR
    src("C source<br/>.c")
    pp("Preprocessed<br/>source")
    tok("Tokens")
    ast("AST")
    vast("Validated<br/>AST")
    ir("IR")
    oir("Optimised<br/>IR")
    asm("Assembly<br/>.s")

    src --> pp --> tok --> ast --> vast --> ir --> oir --> asm

    classDef irc fill:#EFF2F4,stroke:#4A6273,stroke-width:1px,color:#2E3D48;
    classDef endpt fill:#FCEBE0,stroke:#E2622B,stroke-width:2.5px,color:#2E3D48;
    class src,asm endpt;
    class pp,tok,ast,vast,ir,oir irc;
    linkStyle default stroke:#E2622B,stroke-width:2.5px;
```

## License

This software is released under the MIT license [MIT](LICENSE). See [Third-party Content](#third-party-content) for details of third-party content that is not covered by this license.

## Third-party Content

This project includes third-party content that is not covered by this repository's MIT License:

- Test cases derived from [github.com/nlsandler/writing-a-c-compiler-tests](https://github.com/nlsandler/writing-a-c-compiler-tests), licensed under the MIT License. See [test/tests/LICENSE.third_party](test/tests/LICENSE.third_party) for details.
- Logo files `web/GitHub_Invertocat_Black.svg` and `web/GitHub_Invertocat_White.svg` are GitHub, Inc. trademarks/assets and are used as a link to this project's GitHub repository in accordance with [GitHub's brand guidelines](https://brand.github.com/foundations/logo).
