    .globl      test_sum
    .text
test_sum:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $64, %rsp
    movq        %rdi, -8(%rbp)
    movq        %rsi, -16(%rbp)
    movl        %edx, -20(%rbp)
    movl        %ecx, -24(%rbp)
    movl        %r8d, -28(%rbp)
    movl        %r9d, -32(%rbp)
    movl        16(%rbp), %r10d
    movl        %r10d, -36(%rbp)
    movl        24(%rbp), %r10d
    movl        %r10d, -40(%rbp)
    movq        32(%rbp), %r10
    movq        %r10, -48(%rbp)
    movq        -8(%rbp), %r10
    movq        %r10, -56(%rbp)
    movq        -16(%rbp), %r10
    addq        %r10, -56(%rbp)
    cmpq        $100, -56(%rbp)
    movl        $0, -60(%rbp)
    setl        -60(%rbp)
    cmpl        $0, -60(%rbp)
    je          .Ltest_sum.if.en.2
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Ltest_sum.if.en.2:
    cmpq        $100, -48(%rbp)
    movl        $0, -64(%rbp)
    setl        -64(%rbp)
    cmpl        $0, -64(%rbp)
    je          .Ltest_sum.if.en.4
    movl        $2, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Ltest_sum.if.en.4:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .globl      main
    .text
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    subq        $8, %rsp
    movq        $34359738368, %rdi
    movq        $34359738368, %rsi
    movl        $0, %edx
    movl        $0, %ecx
    movl        $0, %r8d
    movl        $0, %r9d
    movq        $34359738368, %r10
    pushq       %r10
    pushq       $0
    pushq       $0
    call        test_sum@PLT
    addq        $32, %rsp
    movl        %eax, -4(%rbp)
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .section    .note.GNU-stack,"",@progbits
