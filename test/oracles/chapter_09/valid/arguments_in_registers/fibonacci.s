    .globl      fib
    .text
fib:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $48, %rsp
    movl        %edi, -4(%rbp)
    cmpl        $0, -4(%rbp)
    movl        $0, -8(%rbp)
    sete        -8(%rbp)
    cmpl        $0, -8(%rbp)
    jne         .Lfib.or.tr.3
    cmpl        $1, -4(%rbp)
    movl        $0, -12(%rbp)
    sete        -12(%rbp)
    cmpl        $0, -12(%rbp)
    jne         .Lfib.or.tr.3
    movl        $0, -16(%rbp)
    jmp         .Lfib.or.en.4
.Lfib.or.tr.3:
    movl        $1, -16(%rbp)
.Lfib.or.en.4:
    cmpl        $0, -16(%rbp)
    je          .Lfib.if.el.6
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lfib.if.el.6:
    movl        -4(%rbp), %r10d
    movl        %r10d, -20(%rbp)
    subl        $1, -20(%rbp)
    movl        -20(%rbp), %edi
    call        fib@PLT
    movl        %eax, -24(%rbp)
    movl        -4(%rbp), %r10d
    movl        %r10d, -28(%rbp)
    subl        $2, -28(%rbp)
    movl        -28(%rbp), %edi
    call        fib@PLT
    movl        %eax, -32(%rbp)
    movl        -24(%rbp), %r10d
    movl        %r10d, -36(%rbp)
    movl        -32(%rbp), %r10d
    addl        %r10d, -36(%rbp)
    movl        -36(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .globl      main
    .text
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $6, %edi
    call        fib@PLT
    movl        %eax, -4(%rbp)
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .section    .note.GNU-stack,"",@progbits
