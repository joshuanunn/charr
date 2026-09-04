    .globl      foo
    .text
foo:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        x.0(%rip), %r10d
    movl        %r10d, -4(%rbp)
    addl        $1, -4(%rbp)
    movl        -4(%rbp), %r10d
    movl        %r10d, x.0(%rip)
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .globl      main
    .text
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    movl        $0, -4(%rbp)
.Lloop.st.1:
    cmpl        $4, -4(%rbp)
    movl        $0, -8(%rbp)
    setl        -8(%rbp)
    cmpl        $0, -8(%rbp)
    je          .Lloop.br.1
    call        foo@PLT
    movl        %eax, -12(%rbp)
    movl        -12(%rbp), %r10d
    movl        %r10d, -16(%rbp)
    movl        -4(%rbp), %r10d
    movl        %r10d, -20(%rbp)
    addl        $1, -20(%rbp)
    movl        -20(%rbp), %r10d
    movl        %r10d, -4(%rbp)
    jmp         .Lloop.st.1
.Lloop.br.1:
    movl        -16(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .bss
    .align      4
x.0:
    .zero       4
    .section    .note.GNU-stack,"",@progbits
