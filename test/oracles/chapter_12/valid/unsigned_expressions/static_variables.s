    .globl      main
    .text
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    movq        $9223372036854775803, %r10
    cmpq        %r10, x(%rip)
    movl        $0, -4(%rbp)
    setne       -4(%rbp)
    cmpl        $0, -4(%rbp)
    je          .Lmain.if.en.1
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lmain.if.en.1:
    movq        x(%rip), %r10
    movq        %r10, -16(%rbp)
    addq        $10, -16(%rbp)
    movq        -16(%rbp), %r10
    movq        %r10, x(%rip)
    movq        $-9223372036854775803, %r10
    cmpq        %r10, -16(%rbp)
    movl        $0, -20(%rbp)
    setne       -20(%rbp)
    cmpl        $0, -20(%rbp)
    je          .Lmain.if.en.5
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lmain.if.en.5:
    cmpq        $0, zero_long(%rip)
    jne         .Lmain.or.tr.7
    cmpl        $0, zero_int(%rip)
    jne         .Lmain.or.tr.7
    movl        $0, -24(%rbp)
    jmp         .Lmain.or.en.8
.Lmain.or.tr.7:
    movl        $1, -24(%rbp)
.Lmain.or.en.8:
    cmpl        $0, -24(%rbp)
    je          .Lmain.if.en.9
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lmain.if.en.9:
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .globl      zero_long
    .bss
    .align      8
zero_long:
    .zero       8
    .data
    .align      8
x:
    .quad       9223372036854775803
    .globl      zero_int
    .bss
    .align      4
zero_int:
    .zero       4
    .section    .note.GNU-stack,"",@progbits
