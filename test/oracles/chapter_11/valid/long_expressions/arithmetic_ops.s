    .globl      addition
    .text       
addition:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movq        a(%rip), %r10
    movq        %r10, -8(%rbp)
    movq        b(%rip), %r10
    addq        %r10, -8(%rbp)
    movq        $4294967295, %r10
    cmpq        %r10, -8(%rbp)
    movl        $0, -12(%rbp)
    sete        -12(%rbp)
    movl        -12(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      subtraction
    .text       
subtraction:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movq        a(%rip), %r10
    movq        %r10, -8(%rbp)
    movq        b(%rip), %r10
    subq        %r10, -8(%rbp)
    movq        $-4294967380, %r10
    cmpq        %r10, -8(%rbp)
    movl        $0, -12(%rbp)
    sete        -12(%rbp)
    movl        -12(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      multiplication
    .text       
multiplication:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movq        a(%rip), %r10
    movq        %r10, -8(%rbp)
    movq        -8(%rbp), %r11
    imulq       $4, %r11
    movq        %r11, -8(%rbp)
    movq        $17179869160, %r10
    cmpq        %r10, -8(%rbp)
    movl        $0, -12(%rbp)
    sete        -12(%rbp)
    movl        -12(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      division
    .text       
division:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movq        a(%rip), %rax
    cqo         
    movq        $128, %r10
    idivq       %r10
    movq        %rax, -8(%rbp)
    movq        -8(%rbp), %r10
    movq        %r10, b(%rip)
    cmpq        $33554431, -8(%rbp)
    movl        $0, -12(%rbp)
    sete        -12(%rbp)
    movl        -12(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      remaind
    .text       
remaind:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    movq        a(%rip), %r10
    movq        %r10, -8(%rbp)
    negq        -8(%rbp)
    movq        -8(%rbp), %rax
    cqo         
    movq        $4294967290, %r10
    idivq       %r10
    movq        %rdx, -16(%rbp)
    movq        -16(%rbp), %r10
    movq        %r10, b(%rip)
    movq        $-5, -24(%rbp)
    movq        -24(%rbp), %r10
    cmpq        %r10, -16(%rbp)
    movl        $0, -28(%rbp)
    sete        -28(%rbp)
    movl        -28(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      complement
    .text       
complement:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movq        a(%rip), %r10
    movq        %r10, -8(%rbp)
    notq        -8(%rbp)
    movq        $-9223372036854775807, %r10
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
    subq        $48, %rsp
    movq        $4294967290, %r10
    movq        %r10, a(%rip)
    movq        $5, b(%rip)
    call        addition@PLT
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
    movq        $-4294967290, %r10
    movq        %r10, a(%rip)
    movq        $90, b(%rip)
    call        subtraction@PLT
    movl        %eax, -12(%rbp)
    cmpl        $0, -12(%rbp)
    movl        $0, -16(%rbp)
    sete        -16(%rbp)
    cmpl        $0, -16(%rbp)
    je          .Lmain.if.en.6
    movl        $2, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.6:
    movq        $4294967290, %r10
    movq        %r10, a(%rip)
    call        multiplication@PLT
    movl        %eax, -20(%rbp)
    cmpl        $0, -20(%rbp)
    movl        $0, -24(%rbp)
    sete        -24(%rbp)
    cmpl        $0, -24(%rbp)
    je          .Lmain.if.en.9
    movl        $3, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.9:
    movq        $4294967290, %r10
    movq        %r10, a(%rip)
    call        division@PLT
    movl        %eax, -28(%rbp)
    cmpl        $0, -28(%rbp)
    movl        $0, -32(%rbp)
    sete        -32(%rbp)
    cmpl        $0, -32(%rbp)
    je          .Lmain.if.en.12
    movl        $4, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.12:
    movq        $8589934585, %r10
    movq        %r10, a(%rip)
    call        remaind@PLT
    movl        %eax, -36(%rbp)
    cmpl        $0, -36(%rbp)
    movl        $0, -40(%rbp)
    sete        -40(%rbp)
    cmpl        $0, -40(%rbp)
    je          .Lmain.if.en.15
    movl        $5, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.15:
    movq        $9223372036854775806, %r10
    movq        %r10, a(%rip)
    call        complement@PLT
    movl        %eax, -44(%rbp)
    cmpl        $0, -44(%rbp)
    movl        $0, -48(%rbp)
    sete        -48(%rbp)
    cmpl        $0, -48(%rbp)
    je          .Lmain.if.en.18
    movl        $6, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.18:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      b
    .bss        
    .align      8
b:
    .zero       8
    .globl      a
    .bss        
    .align      8
a:
    .zero       8
    .section    .note.GNU-stack,"",@progbits
