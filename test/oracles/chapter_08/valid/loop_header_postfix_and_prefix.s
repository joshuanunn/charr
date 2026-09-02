    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    movl        $100, -4(%rbp)
    movl        $0, -8(%rbp)
.Lloop.ct.1:
    movl        -4(%rbp), %r10d
    movl        %r10d, -12(%rbp)
    subl        $1, -4(%rbp)
    cmpl        $0, -12(%rbp)
    je          .Lloop.br.1
    addl        $1, -8(%rbp)
    jmp         .Lloop.ct.1
.Lloop.br.1:
    cmpl        $100, -8(%rbp)
    movl        $0, -16(%rbp)
    setne       -16(%rbp)
    cmpl        $0, -16(%rbp)
    je          .Lmain.if.en.3
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.3:
    movl        $100, -4(%rbp)
    movl        $0, -8(%rbp)
.Lloop.ct.2:
    subl        $1, -4(%rbp)
    cmpl        $0, -4(%rbp)
    je          .Lloop.br.2
    addl        $1, -8(%rbp)
    jmp         .Lloop.ct.2
.Lloop.br.2:
    cmpl        $99, -8(%rbp)
    movl        $0, -20(%rbp)
    setne       -20(%rbp)
    cmpl        $0, -20(%rbp)
    je          .Lmain.if.en.6
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.6:
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
