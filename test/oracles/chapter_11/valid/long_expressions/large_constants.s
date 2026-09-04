    .globl      add_large
    .text       
add_large:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movq        x(%rip), %r10
    movq        %r10, -8(%rbp)
    movq        $4294967290, %r10
    addq        %r10, -8(%rbp)
    movq        -8(%rbp), %r10
    movq        %r10, x(%rip)
    movq        $4294967295, %r10
    cmpq        %r10, -8(%rbp)
    movl        $0, -12(%rbp)
    sete        -12(%rbp)
    movl        -12(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      subtract_large
    .text       
subtract_large:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movq        x(%rip), %r10
    movq        %r10, -8(%rbp)
    movq        $4294967290, %r10
    subq        %r10, -8(%rbp)
    movq        -8(%rbp), %r10
    movq        %r10, x(%rip)
    cmpq        $5, -8(%rbp)
    movl        $0, -12(%rbp)
    sete        -12(%rbp)
    movl        -12(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      multiply_by_large
    .text       
multiply_by_large:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movq        x(%rip), %r10
    movq        %r10, -8(%rbp)
    movq        $4294967290, %r10
    movq        -8(%rbp), %r11
    imulq       %r10, %r11
    movq        %r11, -8(%rbp)
    movq        -8(%rbp), %r10
    movq        %r10, x(%rip)
    movq        $21474836450, %r10
    cmpq        %r10, -8(%rbp)
    movl        $0, -12(%rbp)
    sete        -12(%rbp)
    movl        -12(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    call        add_large@PLT
    movl        %eax, -4(%rbp)
    cmpl        $0, -4(%rbp)
    movl        $0, -8(%rbp)
    sete        -8(%rbp)
    cmpl        $0, -8(%rbp)
    je          .Lmain.if.en.2
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.2:
    call        subtract_large@PLT
    movl        %eax, -12(%rbp)
    cmpl        $0, -12(%rbp)
    movl        $0, -16(%rbp)
    sete        -16(%rbp)
    cmpl        $0, -16(%rbp)
    je          .Lmain.if.en.5
    movl        $2, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.5:
    call        multiply_by_large@PLT
    movl        %eax, -20(%rbp)
    cmpl        $0, -20(%rbp)
    movl        $0, -24(%rbp)
    sete        -24(%rbp)
    cmpl        $0, -24(%rbp)
    je          .Lmain.if.en.8
    movl        $3, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.8:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      x
    .data       
    .align      8
x:
    .quad       5
    .section    .note.GNU-stack,"",@progbits
