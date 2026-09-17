    .globl      main
    .text
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $48, %rsp
    movl        a(%rip), %r10d
    movl        %r10d, -4(%rbp)
    movl        -4(%rbp), %r11d
    movq        %r11, -16(%rbp)
    movq        $4294967284, %r10
    cmpq        %r10, -16(%rbp)
    movl        $0, -20(%rbp)
    setne       -20(%rbp)
    cmpl        $0, -20(%rbp)
    je          .Lmain.if.en.3
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lmain.if.en.3:
    movl        a(%rip), %r10d
    movl        %r10d, -24(%rbp)
    movslq      -24(%rbp), %r11
    movq        %r11, -32(%rbp)
    cmpq        $-12, -32(%rbp)
    movl        $0, -36(%rbp)
    setne       -36(%rbp)
    cmpl        $0, -36(%rbp)
    je          .Lmain.if.en.7
    movl        $2, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lmain.if.en.7:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .globl      a
    .data
    .align      8
a:
    .quad       8589934580
    .section    .note.GNU-stack,"",@progbits
