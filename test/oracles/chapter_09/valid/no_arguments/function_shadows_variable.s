    .globl      main
    .text
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $4, -4(%rbp)
    movl        $1, -8(%rbp)
    cmpl        $0, -8(%rbp)
    je          .Lmain.if.en.2
    call        foo@PLT
    movl        %eax, -12(%rbp)
    movl        -12(%rbp), %r10d
    movl        %r10d, -4(%rbp)
.Lmain.if.en.2:
    movl        $3, -16(%rbp)
    movl        -4(%rbp), %r10d
    addl        %r10d, -16(%rbp)
    movl        -16(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .globl      foo
    .text
foo:
    pushq       %rbp
    movq        %rsp, %rbp
    movl        $8, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .section    .note.GNU-stack,"",@progbits
