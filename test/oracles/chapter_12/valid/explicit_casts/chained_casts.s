    .globl      main
    .text
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $48, %rsp
    movl        ui(%rip), %r10d
    movl        %r10d, -4(%rbp)
    movslq      -4(%rbp), %r11
    movq        %r11, -16(%rbp)
    cmpq        $-96, -16(%rbp)
    movl        $0, -20(%rbp)
    setne       -20(%rbp)
    cmpl        $0, -20(%rbp)
    je          .Lmain.if.en.4
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lmain.if.en.4:
    movl        ui(%rip), %r10d
    movl        %r10d, -24(%rbp)
    movslq      -24(%rbp), %r11
    movq        %r11, -32(%rbp)
    cmpq        $-96, -32(%rbp)
    movl        $0, -36(%rbp)
    setne       -36(%rbp)
    cmpl        $0, -36(%rbp)
    je          .Lmain.if.en.8
    movl        $2, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lmain.if.en.8:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .globl      ui
    .data
    .align      4
ui:
    .long       4294967200
    .section    .note.GNU-stack,"",@progbits
