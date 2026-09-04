    .globl      main
    .text
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        x(%rip), %r10d
    movl        %r10d, -4(%rbp)
    movl        -4(%rbp), %r11d
    imull       $2, %r11d
    movl        %r11d, -4(%rbp)
    cmpl        $30, -4(%rbp)
    movl        $0, -8(%rbp)
    sete        -8(%rbp)
    cmpl        $0, -8(%rbp)
    je          .Lmain.if.en.5
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lmain.if.en.5:
    movl        $5, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .globl      x
    .data
    .align      4
x:
    .long       15
    .section    .note.GNU-stack,"",@progbits
