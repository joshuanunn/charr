    .globl      target
    .text       
target:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    movq        %rdi, -8(%rbp)
    movq        -8(%rbp), %r10
    movq        %r10, -16(%rbp)
    movq        -16(%rbp), %r11
    imulq       $5, %r11
    movq        %r11, -16(%rbp)
    movq        -16(%rbp), %r10
    movq        %r10, -24(%rbp)
    subq        $10, -24(%rbp)
    movq        $21474836440, %r10
    cmpq        %r10, -24(%rbp)
    movl        $0, -28(%rbp)
    sete        -28(%rbp)
    cmpl        $0, -28(%rbp)
    je          .Ltarget.if.en.3
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Ltarget.if.en.3:
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
    movq        $4294967290, %rdi
    call        target@PLT
    movl        %eax, -4(%rbp)
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
