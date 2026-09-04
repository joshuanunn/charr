    .globl      my_function
    .text
my_function:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $48, %rsp
    movq        %rdi, -8(%rbp)
    movq        %rsi, -16(%rbp)
    movq        %rdx, -24(%rbp)
    movq        -8(%rbp), %r10
    movq        %r10, -32(%rbp)
    movq        -16(%rbp), %r10
    addq        %r10, -32(%rbp)
    movq        -32(%rbp), %r10
    movq        %r10, -40(%rbp)
    movq        -24(%rbp), %r10
    addq        %r10, -40(%rbp)
    movl        -40(%rbp), %r10d
    movl        %r10d, -44(%rbp)
    movl        -44(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .globl      main
    .text
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $96, %rsp
    movq        $4, a(%rip)
    movl        $0, -4(%rbp)
    movq        $1099511627776, %r10
    movq        %r10, -16(%rbp)
.Lloop.st.1:
    movq        $0, -24(%rbp)
    movq        -24(%rbp), %r10
    cmpq        %r10, -16(%rbp)
    movl        $0, -28(%rbp)
    setg        -28(%rbp)
    cmpl        $0, -28(%rbp)
    je          .Lloop.br.1
    movl        -4(%rbp), %r10d
    movl        %r10d, -32(%rbp)
    addl        $1, -32(%rbp)
    movl        -32(%rbp), %r10d
    movl        %r10d, -4(%rbp)
    movq        $2, -40(%rbp)
    movq        -16(%rbp), %rax
    cqo
    idivq       -40(%rbp)
    movq        %rax, -48(%rbp)
    movq        -48(%rbp), %r10
    movq        %r10, -16(%rbp)
    jmp         .Lloop.st.1
.Lloop.br.1:
    movq        $1, -56(%rbp)
    movq        $1, %r11
    cmpq        -56(%rbp), %r11
    movl        $0, -60(%rbp)
    setne       -60(%rbp)
    cmpl        $0, -60(%rbp)
    je          .Lmain.if.en.8
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lmain.if.en.8:
    movq        $2, -72(%rbp)
    movq        $2, %r11
    cmpq        -72(%rbp), %r11
    movl        $0, -76(%rbp)
    setne       -76(%rbp)
    cmpl        $0, -76(%rbp)
    je          .Lmain.if.en.11
    movl        $2, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lmain.if.en.11:
    movl        $0, -80(%rbp)
    cmpl        $0, -80(%rbp)
    je          .Lmain.if.en.14
    movl        $3, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lmain.if.en.14:
    movq        $1, %rdi
    movq        $2, %rsi
    movq        $3, %rdx
    call        my_function@PLT
    movl        %eax, -84(%rbp)
    cmpl        $6, -84(%rbp)
    movl        $0, -88(%rbp)
    setne       -88(%rbp)
    cmpl        $0, -88(%rbp)
    je          .Lmain.if.en.17
    movl        $4, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lmain.if.en.17:
    cmpl        $41, -4(%rbp)
    movl        $0, -92(%rbp)
    setne       -92(%rbp)
    cmpl        $0, -92(%rbp)
    je          .Lmain.if.en.19
    movl        $5, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lmain.if.en.19:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .bss
    .align      8
a:
    .zero       8
    .section    .note.GNU-stack,"",@progbits
