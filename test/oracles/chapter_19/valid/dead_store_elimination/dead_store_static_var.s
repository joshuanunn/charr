    .globl      target
    .text       
target:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        %edi, -4(%rbp)
    movl        -4(%rbp), %r10d
    movl        %r10d, i(%rip)
    movl        -4(%rbp), %r10d
    movl        %r10d, -8(%rbp)
    addl        $1, -8(%rbp)
    movl        -8(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    movl        $2, %edi
    call        target@PLT
    movl        %eax, -4(%rbp)
    cmpl        $2, i(%rip)
    movl        $0, -8(%rbp)
    setne       -8(%rbp)
    cmpl        $0, -8(%rbp)
    je          .Lmain.if.en.2
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.2:
    cmpl        $3, -4(%rbp)
    movl        $0, -12(%rbp)
    setne       -12(%rbp)
    cmpl        $0, -12(%rbp)
    je          .Lmain.if.en.4
    movl        $2, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.4:
    movl        $-1, %edi
    call        target@PLT
    movl        %eax, -16(%rbp)
    cmpl        $-1, i(%rip)
    movl        $0, -20(%rbp)
    setne       -20(%rbp)
    cmpl        $0, -20(%rbp)
    je          .Lmain.if.en.9
    movl        $3, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.9:
    cmpl        $0, -16(%rbp)
    movl        $0, -24(%rbp)
    setne       -24(%rbp)
    cmpl        $0, -24(%rbp)
    je          .Lmain.if.en.11
    movl        $4, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.11:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      i
    .bss        
    .align      4
i:
    .zero       4
    .section    .note.GNU-stack,"",@progbits
