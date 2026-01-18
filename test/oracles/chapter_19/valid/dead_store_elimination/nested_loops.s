    .globl      target
    .text       
target:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $64, %rsp
    movl        %edi, -44(%rbp)
    movl        %esi, -48(%rbp)
    movl        %edx, -52(%rbp)
    movl        %ecx, -56(%rbp)
.Lloop.ct.1:
    cmpl        $0, -44(%rbp)
    movl        $0, -4(%rbp)
    setg        -4(%rbp)
    cmpl        $0, -4(%rbp)
    je          .Lloop.br.1
.Lloop.ct.2:
    cmpl        $0, -52(%rbp)
    movl        $0, -8(%rbp)
    setg        -8(%rbp)
    cmpl        $0, -8(%rbp)
    je          .Lloop.br.2
    movl        -52(%rbp), %r10d
    movl        %r10d, -12(%rbp)
    movl        -56(%rbp), %r10d
    addl        %r10d, -12(%rbp)
    movl        -12(%rbp), %edi
    call        putchar@PLT
    movl        %eax, -16(%rbp)
    movl        -52(%rbp), %r10d
    movl        %r10d, -20(%rbp)
    subl        $1, -20(%rbp)
    movl        -20(%rbp), %r10d
    movl        %r10d, -52(%rbp)
    movl        -56(%rbp), %eax
    cdq         
    movl        $2, %r10d
    idivl       %r10d
    movl        %edx, -24(%rbp)
    cmpl        $0, -24(%rbp)
    je          .Ltarget.if.en.6
    movl        -20(%rbp), %r10d
    movl        %r10d, -28(%rbp)
    subl        $2, -28(%rbp)
    movl        -28(%rbp), %r10d
    movl        %r10d, -52(%rbp)
.Ltarget.if.en.6:
    jmp         .Lloop.ct.2
.Lloop.br.2:
.Lloop.ct.3:
    cmpl        $0, -48(%rbp)
    movl        $0, -32(%rbp)
    setg        -32(%rbp)
    cmpl        $0, -32(%rbp)
    je          .Lloop.br.3
    movl        $10, -52(%rbp)
    movl        -48(%rbp), %r10d
    movl        %r10d, -36(%rbp)
    subl        $1, -36(%rbp)
    movl        -36(%rbp), %r10d
    movl        %r10d, -48(%rbp)
    jmp         .Lloop.ct.3
.Lloop.br.3:
    movl        -44(%rbp), %r10d
    movl        %r10d, -40(%rbp)
    subl        $1, -40(%rbp)
    movl        -40(%rbp), %r10d
    movl        %r10d, -44(%rbp)
    jmp         .Lloop.ct.1
.Lloop.br.1:
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
    movl        $5, %edi
    movl        $4, %esi
    movl        $3, %edx
    movl        $65, %ecx
    call        target@PLT
    movl        %eax, -4(%rbp)
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
