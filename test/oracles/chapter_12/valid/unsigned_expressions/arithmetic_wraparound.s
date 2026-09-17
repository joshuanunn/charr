    .globl      addition
    .text
addition:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        ui_a(%rip), %r10d
    movl        %r10d, -4(%rbp)
    movl        ui_b(%rip), %r10d
    addl        %r10d, -4(%rbp)
    cmpl        $0, -4(%rbp)
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
    cmpq        $-10, -8(%rbp)
    movl        $0, -12(%rbp)
    sete        -12(%rbp)
    movl        -12(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .globl      neg
    .text
neg:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movq        ul_a(%rip), %r10
    movq        %r10, -8(%rbp)
    negq        -8(%rbp)
    cmpq        $-1, -8(%rbp)
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
    movl        $-3, ui_a(%rip)
    movl        $3, ui_b(%rip)
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
    movq        $10, ul_a(%rip)
    movq        $20, ul_b(%rip)
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
    movq        $1, ul_a(%rip)
    call        neg@PLT
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
    .section    .note.GNU-stack,"",@progbits
