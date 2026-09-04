    .globl      target
    .text
target:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        %edi, -4(%rbp)
    movl        %esi, -8(%rbp)
    movl        %edx, -12(%rbp)
    movl        -12(%rbp), %r10d
    movl        %r10d, -16(%rbp)
    movl        -12(%rbp), %r10d
    addl        %r10d, -16(%rbp)
    movl        -16(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .globl      main
    .text
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $0, %edi
    movl        $1, %esi
    movl        $10, %edx
    call        target@PLT
    movl        %eax, -4(%rbp)
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .section    .note.GNU-stack,"",@progbits
