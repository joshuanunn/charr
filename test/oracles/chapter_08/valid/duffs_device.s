    .globl      main
    .text
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $80, %rsp
    movl        $37, -4(%rbp)
    movl        $8, -8(%rbp)
    movl        -8(%rbp), %r10d
    movl        %r10d, -12(%rbp)
    movl        $2, -16(%rbp)
    cmpl        $0, -16(%rbp)
    movl        $0, -20(%rbp)
    sete        -20(%rbp)
    cmpl        $0, -20(%rbp)
    jne         .Lswit.cs.1.2
    cmpl        $4, -16(%rbp)
    movl        $0, -24(%rbp)
    sete        -24(%rbp)
    cmpl        $0, -24(%rbp)
    jne         .Lswit.cs.1.4
    cmpl        $3, -16(%rbp)
    movl        $0, -28(%rbp)
    sete        -28(%rbp)
    cmpl        $0, -28(%rbp)
    jne         .Lswit.cs.1.5
    cmpl        $2, -16(%rbp)
    movl        $0, -32(%rbp)
    sete        -32(%rbp)
    cmpl        $0, -32(%rbp)
    jne         .Lswit.cs.1.6
    cmpl        $1, -16(%rbp)
    movl        $0, -36(%rbp)
    sete        -36(%rbp)
    cmpl        $0, -36(%rbp)
    jne         .Lswit.cs.1.7
    jmp         .Lswit.br.1
.Lswit.cs.1.2:
.Lloop.st.3:
    movl        -4(%rbp), %r10d
    movl        %r10d, -40(%rbp)
    subl        $1, -40(%rbp)
    movl        -40(%rbp), %r10d
    movl        %r10d, -4(%rbp)
.Lswit.cs.1.4:
    movl        -4(%rbp), %r10d
    movl        %r10d, -44(%rbp)
    subl        $1, -44(%rbp)
    movl        -44(%rbp), %r10d
    movl        %r10d, -4(%rbp)
.Lswit.cs.1.5:
    movl        -4(%rbp), %r10d
    movl        %r10d, -48(%rbp)
    subl        $1, -48(%rbp)
    movl        -48(%rbp), %r10d
    movl        %r10d, -4(%rbp)
.Lswit.cs.1.6:
    movl        -4(%rbp), %r10d
    movl        %r10d, -52(%rbp)
    subl        $1, -52(%rbp)
    movl        -52(%rbp), %r10d
    movl        %r10d, -4(%rbp)
.Lswit.cs.1.7:
    movl        -4(%rbp), %r10d
    movl        %r10d, -56(%rbp)
    subl        $1, -56(%rbp)
    movl        -56(%rbp), %r10d
    movl        %r10d, -4(%rbp)
    movl        -12(%rbp), %r10d
    movl        %r10d, -60(%rbp)
    subl        $1, -60(%rbp)
    movl        -60(%rbp), %r10d
    movl        %r10d, -12(%rbp)
    cmpl        $0, -60(%rbp)
    movl        $0, -64(%rbp)
    setg        -64(%rbp)
    cmpl        $0, -64(%rbp)
    jne         .Lloop.st.3
.Lswit.br.1:
    cmpl        $0, -4(%rbp)
    movl        $0, -68(%rbp)
    sete        -68(%rbp)
    cmpl        $0, -68(%rbp)
    je          .Lmain.and.fl.18
    cmpl        $0, -12(%rbp)
    movl        $0, -72(%rbp)
    sete        -72(%rbp)
    cmpl        $0, -72(%rbp)
    je          .Lmain.and.fl.18
    movl        $1, -76(%rbp)
    jmp         .Lmain.and.en.19
.Lmain.and.fl.18:
    movl        $0, -76(%rbp)
.Lmain.and.en.19:
    movl        -76(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .section    .note.GNU-stack,"",@progbits
