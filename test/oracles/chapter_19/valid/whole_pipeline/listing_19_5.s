    .globl      target
    .text       
target:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $4, -4(%rbp)
    movl        $0, -8(%rbp)
    cmpl        $0, -8(%rbp)
    je          .Ltarget.if.en.1
    movl        $3, -4(%rbp)
.Ltarget.if.en.1:
    movl        -4(%rbp), %r10d
    movl        %r10d, -12(%rbp)
    addl        $5, -12(%rbp)
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
    call        target@PLT
    movl        %eax, -4(%rbp)
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      flag
    .data       
    .align      4
flag:
    .long       1
    .section    .note.GNU-stack,"",@progbits
