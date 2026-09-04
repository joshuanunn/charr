    .globl      main
    .text
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    movl        $2, -4(%rbp)
    movl        $0, -8(%rbp)
.Lloop.st.3:
    cmpl        $10, -8(%rbp)
    movl        $0, -12(%rbp)
    setl        -12(%rbp)
    cmpl        $0, -12(%rbp)
    je          .Lloop.br.3
    movl        -4(%rbp), %r10d
    movl        %r10d, -16(%rbp)
    addl        $1, -16(%rbp)
    movl        -16(%rbp), %r10d
    movl        %r10d, -4(%rbp)
    movl        -8(%rbp), %r10d
    movl        %r10d, -20(%rbp)
    addl        $1, -20(%rbp)
    movl        -20(%rbp), %r10d
    movl        %r10d, -8(%rbp)
    jmp         .Lloop.st.3
.Lloop.br.3:
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .section    .note.GNU-stack,"",@progbits
