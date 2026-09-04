    .globl      foo
    .text
foo:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $96, %rsp
    movl        %edi, -4(%rbp)
    movl        %esi, -8(%rbp)
    movl        %edx, -12(%rbp)
    movl        %ecx, -16(%rbp)
    movl        %r8d, -20(%rbp)
    movl        %r9d, -24(%rbp)
    movl        16(%rbp), %r10d
    movl        %r10d, -28(%rbp)
    movl        24(%rbp), %r10d
    movl        %r10d, -32(%rbp)
    cmpl        $1, -4(%rbp)
    movl        $0, -36(%rbp)
    sete        -36(%rbp)
    cmpl        $0, -36(%rbp)
    je          .Lfoo.and.fl.3
    cmpl        $2, -8(%rbp)
    movl        $0, -40(%rbp)
    sete        -40(%rbp)
    cmpl        $0, -40(%rbp)
    je          .Lfoo.and.fl.3
    movl        $1, -44(%rbp)
    jmp         .Lfoo.and.en.4
.Lfoo.and.fl.3:
    movl        $0, -44(%rbp)
.Lfoo.and.en.4:
    cmpl        $0, -44(%rbp)
    je          .Lfoo.and.fl.7
    cmpl        $3, -12(%rbp)
    movl        $0, -48(%rbp)
    sete        -48(%rbp)
    cmpl        $0, -48(%rbp)
    je          .Lfoo.and.fl.7
    movl        $1, -52(%rbp)
    jmp         .Lfoo.and.en.8
.Lfoo.and.fl.7:
    movl        $0, -52(%rbp)
.Lfoo.and.en.8:
    cmpl        $0, -52(%rbp)
    je          .Lfoo.and.fl.11
    cmpl        $4, -16(%rbp)
    movl        $0, -56(%rbp)
    sete        -56(%rbp)
    cmpl        $0, -56(%rbp)
    je          .Lfoo.and.fl.11
    movl        $1, -60(%rbp)
    jmp         .Lfoo.and.en.12
.Lfoo.and.fl.11:
    movl        $0, -60(%rbp)
.Lfoo.and.en.12:
    cmpl        $0, -60(%rbp)
    je          .Lfoo.and.fl.15
    cmpl        $5, -20(%rbp)
    movl        $0, -64(%rbp)
    sete        -64(%rbp)
    cmpl        $0, -64(%rbp)
    je          .Lfoo.and.fl.15
    movl        $1, -68(%rbp)
    jmp         .Lfoo.and.en.16
.Lfoo.and.fl.15:
    movl        $0, -68(%rbp)
.Lfoo.and.en.16:
    cmpl        $0, -68(%rbp)
    je          .Lfoo.and.fl.19
    cmpl        $6, -24(%rbp)
    movl        $0, -72(%rbp)
    sete        -72(%rbp)
    cmpl        $0, -72(%rbp)
    je          .Lfoo.and.fl.19
    movl        $1, -76(%rbp)
    jmp         .Lfoo.and.en.20
.Lfoo.and.fl.19:
    movl        $0, -76(%rbp)
.Lfoo.and.en.20:
    cmpl        $0, -76(%rbp)
    je          .Lfoo.and.fl.23
    cmpl        $7, -28(%rbp)
    movl        $0, -80(%rbp)
    sete        -80(%rbp)
    cmpl        $0, -80(%rbp)
    je          .Lfoo.and.fl.23
    movl        $1, -84(%rbp)
    jmp         .Lfoo.and.en.24
.Lfoo.and.fl.23:
    movl        $0, -84(%rbp)
.Lfoo.and.en.24:
    cmpl        $0, -84(%rbp)
    je          .Lfoo.and.fl.27
    cmpl        $8, -32(%rbp)
    movl        $0, -88(%rbp)
    sete        -88(%rbp)
    cmpl        $0, -88(%rbp)
    je          .Lfoo.and.fl.27
    movl        $1, -92(%rbp)
    jmp         .Lfoo.and.en.28
.Lfoo.and.fl.27:
    movl        $0, -92(%rbp)
.Lfoo.and.en.28:
    movl        -92(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .globl      main
    .text
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $1, %edi
    movl        $2, %esi
    movl        $3, %edx
    movl        $4, %ecx
    movl        $5, %r8d
    movl        $6, %r9d
    pushq       $8
    pushq       $7
    call        foo@PLT
    addq        $16, %rsp
    movl        %eax, -4(%rbp)
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .section    .note.GNU-stack,"",@progbits
