    .globl      sign_extend
    .text
sign_extend:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $48, %rsp
    movl        %edi, -4(%rbp)
    movq        %rsi, -16(%rbp)
    movslq      -4(%rbp), %r11
    movq        %r11, -24(%rbp)
    movq        -16(%rbp), %r10
    cmpq        %r10, -24(%rbp)
    movl        $0, -28(%rbp)
    sete        -28(%rbp)
    movslq      -28(%rbp), %r11
    movq        %r11, -40(%rbp)
    movq        -40(%rbp), %rax
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
    call        sign_extend@PLT
    movq        %rax, -8(%rbp)
    cmpq        $0, -8(%rbp)
    movl        $0, -12(%rbp)
    sete        -12(%rbp)
    cmpl        $0, -12(%rbp)
    je          .Lmain.if.en.2
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lmain.if.en.2:
    movl        $-10, %edi
    movq        $-10, %rsi
    call        sign_extend@PLT
    movq        %rax, -24(%rbp)
    cmpq        $0, -24(%rbp)
    movl        $0, -28(%rbp)
    sete        -28(%rbp)
    cmpl        $0, -28(%rbp)
    je          .Lmain.if.en.7
    movl        $2, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lmain.if.en.7:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .section    .note.GNU-stack,"",@progbits
