    .globl      target
    .text
target:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $80, %rsp
    movl        %edi, -4(%rbp)
    movl        $3, -8(%rbp)
    cmpl        $0, -4(%rbp)
    je          .Ltarget.if.en.0
    movl        $4, -8(%rbp)
.Ltarget.if.en.0:
    movl        $10, -12(%rbp)
    cmpl        $0, -4(%rbp)
    je          .Ltarget.if.en.2
    movl        $9, -12(%rbp)
.Ltarget.if.en.2:
    movl        $-12, -16(%rbp)
    cmpl        $0, -4(%rbp)
    je          .Ltarget.if.en.5
    movl        $-11, -16(%rbp)
.Ltarget.if.en.5:
    movl        $-100, -20(%rbp)
    cmpl        $0, -4(%rbp)
    je          .Ltarget.if.en.7
    movl        $-101, -20(%rbp)
.Ltarget.if.en.7:
    cmpl        $0, -4(%rbp)
    je          .Ltarget.if.el.9
    cmpl        $4, -8(%rbp)
    movl        $0, -24(%rbp)
    sete        -24(%rbp)
    cmpl        $0, -24(%rbp)
    je          .Ltarget.and.fl.13
    cmpl        $9, -12(%rbp)
    movl        $0, -28(%rbp)
    sete        -28(%rbp)
    cmpl        $0, -28(%rbp)
    je          .Ltarget.and.fl.13
    movl        $1, -32(%rbp)
    jmp         .Ltarget.and.en.14
.Ltarget.and.fl.13:
    movl        $0, -32(%rbp)
.Ltarget.and.en.14:
    cmpl        $0, -32(%rbp)
    je          .Ltarget.and.fl.18
    cmpl        $-11, -16(%rbp)
    movl        $0, -36(%rbp)
    sete        -36(%rbp)
    cmpl        $0, -36(%rbp)
    je          .Ltarget.and.fl.18
    movl        $1, -40(%rbp)
    jmp         .Ltarget.and.en.19
.Ltarget.and.fl.18:
    movl        $0, -40(%rbp)
.Ltarget.and.en.19:
    cmpl        $0, -40(%rbp)
    je          .Ltarget.and.fl.23
    cmpl        $-101, -20(%rbp)
    movl        $0, -44(%rbp)
    sete        -44(%rbp)
    cmpl        $0, -44(%rbp)
    je          .Ltarget.and.fl.23
    movl        $1, -48(%rbp)
    jmp         .Ltarget.and.en.24
.Ltarget.and.fl.23:
    movl        $0, -48(%rbp)
.Ltarget.and.en.24:
    cmpl        $0, -48(%rbp)
    je          .Ltarget.if.en.25
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Ltarget.if.en.25:
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Ltarget.if.el.9:
    cmpl        $3, -8(%rbp)
    movl        $0, -52(%rbp)
    sete        -52(%rbp)
    cmpl        $0, -52(%rbp)
    je          .Ltarget.and.fl.29
    cmpl        $10, -12(%rbp)
    movl        $0, -56(%rbp)
    sete        -56(%rbp)
    cmpl        $0, -56(%rbp)
    je          .Ltarget.and.fl.29
    movl        $1, -60(%rbp)
    jmp         .Ltarget.and.en.30
.Ltarget.and.fl.29:
    movl        $0, -60(%rbp)
.Ltarget.and.en.30:
    cmpl        $0, -60(%rbp)
    je          .Ltarget.and.fl.34
    cmpl        $-12, -16(%rbp)
    movl        $0, -64(%rbp)
    sete        -64(%rbp)
    cmpl        $0, -64(%rbp)
    je          .Ltarget.and.fl.34
    movl        $1, -68(%rbp)
    jmp         .Ltarget.and.en.35
.Ltarget.and.fl.34:
    movl        $0, -68(%rbp)
.Ltarget.and.en.35:
    cmpl        $0, -68(%rbp)
    je          .Ltarget.and.fl.39
    cmpl        $-100, -20(%rbp)
    movl        $0, -72(%rbp)
    sete        -72(%rbp)
    cmpl        $0, -72(%rbp)
    je          .Ltarget.and.fl.39
    movl        $1, -76(%rbp)
    jmp         .Ltarget.and.en.40
.Ltarget.and.fl.39:
    movl        $0, -76(%rbp)
.Ltarget.and.en.40:
    cmpl        $0, -76(%rbp)
    je          .Ltarget.if.en.41
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Ltarget.if.en.41:
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .globl      main
    .text
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $0, %edi
    call        target@PLT
    movl        %eax, -4(%rbp)
    cmpl        $0, -4(%rbp)
    je          .Lmain.if.en.1
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lmain.if.en.1:
    movl        $1, %edi
    call        target@PLT
    movl        %eax, -8(%rbp)
    cmpl        $0, -8(%rbp)
    je          .Lmain.if.en.3
    movl        $2, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lmain.if.en.3:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .section    .note.GNU-stack,"",@progbits
