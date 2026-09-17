    .globl      main
    .text
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $64, %rsp
    movq        negative_one(%rip), %r10
    movq        %r10, -8(%rbp)
    negq        -8(%rbp)
    movq        -8(%rbp), %r10
    movq        %r10, negative_one(%rip)
    movq        -8(%rbp), %r10
    movq        %r10, -16(%rbp)
    movq        $68719476736, %r11
    cmpq        -16(%rbp), %r11
    movl        $0, -20(%rbp)
    setae       -20(%rbp)
    cmpl        $0, -20(%rbp)
    je          .Lmain.if.en.3
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lmain.if.en.3:
    movq        $-2147483658, %r10
    movq        %r10, -32(%rbp)
    movq        zero(%rip), %r10
    cmpq        %r10, -32(%rbp)
    movl        $0, -36(%rbp)
    setge       -36(%rbp)
    cmpl        $0, -36(%rbp)
    je          .Lmain.if.en.6
    movl        $2, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lmain.if.en.6:
    movq        $4294967296, %r10
    movq        %r10, -48(%rbp)
    cmpq        $0, -48(%rbp)
    movl        $0, -52(%rbp)
    sete        -52(%rbp)
    cmpl        $0, -52(%rbp)
    je          .Lmain.if.en.9
    movl        $3, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lmain.if.en.9:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .globl      negative_one
    .data
    .align      8
negative_one:
    .quad       1
    .globl      zero
    .bss
    .align      8
zero:
    .zero       8
    .section    .note.GNU-stack,"",@progbits
