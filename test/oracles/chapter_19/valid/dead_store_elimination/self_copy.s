    .globl      target
    .text
target:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        %edi, -4(%rbp)
    movl        $2, -8(%rbp)
    cmpl        $0, -4(%rbp)
    je          .Ltarget.if.en.0
    movl        $3, -8(%rbp)
.Ltarget.if.en.0:
    movl        -8(%rbp), %r10d
    movl        %r10d, -8(%rbp)
    movl        -8(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .globl      main
    .text
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $0, %edi
    call        target@PLT
    movl        %eax, -4(%rbp)
    cmpl        $2, -4(%rbp)
    movl        $0, -8(%rbp)
    setne       -8(%rbp)
    cmpl        $0, -8(%rbp)
    je          .Lmain.if.en.2
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lmain.if.en.2:
    movl        $1, %edi
    call        target@PLT
    movl        %eax, -12(%rbp)
    cmpl        $3, -12(%rbp)
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
    .section    .note.GNU-stack,"",@progbits
