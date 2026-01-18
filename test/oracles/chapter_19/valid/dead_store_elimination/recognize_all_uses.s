    .globl      test_jz
    .text       
test_jz:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        %edi, -8(%rbp)
    movl        %esi, -12(%rbp)
    cmpl        $0, -8(%rbp)
    je          .Ltest_jz.if.en.0
    movl        $0, -12(%rbp)
.Ltest_jz.if.en.0:
    cmpl        $0, -12(%rbp)
    je          .Ltest_jz.cond.el.3
    movl        $1, -4(%rbp)
    jmp         .Ltest_jz.cond.en.2
.Ltest_jz.cond.el.3:
    movl        $2, -4(%rbp)
.Ltest_jz.cond.en.2:
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      test_jnz
    .text       
test_jnz:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        %edi, -8(%rbp)
    movl        %esi, -12(%rbp)
    cmpl        $0, -8(%rbp)
    je          .Ltest_jnz.if.en.0
    movl        $0, -12(%rbp)
.Ltest_jnz.if.en.0:
    cmpl        $0, -12(%rbp)
    jne         .Ltest_jnz.or.tr.2
    movl        $0, -4(%rbp)
    jmp         .Ltest_jnz.or.en.3
.Ltest_jnz.or.tr.2:
    movl        $1, -4(%rbp)
.Ltest_jnz.or.en.3:
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      test_binary
    .text       
test_binary:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    movl        %edi, -16(%rbp)
    movl        %esi, -20(%rbp)
    movl        %edx, -24(%rbp)
    cmpl        $0, -16(%rbp)
    movl        $0, -4(%rbp)
    sete        -4(%rbp)
    cmpl        $0, -4(%rbp)
    je          .Ltest_binary.if.el.2
    movl        $4, -20(%rbp)
    jmp         .Ltest_binary.if.en.1
.Ltest_binary.if.el.2:
    cmpl        $1, -16(%rbp)
    movl        $0, -8(%rbp)
    sete        -8(%rbp)
    cmpl        $0, -8(%rbp)
    je          .Ltest_binary.if.en.4
    movl        $3, -24(%rbp)
.Ltest_binary.if.en.4:
.Ltest_binary.if.en.1:
    movl        -20(%rbp), %r10d
    movl        %r10d, -12(%rbp)
    movl        -12(%rbp), %r11d
    imull       -24(%rbp), %r11d
    movl        %r11d, -12(%rbp)
    movl        -12(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      test_unary
    .text       
test_unary:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        %edi, -8(%rbp)
    movl        %esi, -12(%rbp)
    cmpl        $0, -8(%rbp)
    je          .Ltest_unary.if.en.0
    movl        $5, -12(%rbp)
.Ltest_unary.if.en.0:
    movl        -12(%rbp), %r10d
    movl        %r10d, -4(%rbp)
    negl        -4(%rbp)
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      f
    .text       
f:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        %edi, -8(%rbp)
    movl        -8(%rbp), %r10d
    movl        %r10d, -4(%rbp)
    addl        $1, -4(%rbp)
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      test_funcall
    .text       
test_funcall:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        %edi, -8(%rbp)
    movl        %esi, -12(%rbp)
    cmpl        $0, -8(%rbp)
    je          .Ltest_funcall.if.en.0
    movl        $7, -12(%rbp)
.Ltest_funcall.if.en.0:
    movl        -12(%rbp), %edi
    call        f@PLT
    movl        %eax, -4(%rbp)
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $96, %rsp
    movl        $1, %edi
    movl        $1, %esi
    call        test_jz@PLT
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
    movl        $0, %edi
    movl        $1, %esi
    call        test_jz@PLT
    movl        %eax, -12(%rbp)
    cmpl        $1, -12(%rbp)
    movl        $0, -16(%rbp)
    setne       -16(%rbp)
    cmpl        $0, -16(%rbp)
    je          .Lmain.if.en.5
    movl        $2, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.5:
    movl        $1, %edi
    movl        $1, %esi
    call        test_jnz@PLT
    movl        %eax, -20(%rbp)
    cmpl        $0, -20(%rbp)
    movl        $0, -24(%rbp)
    setne       -24(%rbp)
    cmpl        $0, -24(%rbp)
    je          .Lmain.if.en.8
    movl        $3, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.8:
    movl        $0, %edi
    movl        $1, %esi
    call        test_jnz@PLT
    movl        %eax, -28(%rbp)
    cmpl        $1, -28(%rbp)
    movl        $0, -32(%rbp)
    setne       -32(%rbp)
    cmpl        $0, -32(%rbp)
    je          .Lmain.if.en.11
    movl        $4, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.11:
    movl        $0, %edi
    movl        $8, %esi
    movl        $9, %edx
    call        test_binary@PLT
    movl        %eax, -36(%rbp)
    cmpl        $36, -36(%rbp)
    movl        $0, -40(%rbp)
    setne       -40(%rbp)
    cmpl        $0, -40(%rbp)
    je          .Lmain.if.en.14
    movl        $5, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.14:
    movl        $1, %edi
    movl        $8, %esi
    movl        $9, %edx
    call        test_binary@PLT
    movl        %eax, -44(%rbp)
    cmpl        $24, -44(%rbp)
    movl        $0, -48(%rbp)
    setne       -48(%rbp)
    cmpl        $0, -48(%rbp)
    je          .Lmain.if.en.17
    movl        $6, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.17:
    movl        $2, %edi
    movl        $8, %esi
    movl        $9, %edx
    call        test_binary@PLT
    movl        %eax, -52(%rbp)
    cmpl        $72, -52(%rbp)
    movl        $0, -56(%rbp)
    setne       -56(%rbp)
    cmpl        $0, -56(%rbp)
    je          .Lmain.if.en.20
    movl        $7, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.20:
    movl        $0, %edi
    movl        $8, %esi
    call        test_unary@PLT
    movl        %eax, -60(%rbp)
    cmpl        $-8, -60(%rbp)
    movl        $0, -68(%rbp)
    setne       -68(%rbp)
    cmpl        $0, -68(%rbp)
    je          .Lmain.if.en.24
    movl        $8, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.24:
    movl        $1, %edi
    movl        $8, %esi
    call        test_unary@PLT
    movl        %eax, -72(%rbp)
    cmpl        $-5, -72(%rbp)
    movl        $0, -80(%rbp)
    setne       -80(%rbp)
    cmpl        $0, -80(%rbp)
    je          .Lmain.if.en.28
    movl        $9, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.28:
    movl        $1, %edi
    movl        $5, %esi
    call        test_funcall@PLT
    movl        %eax, -84(%rbp)
    cmpl        $8, -84(%rbp)
    movl        $0, -88(%rbp)
    setne       -88(%rbp)
    cmpl        $0, -88(%rbp)
    je          .Lmain.if.en.31
    movl        $10, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.31:
    movl        $0, %edi
    movl        $9, %esi
    call        test_funcall@PLT
    movl        %eax, -92(%rbp)
    cmpl        $10, -92(%rbp)
    movl        $0, -96(%rbp)
    setne       -96(%rbp)
    cmpl        $0, -96(%rbp)
    je          .Lmain.if.en.34
    movl        $11, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.34:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
