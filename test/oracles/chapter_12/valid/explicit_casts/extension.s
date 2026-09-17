    .globl      int_to_ulong
    .text
int_to_ulong:
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
    sete        -28(%rbp)
    movl        -28(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .globl      uint_to_long
    .text
uint_to_long:
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
    .globl      uint_to_ulong
    .text
uint_to_ulong:
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
    subq        $32, %rsp
    movl        $10, %edi
    movq        $10, %rsi
    call        int_to_ulong@PLT
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
    movl        $-10, %edi
    movq        $-10, %rsi
    call        int_to_ulong@PLT
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
    movl        $-96, %edi
    movq        $4294967200, %rsi
    call        uint_to_long@PLT
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
    movl        $-96, %edi
    movq        $4294967200, %rsi
    call        uint_to_ulong@PLT
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
    .section    .note.GNU-stack,"",@progbits
