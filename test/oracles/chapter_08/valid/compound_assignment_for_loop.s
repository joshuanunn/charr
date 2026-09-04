    .globl      main
    .text
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $-1, -4(%rbp)
.Lloop.st.1:
    cmpl        $-100, -4(%rbp)
    movl        $0, -8(%rbp)
    setge       -8(%rbp)
    cmpl        $0, -8(%rbp)
    je          .Lloop.br.1
    movl        -4(%rbp), %r10d
    movl        %r10d, -12(%rbp)
    subl        $3, -12(%rbp)
    movl        -12(%rbp), %r10d
    movl        %r10d, -4(%rbp)
    jmp         .Lloop.st.1
.Lloop.br.1:
    cmpl        $-103, -4(%rbp)
    movl        $0, -16(%rbp)
    sete        -16(%rbp)
    movl        -16(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .section    .note.GNU-stack,"",@progbits
