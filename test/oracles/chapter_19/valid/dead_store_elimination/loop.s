    .globl      fib
    .text       
fib:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    movl        %edi, -4(%rbp)
    movl        $0, -8(%rbp)
    movl        $1, -12(%rbp)
    movl        $0, -16(%rbp)
.Lloop.st.1:
    movl        -8(%rbp), %r10d
    movl        %r10d, -20(%rbp)
    movl        -12(%rbp), %r10d
    addl        %r10d, -20(%rbp)
    movl        -12(%rbp), %r10d
    movl        %r10d, -8(%rbp)
    movl        -20(%rbp), %r10d
    movl        %r10d, -12(%rbp)
    movl        -16(%rbp), %r10d
    movl        %r10d, -24(%rbp)
    addl        $1, -24(%rbp)
    movl        -24(%rbp), %r10d
    movl        %r10d, -16(%rbp)
    movl        -4(%rbp), %r10d
    cmpl        %r10d, -24(%rbp)
    movl        $0, -28(%rbp)
    setl        -28(%rbp)
    cmpl        $0, -28(%rbp)
    jne         .Lloop.st.1
    movl        -12(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $20, %edi
    call        fib@PLT
    movl        %eax, -4(%rbp)
    cmpl        $10946, -4(%rbp)
    movl        $0, -8(%rbp)
    sete        -8(%rbp)
    movl        -8(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
