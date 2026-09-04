    .globl      main
    .text
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $64, %rsp
    movl        $3, -4(%rbp)
    movl        $10, -8(%rbp)
    movl        $2147483647, -12(%rbp)
    movl        $-2147483647, -16(%rbp)
    movl        -16(%rbp), %r10d
    movl        %r10d, -20(%rbp)
    cmpl        $0, zero(%rip)
    je          .Lmain.if.en.1
    movl        $3, %eax
    cdq
    movl        $0, %r10d
    idivl       %r10d
    movl        %edx, -24(%rbp)
    movl        -24(%rbp), %r10d
    movl        %r10d, -4(%rbp)
    movl        $10, %eax
    cdq
    movl        $0, %r10d
    idivl       %r10d
    movl        %eax, -28(%rbp)
    movl        -28(%rbp), %r10d
    movl        %r10d, -8(%rbp)
    movl        $-2147483639, -32(%rbp)
    movl        -32(%rbp), %r10d
    movl        %r10d, -12(%rbp)
    movl        -16(%rbp), %r10d
    movl        %r10d, -36(%rbp)
    subl        $10, -36(%rbp)
    movl        -36(%rbp), %r10d
    movl        %r10d, -20(%rbp)
.Lmain.if.en.1:
    cmpl        $3, -4(%rbp)
    movl        $0, -40(%rbp)
    setne       -40(%rbp)
    cmpl        $0, -40(%rbp)
    je          .Lmain.if.en.7
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lmain.if.en.7:
    cmpl        $10, -8(%rbp)
    movl        $0, -44(%rbp)
    setne       -44(%rbp)
    cmpl        $0, -44(%rbp)
    je          .Lmain.if.en.9
    movl        $2, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lmain.if.en.9:
    cmpl        $2147483647, -12(%rbp)
    movl        $0, -48(%rbp)
    setne       -48(%rbp)
    cmpl        $0, -48(%rbp)
    je          .Lmain.if.en.11
    movl        $3, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lmain.if.en.11:
    cmpl        $-2147483647, -20(%rbp)
    movl        $0, -52(%rbp)
    setne       -52(%rbp)
    cmpl        $0, -52(%rbp)
    je          .Lmain.if.en.14
    movl        $4, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lmain.if.en.14:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .bss
    .align      4
zero:
    .zero       4
    .section    .note.GNU-stack,"",@progbits
