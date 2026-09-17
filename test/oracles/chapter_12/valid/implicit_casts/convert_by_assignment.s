    .globl      check_int
    .text
check_int:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        %edi, -4(%rbp)
    movl        %esi, -8(%rbp)
    movl        -8(%rbp), %r10d
    cmpl        %r10d, -4(%rbp)
    movl        $0, -12(%rbp)
    sete        -12(%rbp)
    movl        -12(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .globl      check_long
    .text
check_long:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    movq        %rdi, -8(%rbp)
    movq        %rsi, -16(%rbp)
    movq        -16(%rbp), %r10
    cmpq        %r10, -8(%rbp)
    movl        $0, -20(%rbp)
    sete        -20(%rbp)
    movl        -20(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .globl      check_ulong
    .text
check_ulong:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    movq        %rdi, -8(%rbp)
    movq        %rsi, -16(%rbp)
    movq        -16(%rbp), %r10
    cmpq        %r10, -8(%rbp)
    movl        $0, -20(%rbp)
    sete        -20(%rbp)
    movl        -20(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .globl      return_extended_uint
    .text
return_extended_uint:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        %edi, -4(%rbp)
    movl        -4(%rbp), %r11d
    movq        %r11, -16(%rbp)
    movq        -16(%rbp), %rax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .globl      return_extended_int
    .text
return_extended_int:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        %edi, -4(%rbp)
    movslq      -4(%rbp), %r11
    movq        %r11, -16(%rbp)
    movq        -16(%rbp), %rax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .globl      return_truncated_ulong
    .text
return_truncated_ulong:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movq        %rdi, -8(%rbp)
    movl        -8(%rbp), %r10d
    movl        %r10d, -12(%rbp)
    movl        -12(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .globl      extend_on_assignment
    .text
extend_on_assignment:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    movl        %edi, -4(%rbp)
    movq        %rsi, -16(%rbp)
    movl        -4(%rbp), %r11d
    movq        %r11, -24(%rbp)
    movq        -16(%rbp), %r10
    cmpq        %r10, -24(%rbp)
    movl        $0, -28(%rbp)
    sete        -28(%rbp)
    movl        -28(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .globl      main
    .text
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $80, %rsp
    movl        $5, %edi
    movl        $5, %esi
    call        check_int@PLT
    movl        %eax, -4(%rbp)
    cmpl        $0, -4(%rbp)
    movl        $0, -8(%rbp)
    sete        -8(%rbp)
    cmpl        $0, -8(%rbp)
    je          .Lmain.if.en.3
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lmain.if.en.3:
    movq        $2147483658, %rdi
    movq        $2147483658, %rsi
    call        check_long@PLT
    movl        %eax, -12(%rbp)
    cmpl        $0, -12(%rbp)
    movl        $0, -16(%rbp)
    sete        -16(%rbp)
    cmpl        $0, -16(%rbp)
    je          .Lmain.if.en.7
    movl        $2, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lmain.if.en.7:
    movq        $-1, %rdi
    movq        $-1, %rsi
    call        check_ulong@PLT
    movl        %eax, -20(%rbp)
    cmpl        $0, -20(%rbp)
    movl        $0, -24(%rbp)
    sete        -24(%rbp)
    cmpl        $0, -24(%rbp)
    je          .Lmain.if.en.12
    movl        $3, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lmain.if.en.12:
    movl        $-2147483638, %edi
    call        return_extended_uint@PLT
    movq        %rax, -32(%rbp)
    movq        $2147483658, %r10
    cmpq        %r10, -32(%rbp)
    movl        $0, -36(%rbp)
    setne       -36(%rbp)
    cmpl        $0, -36(%rbp)
    je          .Lmain.if.en.15
    movl        $4, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lmain.if.en.15:
    movl        $-1, %edi
    call        return_extended_int@PLT
    movq        %rax, -48(%rbp)
    cmpq        $-1, -48(%rbp)
    movl        $0, -52(%rbp)
    setne       -52(%rbp)
    cmpl        $0, -52(%rbp)
    je          .Lmain.if.en.19
    movl        $5, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lmain.if.en.19:
    movq        $1125902054326372, %rdi
    call        return_truncated_ulong@PLT
    movl        %eax, -56(%rbp)
    movslq      -56(%rbp), %r11
    movq        %r11, -64(%rbp)
    cmpq        $-2147483548, -64(%rbp)
    movl        $0, -68(%rbp)
    setne       -68(%rbp)
    cmpl        $0, -68(%rbp)
    je          .Lmain.if.en.24
    movl        $6, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lmain.if.en.24:
    movl        $-2147483638, %edi
    movq        $2147483658, %rsi
    call        extend_on_assignment@PLT
    movl        %eax, -72(%rbp)
    cmpl        $0, -72(%rbp)
    movl        $0, -76(%rbp)
    sete        -76(%rbp)
    cmpl        $0, -76(%rbp)
    je          .Lmain.if.en.27
    movl        $7, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lmain.if.en.27:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .section    .note.GNU-stack,"",@progbits
