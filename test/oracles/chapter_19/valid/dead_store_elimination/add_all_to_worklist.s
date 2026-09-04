    .globl      f
    .text
f:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        %edi, -4(%rbp)
    movl        $76, -8(%rbp)
    cmpl        $10, -4(%rbp)
    movl        $0, -12(%rbp)
    setl        -12(%rbp)
    cmpl        $0, -12(%rbp)
    je          .Lf.if.en.1
    movl        $77, -8(%rbp)
.Lf.if.en.1:
    cmpl        $0, -4(%rbp)
    je          .Lf.if.en.2
    movl        -8(%rbp), %edi
    call        putchar@PLT
    movl        %eax, -16(%rbp)
.Lf.if.en.2:
    movl        $0, %eax
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
    call        f@PLT
    movl        %eax, -4(%rbp)
    movl        $1, %edi
    call        f@PLT
    movl        %eax, -8(%rbp)
    movl        $11, %edi
    call        f@PLT
    movl        %eax, -12(%rbp)
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .section    .note.GNU-stack,"",@progbits
