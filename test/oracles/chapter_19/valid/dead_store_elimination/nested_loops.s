    .globl      target
    .text
target:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $64, %rsp
    movl        %edi, -4(%rbp)
    movl        %esi, -8(%rbp)
    movl        %edx, -12(%rbp)
    movl        %ecx, -16(%rbp)
.Lloop.ct.1:
    cmpl        $0, -4(%rbp)
    movl        $0, -20(%rbp)
    setg        -20(%rbp)
    cmpl        $0, -20(%rbp)
    je          .Lloop.br.1
.Lloop.ct.2:
    cmpl        $0, -12(%rbp)
    movl        $0, -24(%rbp)
    setg        -24(%rbp)
    cmpl        $0, -24(%rbp)
    je          .Lloop.br.2
    movl        -12(%rbp), %r10d
    movl        %r10d, -28(%rbp)
    movl        -16(%rbp), %r10d
    addl        %r10d, -28(%rbp)
    movl        -28(%rbp), %edi
    call        putchar@PLT
    movl        %eax, -32(%rbp)
    movl        -12(%rbp), %r10d
    movl        %r10d, -36(%rbp)
    subl        $1, -36(%rbp)
    movl        -36(%rbp), %r10d
    movl        %r10d, -12(%rbp)
    movl        -16(%rbp), %eax
    cdq
    movl        $2, %r10d
    idivl       %r10d
    movl        %edx, -40(%rbp)
    cmpl        $0, -40(%rbp)
    je          .Ltarget.if.en.6
    movl        -36(%rbp), %r10d
    movl        %r10d, -44(%rbp)
    subl        $2, -44(%rbp)
    movl        -44(%rbp), %r10d
    movl        %r10d, -12(%rbp)
.Ltarget.if.en.6:
    jmp         .Lloop.ct.2
.Lloop.br.2:
.Lloop.ct.3:
    cmpl        $0, -8(%rbp)
    movl        $0, -48(%rbp)
    setg        -48(%rbp)
    cmpl        $0, -48(%rbp)
    je          .Lloop.br.3
    movl        $10, -12(%rbp)
    movl        -8(%rbp), %r10d
    movl        %r10d, -52(%rbp)
    subl        $1, -52(%rbp)
    movl        -52(%rbp), %r10d
    movl        %r10d, -8(%rbp)
    jmp         .Lloop.ct.3
.Lloop.br.3:
    movl        -4(%rbp), %r10d
    movl        %r10d, -56(%rbp)
    subl        $1, -56(%rbp)
    movl        -56(%rbp), %r10d
    movl        %r10d, -4(%rbp)
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
