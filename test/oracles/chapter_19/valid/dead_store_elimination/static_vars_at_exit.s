    .globl      f
    .text
f:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    cmpl        $5, i.0(%rip)
    movl        $0, -4(%rbp)
    sete        -4(%rbp)
    cmpl        $0, -4(%rbp)
    je          .Lf.if.en.1
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lf.if.en.1:
    movl        $5, i.0(%rip)
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .globl      main
    .text
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    call        f@PLT
    movl        %eax, -4(%rbp)
    cmpl        $1, -4(%rbp)
    movl        $0, -8(%rbp)
    setne       -8(%rbp)
    cmpl        $0, -8(%rbp)
    je          .Lmain.if.en.2
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lmain.if.en.2:
    call        f@PLT
    movl        %eax, -12(%rbp)
    cmpl        $0, -12(%rbp)
    movl        $0, -16(%rbp)
    setne       -16(%rbp)
    cmpl        $0, -16(%rbp)
    je          .Lmain.if.en.5
    movl        $2, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lmain.if.en.5:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .data
    .align      4
i.0:
    .long       10
    .section    .note.GNU-stack,"",@progbits
