    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    movl        $-1, -4(%rbp)
.Lloop.st.1:
    cmpl        $-100, -4(%rbp)
    movl        $0, -20(%rbp)
    setge       -20(%rbp)
    cmpl        $0, -20(%rbp)
    je          .Lloop.br.1
    movl        -4(%rbp), %r10d
    movl        %r10d, -24(%rbp)
    subl        $3, -24(%rbp)
    movl        -24(%rbp), %r10d
    movl        %r10d, -4(%rbp)
    jmp         .Lloop.st.1
.Lloop.br.1:
    cmpl        $-103, -4(%rbp)
    movl        $0, -32(%rbp)
    sete        -32(%rbp)
    movl        -32(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
