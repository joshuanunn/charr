    .globl      main
    .text
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $48, %rsp
    cmpl        $6, u(%rip)
    movl        $0, -4(%rbp)
    setne       -4(%rbp)
    cmpl        $0, -4(%rbp)
    je          .Lmain.if.en.1
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lmain.if.en.1:
    cmpq        $4, ul(%rip)
    movl        $0, -8(%rbp)
    setne       -8(%rbp)
    cmpl        $0, -8(%rbp)
    je          .Lmain.if.en.3
    movl        $2, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lmain.if.en.3:
    movl        $0, -12(%rbp)
    movl        $10, -16(%rbp)
.Lloop.st.1:
    cmpl        $-1, -16(%rbp)
    movl        $0, -20(%rbp)
    setb        -20(%rbp)
    cmpl        $0, -20(%rbp)
    je          .Lloop.br.1
    movl        -12(%rbp), %r10d
    movl        %r10d, -24(%rbp)
    addl        $1, -24(%rbp)
    movl        -24(%rbp), %r10d
    movl        %r10d, -12(%rbp)
    movl        $1, -28(%rbp)
    movl        -16(%rbp), %r10d
    movl        %r10d, -32(%rbp)
    movl        -28(%rbp), %r10d
    subl        %r10d, -32(%rbp)
    movl        -32(%rbp), %r10d
    movl        %r10d, -16(%rbp)
    jmp         .Lloop.st.1
.Lloop.br.1:
    cmpl        $11, -12(%rbp)
    movl        $0, -36(%rbp)
    setne       -36(%rbp)
    cmpl        $0, -36(%rbp)
    je          .Lmain.if.en.10
    movl        $3, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lmain.if.en.10:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .globl      ul
    .data
    .align      8
ul:
    .quad       4
    .globl      u
    .data
    .align      4
u:
    .long       6
    .section    .note.GNU-stack,"",@progbits
