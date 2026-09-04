    .globl      compare_constants
    .text       
compare_constants:
    pushq       %rbp
    movq        %rsp, %rbp
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      compare_constants_2
    .text       
compare_constants_2:
    pushq       %rbp
    movq        %rsp, %rbp
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      l_geq_2_60
    .text       
l_geq_2_60:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movq        $1152921504606846976, %r10
    cmpq        %r10, l(%rip)
    movl        $0, -4(%rbp)
    setge       -4(%rbp)
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      uint_max_leq_l
    .text       
uint_max_leq_l:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movq        $4294967295, %r11
    cmpq        l(%rip), %r11
    movl        $0, -4(%rbp)
    setle       -4(%rbp)
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      l_eq_l2
    .text       
l_eq_l2:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movq        l2(%rip), %r10
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
    subq        $48, %rsp
    call        compare_constants@PLT
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
    call        compare_constants_2@PLT
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
    movq        $-9223372036854775807, %r10
    movq        %r10, l(%rip)
    call        l_geq_2_60@PLT
    movl        %eax, -20(%rbp)
    cmpl        $0, -20(%rbp)
    je          .Lmain.if.en.8
    movl        $3, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.8:
    call        uint_max_leq_l@PLT
    movl        %eax, -24(%rbp)
    cmpl        $0, -24(%rbp)
    je          .Lmain.if.en.10
    movl        $4, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.10:
    movq        $1152921504606846976, %r10
    movq        %r10, l(%rip)
    call        l_geq_2_60@PLT
    movl        %eax, -28(%rbp)
    cmpl        $0, -28(%rbp)
    movl        $0, -32(%rbp)
    sete        -32(%rbp)
    cmpl        $0, -32(%rbp)
    je          .Lmain.if.en.13
    movl        $5, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.13:
    call        uint_max_leq_l@PLT
    movl        %eax, -36(%rbp)
    cmpl        $0, -36(%rbp)
    movl        $0, -40(%rbp)
    sete        -40(%rbp)
    cmpl        $0, -40(%rbp)
    je          .Lmain.if.en.16
    movl        $6, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.16:
    movq        l(%rip), %r10
    movq        %r10, l2(%rip)
    call        l_eq_l2@PLT
    movl        %eax, -44(%rbp)
    cmpl        $0, -44(%rbp)
    movl        $0, -48(%rbp)
    sete        -48(%rbp)
    cmpl        $0, -48(%rbp)
    je          .Lmain.if.en.19
    movl        $7, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.19:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      l
    .bss        
    .align      8
l:
    .zero       8
    .globl      l2
    .bss        
    .align      8
l2:
    .zero       8
    .section    .note.GNU-stack,"",@progbits
