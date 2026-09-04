    .globl      main
    .text
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $5, -4(%rbp)
    movl        $1, -8(%rbp)
    cmpl        $0, -8(%rbp)
    je          .Lmain.if.en.1
    movl        $1, -12(%rbp)
    movl        -12(%rbp), %r10d
    movl        %r10d, -4(%rbp)
.Lmain.if.en.1:
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .section    .note.GNU-stack,"",@progbits
