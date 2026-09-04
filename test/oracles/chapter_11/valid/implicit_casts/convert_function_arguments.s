    .globl      foo
    .text
foo:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $96, %rsp
    movq        %rdi, -8(%rbp)
    movl        %esi, -12(%rbp)
    movl        %edx, -16(%rbp)
    movl        %ecx, -20(%rbp)
    movq        %r8, -32(%rbp)
    movl        %r9d, -36(%rbp)
    movq        16(%rbp), %r10
    movq        %r10, -48(%rbp)
    movl        24(%rbp), %r10d
    movl        %r10d, -52(%rbp)
    cmpq        $-1, -8(%rbp)
    movl        $0, -56(%rbp)
    setne       -56(%rbp)
    cmpl        $0, -56(%rbp)
    je          .Lfoo.if.en.2
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lfoo.if.en.2:
    cmpl        $2, -12(%rbp)
    movl        $0, -60(%rbp)
    setne       -60(%rbp)
    cmpl        $0, -60(%rbp)
    je          .Lfoo.if.en.4
    movl        $2, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lfoo.if.en.4:
    cmpl        $0, -16(%rbp)
    movl        $0, -64(%rbp)
    setne       -64(%rbp)
    cmpl        $0, -64(%rbp)
    je          .Lfoo.if.en.6
    movl        $3, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lfoo.if.en.6:
    cmpl        $-5, -20(%rbp)
    movl        $0, -68(%rbp)
    setne       -68(%rbp)
    cmpl        $0, -68(%rbp)
    je          .Lfoo.if.en.9
    movl        $4, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lfoo.if.en.9:
    cmpq        $-101, -32(%rbp)
    movl        $0, -72(%rbp)
    setne       -72(%rbp)
    cmpl        $0, -72(%rbp)
    je          .Lfoo.if.en.12
    movl        $5, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lfoo.if.en.12:
    cmpl        $-123, -36(%rbp)
    movl        $0, -76(%rbp)
    setne       -76(%rbp)
    cmpl        $0, -76(%rbp)
    je          .Lfoo.if.en.15
    movl        $6, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lfoo.if.en.15:
    cmpq        $-10, -48(%rbp)
    movl        $0, -80(%rbp)
    setne       -80(%rbp)
    cmpl        $0, -80(%rbp)
    je          .Lfoo.if.en.18
    movl        $7, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lfoo.if.en.18:
    cmpl        $1234, -52(%rbp)
    movl        $0, -84(%rbp)
    setne       -84(%rbp)
    cmpl        $0, -84(%rbp)
    je          .Lfoo.if.en.20
    movl        $8, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lfoo.if.en.20:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .globl      main
    .text
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movq        $-1, %rdi
    movl        $2, %esi
    movl        $0, %edx
    movl        $-5, %ecx
    movq        $-101, %r8
    movl        $-123, %r9d
    pushq       $1234
    pushq       $-10
    call        foo@PLT
    addq        $16, %rsp
    movl        %eax, -4(%rbp)
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .section    .note.GNU-stack,"",@progbits
