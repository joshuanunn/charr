    .globl      main
    .text
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    movl        $0, -4(%rbp)
    movl        $0, -8(%rbp)
.Lloop.st.1:
    cmpl        $10, -8(%rbp)
    movl        $0, -12(%rbp)
    setl        -12(%rbp)
    cmpl        $0, -12(%rbp)
    je          .Lloop.br.1
    movl        -4(%rbp), %r10d
    movl        %r10d, -16(%rbp)
    movl        -8(%rbp), %r10d
    addl        %r10d, -16(%rbp)
    movl        -16(%rbp), %r10d
    movl        %r10d, -4(%rbp)
    movl        -8(%rbp), %r10d
    movl        %r10d, -20(%rbp)
    addl        $1, -20(%rbp)
    movl        -20(%rbp), %r10d
    movl        %r10d, -8(%rbp)
    jmp         .Lloop.st.1
.Lloop.br.1:
    cmpl        $45, -4(%rbp)
    movl        $0, -24(%rbp)
    sete        -24(%rbp)
    cmpl        $0, -24(%rbp)
    je          .Lmain.and.fl.6
    movl        $1, -28(%rbp)
    jmp         .Lmain.and.en.7
.Lmain.and.fl.6:
    movl        $0, -28(%rbp)
.Lmain.and.en.7:
    movl        -28(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .section    .note.GNU-stack,"",@progbits
