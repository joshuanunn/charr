    .globl      main
    .text
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    cmpl        $5, i(%rip)
    movl        $0, -4(%rbp)
    setne       -4(%rbp)
    cmpl        $0, -4(%rbp)
    je          .Lmain.if.en.1
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lmain.if.en.1:
    cmpq        $7, l(%rip)
    movl        $0, -8(%rbp)
    setne       -8(%rbp)
    cmpl        $0, -8(%rbp)
    je          .Lmain.if.en.4
    movl        $2, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lmain.if.en.4:
    movl        $0, -12(%rbp)
    movl        $10, -16(%rbp)
.Lloop.st.1:
    cmpl        $0, -16(%rbp)
    movl        $0, -20(%rbp)
    setg        -20(%rbp)
    cmpl        $0, -20(%rbp)
    je          .Lloop.br.1
    movl        -12(%rbp), %r10d
    movl        %r10d, -24(%rbp)
    addl        $1, -24(%rbp)
    movl        -24(%rbp), %r10d
    movl        %r10d, -12(%rbp)
    movl        -16(%rbp), %r10d
    movl        %r10d, -28(%rbp)
    subl        $1, -28(%rbp)
    movl        -28(%rbp), %r10d
    movl        %r10d, -16(%rbp)
    jmp         .Lloop.st.1
.Lloop.br.1:
    cmpl        $10, -12(%rbp)
    movl        $0, -32(%rbp)
    setne       -32(%rbp)
    cmpl        $0, -32(%rbp)
    je          .Lmain.if.en.9
    movl        $3, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lmain.if.en.9:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .data
    .align      4
i:
    .long       5
    .globl      l
    .data
    .align      8
l:
    .quad       7
    .section    .note.GNU-stack,"",@progbits
