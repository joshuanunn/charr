    .globl      addition
    .text
addition:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        ui_a(%rip), %r10d
    movl        %r10d, -4(%rbp)
    addl        $-2147483643, -4(%rbp)
    cmpl        $-2147483633, -4(%rbp)
    movl        $0, -8(%rbp)
    sete        -8(%rbp)
    movl        -8(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .globl      subtraction
    .text
subtraction:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movq        ul_a(%rip), %r10
    movq        %r10, -8(%rbp)
    movq        ul_b(%rip), %r10
    subq        %r10, -8(%rbp)
    cmpq        $-1073742824, -8(%rbp)
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
    movl        ui_a(%rip), %r10d
    movl        %r10d, -4(%rbp)
    movl        -4(%rbp), %r11d
    imull       ui_b(%rip), %r11d
    movl        %r11d, -4(%rbp)
    cmpl        $-1073741824, -4(%rbp)
    movl        $0, -8(%rbp)
    sete        -8(%rbp)
    movl        -8(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .globl      division
    .text
division:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        ui_a(%rip), %eax
    movl        $0, %edx
    divl        ui_b(%rip)
    movl        %eax, -4(%rbp)
    cmpl        $0, -4(%rbp)
    movl        $0, -8(%rbp)
    sete        -8(%rbp)
    movl        -8(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .globl      division_large_dividend
    .text
division_large_dividend:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        ui_a(%rip), %eax
    movl        $0, %edx
    divl        ui_b(%rip)
    movl        %eax, -4(%rbp)
    cmpl        $2, -4(%rbp)
    movl        $0, -8(%rbp)
    sete        -8(%rbp)
    movl        -8(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .globl      division_by_literal
    .text
division_by_literal:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movq        ul_a(%rip), %rax
    movq        $0, %rdx
    movq        $5, %r10
    divq        %r10
    movq        %rax, -8(%rbp)
    movq        $219902325555, %r10
    cmpq        %r10, -8(%rbp)
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
    subq        $16, %rsp
    movq        ul_b(%rip), %rax
    movq        $0, %rdx
    divq        ul_a(%rip)
    movq        %rdx, -8(%rbp)
    cmpq        $5, -8(%rbp)
    movl        $0, -12(%rbp)
    sete        -12(%rbp)
    movl        -12(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .globl      complement
    .text
complement:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        ui_a(%rip), %r10d
    movl        %r10d, -4(%rbp)
    notl        -4(%rbp)
    cmpl        $0, -4(%rbp)
    movl        $0, -8(%rbp)
    sete        -8(%rbp)
    movl        -8(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .globl      main
    .text
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $64, %rsp
    movl        $10, ui_a(%rip)
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
    movq        $-1073741824, ul_a(%rip)
    movq        $1000, ul_b(%rip)
    call        subtraction@PLT
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
    movl        $1073741824, ui_a(%rip)
    movl        $3, ui_b(%rip)
    call        multiplication@PLT
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
    movl        $100, ui_a(%rip)
    movl        $-2, ui_b(%rip)
    call        division@PLT
    movl        %eax, -28(%rbp)
    cmpl        $0, -28(%rbp)
    movl        $0, -32(%rbp)
    sete        -32(%rbp)
    cmpl        $0, -32(%rbp)
    je          .Lmain.if.en.11
    movl        $4, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lmain.if.en.11:
    movl        $-2, ui_a(%rip)
    movl        $2147483647, ui_b(%rip)
    call        division_large_dividend@PLT
    movl        %eax, -36(%rbp)
    cmpl        $0, -36(%rbp)
    movl        $0, -40(%rbp)
    sete        -40(%rbp)
    cmpl        $0, -40(%rbp)
    je          .Lmain.if.en.14
    movl        $5, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lmain.if.en.14:
    movq        $1099511627775, %r10
    movq        %r10, ul_a(%rip)
    call        division_by_literal@PLT
    movl        %eax, -44(%rbp)
    cmpl        $0, -44(%rbp)
    movl        $0, -48(%rbp)
    sete        -48(%rbp)
    cmpl        $0, -48(%rbp)
    je          .Lmain.if.en.17
    movl        $6, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lmain.if.en.17:
    movq        $100, ul_a(%rip)
    movq        $-11, ul_b(%rip)
    call        remaind@PLT
    movl        %eax, -52(%rbp)
    cmpl        $0, -52(%rbp)
    movl        $0, -56(%rbp)
    sete        -56(%rbp)
    cmpl        $0, -56(%rbp)
    je          .Lmain.if.en.20
    movl        $7, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lmain.if.en.20:
    movl        $-1, ui_a(%rip)
    call        complement@PLT
    movl        %eax, -60(%rbp)
    cmpl        $0, -60(%rbp)
    movl        $0, -64(%rbp)
    sete        -64(%rbp)
    cmpl        $0, -64(%rbp)
    je          .Lmain.if.en.23
    movl        $8, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lmain.if.en.23:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .globl      ui_b
    .bss
    .align      4
ui_b:
    .zero       4
    .globl      ui_a
    .bss
    .align      4
ui_a:
    .zero       4
    .globl      ul_b
    .bss
    .align      8
ul_b:
    .zero       8
    .globl      ul_a
    .bss
    .align      8
ul_a:
    .zero       8
    .section    .note.GNU-stack,"",@progbits
