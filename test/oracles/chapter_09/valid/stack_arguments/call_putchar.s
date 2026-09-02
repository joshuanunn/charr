    .globl      foo
    .text       
foo:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $48, %rsp
    movl        %edi, -4(%rbp)
    movl        %esi, -8(%rbp)
    movl        %edx, -12(%rbp)
    movl        %ecx, -16(%rbp)
    movl        %r8d, -20(%rbp)
    movl        %r9d, -24(%rbp)
    movl        16(%rbp), %r10d
    movl        %r10d, -28(%rbp)
    movl        24(%rbp), %r10d
    movl        %r10d, -32(%rbp)
    movl        -32(%rbp), %edi
    call        putchar@PLT
    movl        %eax, -36(%rbp)
    movl        -4(%rbp), %r10d
    movl        %r10d, -40(%rbp)
    movl        -28(%rbp), %r10d
    addl        %r10d, -40(%rbp)
    movl        -40(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $1, %edi
    movl        $2, %esi
    movl        $3, %edx
    movl        $4, %ecx
    movl        $5, %r8d
    movl        $6, %r9d
    pushq       $65
    pushq       $7
    call        foo@PLT
    addq        $16, %rsp
    movl        %eax, -4(%rbp)
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
