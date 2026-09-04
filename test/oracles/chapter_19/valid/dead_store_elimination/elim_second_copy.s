    .globl      callee
    .text
callee:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        %edi, -4(%rbp)
    movl        -4(%rbp), %r10d
    movl        %r10d, -8(%rbp)
    movl        -8(%rbp), %r11d
    imull       $2, %r11d
    movl        %r11d, -8(%rbp)
    movl        -8(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .globl      target
    .text
target:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    movl        %edi, -4(%rbp)
    movl        %esi, -8(%rbp)
    movl        -4(%rbp), %r10d
    movl        %r10d, -12(%rbp)
    addl        $1, -12(%rbp)
    movl        -12(%rbp), %r10d
    movl        %r10d, -16(%rbp)
    cmpl        $0, -8(%rbp)
    je          .Ltarget.if.en.1
    movl        -4(%rbp), %r10d
    movl        %r10d, -20(%rbp)
    subl        $1, -20(%rbp)
    movl        -20(%rbp), %r10d
    movl        %r10d, -16(%rbp)
.Ltarget.if.en.1:
    movl        -16(%rbp), %edi
    call        callee@PLT
    movl        %eax, -24(%rbp)
    movl        -24(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .globl      main
    .text
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $4, %edi
    movl        $0, %esi
    call        target@PLT
    movl        %eax, -4(%rbp)
    cmpl        $10, -4(%rbp)
    movl        $0, -8(%rbp)
    setne       -8(%rbp)
    cmpl        $0, -8(%rbp)
    je          .Lmain.if.en.2
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lmain.if.en.2:
    movl        $3, %edi
    movl        $1, %esi
    call        target@PLT
    movl        %eax, -12(%rbp)
    cmpl        $4, -12(%rbp)
    movl        $0, -16(%rbp)
    setne       -16(%rbp)
    cmpl        $0, -16(%rbp)
    je          .Lmain.if.en.5
    movl        $2, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lmain.if.en.5:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .section    .note.GNU-stack,"",@progbits
