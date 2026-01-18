    .globl      f
    .text       
f:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        %edi, -16(%rbp)
    movl        $76, -4(%rbp)
    cmpl        $10, -16(%rbp)
    movl        $0, -8(%rbp)
    setl        -8(%rbp)
    cmpl        $0, -8(%rbp)
    je          .Lf.if.en.1
    movl        $77, -4(%rbp)
.Lf.if.en.1:
    cmpl        $0, -16(%rbp)
    je          .Lf.if.en.2
    movl        -4(%rbp), %edi
    call        putchar@PLT
    movl        %eax, -12(%rbp)
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
