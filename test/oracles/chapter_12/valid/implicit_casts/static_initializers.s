    .globl      main
    .text
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    cmpl        $-2147483636, u(%rip)
    movl        $0, -4(%rbp)
    setne       -4(%rbp)
    cmpl        $0, -4(%rbp)
    je          .Lmain.if.en.1
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lmain.if.en.1:
    cmpl        $-2147483646, i(%rip)
    movl        $0, -8(%rbp)
    setne       -8(%rbp)
    cmpl        $0, -8(%rbp)
    je          .Lmain.if.en.4
    movl        $2, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lmain.if.en.4:
    movq        $-9223372036854775716, %r10
    cmpq        %r10, l(%rip)
    movl        $0, -12(%rbp)
    setne       -12(%rbp)
    cmpl        $0, -12(%rbp)
    je          .Lmain.if.en.7
    movl        $3, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lmain.if.en.7:
    movq        $2147483650, %r10
    cmpq        %r10, l2(%rip)
    movl        $0, -16(%rbp)
    setne       -16(%rbp)
    cmpl        $0, -16(%rbp)
    je          .Lmain.if.en.9
    movl        $4, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lmain.if.en.9:
    movq        $4294967294, %r10
    cmpq        %r10, ul(%rip)
    movl        $0, -20(%rbp)
    setne       -20(%rbp)
    cmpl        $0, -20(%rbp)
    je          .Lmain.if.en.11
    movl        $5, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lmain.if.en.11:
    movq        $9223372036854775798, %r10
    cmpq        %r10, ul2(%rip)
    movl        $0, -24(%rbp)
    setne       -24(%rbp)
    cmpl        $0, -24(%rbp)
    je          .Lmain.if.en.13
    movl        $6, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lmain.if.en.13:
    cmpl        $-2147483498, i2(%rip)
    movl        $0, -28(%rbp)
    setne       -28(%rbp)
    cmpl        $0, -28(%rbp)
    je          .Lmain.if.en.16
    movl        $7, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lmain.if.en.16:
    cmpl        $-2147483498, ui2(%rip)
    movl        $0, -32(%rbp)
    setne       -32(%rbp)
    cmpl        $0, -32(%rbp)
    je          .Lmain.if.en.18
    movl        $8, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lmain.if.en.18:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .globl      i
    .data
    .align      4
i:
    .long       -2147483646
    .globl      ul
    .data
    .align      8
ul:
    .quad       4294967294
    .globl      ul2
    .data
    .align      8
ul2:
    .quad       9223372036854775798
    .globl      ui2
    .data
    .align      4
ui2:
    .long       2147483798
    .globl      i2
    .data
    .align      4
i2:
    .long       -2147483498
    .globl      u
    .data
    .align      4
u:
    .long       2147483660
    .globl      l
    .data
    .align      8
l:
    .quad       -9223372036854775716
    .globl      l2
    .data
    .align      8
l2:
    .quad       2147483650
    .section    .note.GNU-stack,"",@progbits
