    .globl      main
    .text
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $1000000, -4(%rbp)
    movl        shiftcount.1(%rip), %ecx
    shrl        %cl, -4(%rbp)
    cmpl        $31250, -4(%rbp)
    movl        $0, -8(%rbp)
    setne       -8(%rbp)
    cmpl        $0, -8(%rbp)
    je          .Lmain.if.en.12
    movl        $3, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lmain.if.en.12:
    movl        $1000000, -12(%rbp)
    movl        shiftcount.1(%rip), %ecx
    shll        %cl, -12(%rbp)
    cmpl        $32000000, -12(%rbp)
    movl        $0, -16(%rbp)
    setne       -16(%rbp)
    cmpl        $0, -16(%rbp)
    je          .Lmain.if.en.16
    movl        $4, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lmain.if.en.16:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .data
    .align      4
shiftcount.1:
    .long       5
    .section    .note.GNU-stack,"",@progbits
