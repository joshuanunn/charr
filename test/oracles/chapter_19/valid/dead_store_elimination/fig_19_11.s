    .globl      callee
    .text       
callee:
    pushq       %rbp
    movq        %rsp, %rbp
    movl        $4, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      callee2
    .text       
callee2:
    pushq       %rbp
    movq        %rsp, %rbp
    movl        $5, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      target
    .text       
target:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        %edi, -4(%rbp)
    cmpl        $0, -4(%rbp)
    je          .Ltarget.if.el.1
    call        callee@PLT
    movl        %eax, -8(%rbp)
    movl        -8(%rbp), %r10d
    movl        %r10d, -12(%rbp)
    jmp         .Ltarget.if.en.0
.Ltarget.if.el.1:
    call        callee2@PLT
    movl        %eax, -16(%rbp)
    movl        -16(%rbp), %r10d
    movl        %r10d, -12(%rbp)
.Ltarget.if.en.0:
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
    movl        $1, %edi
    call        target@PLT
    movl        %eax, -4(%rbp)
    cmpl        $4, -4(%rbp)
    movl        $0, -8(%rbp)
    setne       -8(%rbp)
    cmpl        $0, -8(%rbp)
    je          .Lmain.if.en.2
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.2:
    movl        $0, %edi
    call        target@PLT
    movl        %eax, -12(%rbp)
    cmpl        $5, -12(%rbp)
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
