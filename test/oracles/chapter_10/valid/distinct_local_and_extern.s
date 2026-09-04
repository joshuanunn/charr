    .globl      return_a
    .text
return_a:
    pushq       %rbp
    movq        %rsp, %rbp
    movl        a(%rip), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .globl      main
    .text
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    cmpl        $5, a(%rip)
    movl        $0, -4(%rbp)
    setne       -4(%rbp)
    cmpl        $0, -4(%rbp)
    je          .Lmain.if.en.1
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lmain.if.en.1:
    movl        $4, a(%rip)
    call        return_a@PLT
    movl        %eax, -8(%rbp)
    movl        $3, -12(%rbp)
    movl        -8(%rbp), %r10d
    addl        %r10d, -12(%rbp)
    movl        -12(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .globl      a
    .data
    .align      4
a:
    .long       5
    .section    .note.GNU-stack,"",@progbits
