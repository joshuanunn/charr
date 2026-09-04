    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movq        foo(%rip), %r10
    movq        %r10, -8(%rbp)
    addq        $5, -8(%rbp)
    movq        $4294967295, %r10
    cmpq        %r10, -8(%rbp)
    movl        $0, -12(%rbp)
    sete        -12(%rbp)
    cmpl        $0, -12(%rbp)
    je          .Lmain.if.en.2
    movq        $1152921504606846988, %r10
    movq        %r10, foo(%rip)
    movl        $1, -16(%rbp)
    cmpl        $0, -16(%rbp)
    je          .Lmain.if.en.4
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.4:
.Lmain.if.en.2:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .data       
    .align      8
foo:
    .quad       4294967290
    .section    .note.GNU-stack,"",@progbits
