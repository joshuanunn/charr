    .globl      addition
    .text       
addition:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    movslq      i(%rip), %r11
    movq        %r11, -8(%rbp)
    movq        -8(%rbp), %r10
    movq        %r10, -16(%rbp)
    movq        l(%rip), %r10
    addq        %r10, -16(%rbp)
    movq        $2147483663, %r10
    cmpq        %r10, -16(%rbp)
    movl        $0, -20(%rbp)
    sete        -20(%rbp)
    movl        -20(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      division
    .text       
division:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    movslq      i(%rip), %r11
    movq        %r11, -8(%rbp)
    movq        l(%rip), %rax
    cqo         
    idivq       -8(%rbp)
    movq        %rax, -16(%rbp)
    movl        -16(%rbp), %r10d
    movl        %r10d, -20(%rbp)
    cmpl        $214748364, -20(%rbp)
    movl        $0, -24(%rbp)
    sete        -24(%rbp)
    movl        -24(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      comparison
    .text       
comparison:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movslq      i(%rip), %r11
    movq        %r11, -8(%rbp)
    movq        l(%rip), %r10
    cmpq        %r10, -8(%rbp)
    movl        $0, -12(%rbp)
    setle       -12(%rbp)
    movl        -12(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      conditional
    .text       
conditional:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movq        $8589934592, %r10
    cmpq        %r10, l(%rip)
    movl        $0, -4(%rbp)
    sete        -4(%rbp)
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    movq        $2147483653, %r10
    movq        %r10, l(%rip)
    movl        $10, i(%rip)
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
    movq        $2147483649, %r10
    movq        %r10, l(%rip)
    call        division@PLT
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
    movl        $-100, i(%rip)
    movq        $2147483648, %r10
    movq        %r10, l(%rip)
    call        comparison@PLT
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
    movq        $8589934592, %r10
    movq        %r10, l(%rip)
    movl        $10, i(%rip)
    call        conditional@PLT
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
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      i
    .bss        
    .align      4
i:
    .zero       4
    .globl      l
    .bss        
    .align      8
l:
    .zero       8
    .section    .note.GNU-stack,"",@progbits
