    .globl      target
    .text       
target:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $48, %rsp
    movl        $65, -4(%rbp)
.Lloop.st.1:
    movl        -4(%rbp), %r10d
    movl        %r10d, -8(%rbp)
    addl        $2, -8(%rbp)
    movl        -8(%rbp), %r10d
    movl        %r10d, -12(%rbp)
    cmpl        $70, -4(%rbp)
    movl        $0, -16(%rbp)
    setg        -16(%rbp)
    cmpl        $0, -16(%rbp)
    je          .Ltarget.if.en.2
    movl        -4(%rbp), %r10d
    movl        %r10d, -20(%rbp)
    addl        $3, -20(%rbp)
    movl        -20(%rbp), %r10d
    movl        %r10d, -12(%rbp)
.Ltarget.if.en.2:
    movl        -12(%rbp), %edi
    call        putchar@PLT
    movl        %eax, -24(%rbp)
    movl        -24(%rbp), %r10d
    movl        %r10d, -28(%rbp)
    addl        $3, -28(%rbp)
    movl        -28(%rbp), %r10d
    movl        %r10d, -4(%rbp)
    cmpl        $90, -28(%rbp)
    movl        $0, -32(%rbp)
    setl        -32(%rbp)
    cmpl        $0, -32(%rbp)
    jne         .Lloop.st.1
    cmpl        $90, -12(%rbp)
    movl        $0, -36(%rbp)
    setne       -36(%rbp)
    cmpl        $0, -36(%rbp)
    je          .Ltarget.if.en.8
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Ltarget.if.en.8:
    cmpl        $93, -28(%rbp)
    movl        $0, -40(%rbp)
    setne       -40(%rbp)
    cmpl        $0, -40(%rbp)
    je          .Ltarget.if.en.10
    movl        $2, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Ltarget.if.en.10:
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
    call        target@PLT
    movl        %eax, -4(%rbp)
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
