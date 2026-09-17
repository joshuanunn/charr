    .globl      int_gt_uint
    .text
int_gt_uint:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        %edi, -4(%rbp)
    movl        %esi, -8(%rbp)
    movl        -4(%rbp), %r10d
    movl        %r10d, -12(%rbp)
    movl        -8(%rbp), %r10d
    cmpl        %r10d, -12(%rbp)
    movl        $0, -16(%rbp)
    seta        -16(%rbp)
    movl        -16(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .globl      int_gt_ulong
    .text
int_gt_ulong:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    movl        %edi, -4(%rbp)
    movq        %rsi, -16(%rbp)
    movslq      -4(%rbp), %r11
    movq        %r11, -24(%rbp)
    movq        -16(%rbp), %r10
    cmpq        %r10, -24(%rbp)
    movl        $0, -28(%rbp)
    seta        -28(%rbp)
    movl        -28(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .globl      uint_gt_long
    .text
uint_gt_long:
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
    setg        -28(%rbp)
    movl        -28(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .globl      uint_lt_ulong
    .text
uint_lt_ulong:
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
    setb        -28(%rbp)
    movl        -28(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .globl      long_gt_ulong
    .text
long_gt_ulong:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    movq        %rdi, -8(%rbp)
    movq        %rsi, -16(%rbp)
    movq        -8(%rbp), %r10
    movq        %r10, -24(%rbp)
    movq        -16(%rbp), %r10
    cmpq        %r10, -24(%rbp)
    movl        $0, -28(%rbp)
    seta        -28(%rbp)
    movl        -28(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .globl      ternary_int_uint
    .text
ternary_int_uint:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $48, %rsp
    movl        %edi, -4(%rbp)
    movl        %esi, -8(%rbp)
    movl        %edx, -12(%rbp)
    cmpl        $0, -4(%rbp)
    je          .Lternary_int_uint.cond.el.2
    movl        -8(%rbp), %r10d
    movl        %r10d, -16(%rbp)
    movl        -16(%rbp), %r10d
    movl        %r10d, -20(%rbp)
    jmp         .Lternary_int_uint.cond.en.1
.Lternary_int_uint.cond.el.2:
    movl        -12(%rbp), %r10d
    movl        %r10d, -20(%rbp)
.Lternary_int_uint.cond.en.1:
    movl        -20(%rbp), %r11d
    movq        %r11, -32(%rbp)
    movq        $4294967295, %r10
    cmpq        %r10, -32(%rbp)
    movl        $0, -36(%rbp)
    sete        -36(%rbp)
    movl        -36(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .globl      main
    .text
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $48, %rsp
    movl        $-100, %edi
    movl        $100, %esi
    call        int_gt_uint@PLT
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
    movl        $-1, %edi
    movq        $-10, %rsi
    call        int_gt_ulong@PLT
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
    movl        $100, %edi
    movq        $-100, %rsi
    call        uint_gt_long@PLT
    movl        %eax, -20(%rbp)
    cmpl        $0, -20(%rbp)
    movl        $0, -24(%rbp)
    sete        -24(%rbp)
    cmpl        $0, -24(%rbp)
    je          .Lmain.if.en.11
    movl        $3, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lmain.if.en.11:
    movl        $1073741824, %edi
    movq        $34359738368, %rsi
    call        uint_lt_ulong@PLT
    movl        %eax, -28(%rbp)
    cmpl        $0, -28(%rbp)
    movl        $0, -32(%rbp)
    sete        -32(%rbp)
    cmpl        $0, -32(%rbp)
    je          .Lmain.if.en.14
    movl        $4, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lmain.if.en.14:
    movq        $-1, %rdi
    movq        $1000, %rsi
    call        long_gt_ulong@PLT
    movl        %eax, -36(%rbp)
    cmpl        $0, -36(%rbp)
    movl        $0, -40(%rbp)
    sete        -40(%rbp)
    cmpl        $0, -40(%rbp)
    je          .Lmain.if.en.18
    movl        $5, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lmain.if.en.18:
    movl        $1, %edi
    movl        $-1, %esi
    movl        $1, %edx
    call        ternary_int_uint@PLT
    movl        %eax, -44(%rbp)
    cmpl        $0, -44(%rbp)
    movl        $0, -48(%rbp)
    sete        -48(%rbp)
    cmpl        $0, -48(%rbp)
    je          .Lmain.if.en.22
    movl        $6, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lmain.if.en.22:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .section    .note.GNU-stack,"",@progbits
