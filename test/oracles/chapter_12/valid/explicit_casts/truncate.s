    .globl      ulong_to_int
    .text
ulong_to_int:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    movq        %rdi, -8(%rbp)
    movl        %esi, -12(%rbp)
    movl        -8(%rbp), %r10d
    movl        %r10d, -16(%rbp)
    movl        -12(%rbp), %r10d
    cmpl        %r10d, -16(%rbp)
    movl        $0, -20(%rbp)
    sete        -20(%rbp)
    movl        -20(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .globl      ulong_to_uint
    .text
ulong_to_uint:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    movq        %rdi, -8(%rbp)
    movl        %esi, -12(%rbp)
    movl        -8(%rbp), %r10d
    movl        %r10d, -16(%rbp)
    movl        -12(%rbp), %r10d
    cmpl        %r10d, -16(%rbp)
    movl        $0, -20(%rbp)
    sete        -20(%rbp)
    movl        -20(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .globl      long_to_uint
    .text
long_to_uint:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    movq        %rdi, -8(%rbp)
    movl        %esi, -12(%rbp)
    movl        -8(%rbp), %r10d
    movl        %r10d, -16(%rbp)
    movl        -12(%rbp), %r10d
    cmpl        %r10d, -16(%rbp)
    movl        $0, -20(%rbp)
    sete        -20(%rbp)
    movl        -20(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .globl      main
    .text
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $64, %rsp
    movq        $100, %rdi
    movl        $100, %esi
    call        long_to_uint@PLT
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
    movq        $-9223372036854774574, %rdi
    movl        $1234, %esi
    call        long_to_uint@PLT
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
    movq        $100, %rdi
    movl        $100, %esi
    call        ulong_to_int@PLT
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
    movq        $100, %rdi
    movl        $100, %esi
    call        ulong_to_uint@PLT
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
    movq        $4294967200, %rdi
    movl        $-96, %esi
    call        ulong_to_uint@PLT
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
    movq        $4294967200, %rdi
    movl        $-96, %esi
    call        ulong_to_int@PLT
    movl        %eax, -44(%rbp)
    cmpl        $0, -44(%rbp)
    movl        $0, -48(%rbp)
    sete        -48(%rbp)
    cmpl        $0, -48(%rbp)
    je          .Lmain.if.en.19
    movl        $6, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lmain.if.en.19:
    movq        $1152921506754330624, %rdi
    movl        $-2147483648, %esi
    call        ulong_to_uint@PLT
    movl        %eax, -52(%rbp)
    cmpl        $0, -52(%rbp)
    movl        $0, -56(%rbp)
    sete        -56(%rbp)
    cmpl        $0, -56(%rbp)
    je          .Lmain.if.en.22
    movl        $7, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lmain.if.en.22:
    movq        $1152921506754330624, %rdi
    movl        $-2147483648, %esi
    call        ulong_to_int@PLT
    movl        %eax, -60(%rbp)
    cmpl        $0, -60(%rbp)
    movl        $0, -64(%rbp)
    sete        -64(%rbp)
    cmpl        $0, -64(%rbp)
    je          .Lmain.if.en.27
    movl        $8, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lmain.if.en.27:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .section    .note.GNU-stack,"",@progbits
