    .globl      g
    .text       
g:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $48, %rsp
    movl        %edi, -4(%rbp)
    movl        %esi, -8(%rbp)
    movl        %edx, -12(%rbp)
    movl        %ecx, -16(%rbp)
    cmpl        $2, -4(%rbp)
    movl        $0, -20(%rbp)
    sete        -20(%rbp)
    cmpl        $0, -20(%rbp)
    je          .Lg.and.fl.3
    cmpl        $4, -8(%rbp)
    movl        $0, -24(%rbp)
    sete        -24(%rbp)
    cmpl        $0, -24(%rbp)
    je          .Lg.and.fl.3
    movl        $1, -28(%rbp)
    jmp         .Lg.and.en.4
.Lg.and.fl.3:
    movl        $0, -28(%rbp)
.Lg.and.en.4:
    cmpl        $0, -28(%rbp)
    je          .Lg.and.fl.7
    cmpl        $6, -12(%rbp)
    movl        $0, -32(%rbp)
    sete        -32(%rbp)
    cmpl        $0, -32(%rbp)
    je          .Lg.and.fl.7
    movl        $1, -36(%rbp)
    jmp         .Lg.and.en.8
.Lg.and.fl.7:
    movl        $0, -36(%rbp)
.Lg.and.en.8:
    cmpl        $0, -36(%rbp)
    je          .Lg.and.fl.11
    cmpl        $8, -16(%rbp)
    movl        $0, -40(%rbp)
    sete        -40(%rbp)
    cmpl        $0, -40(%rbp)
    je          .Lg.and.fl.11
    movl        $1, -44(%rbp)
    jmp         .Lg.and.en.12
.Lg.and.fl.11:
    movl        $0, -44(%rbp)
.Lg.and.en.12:
    cmpl        $0, -44(%rbp)
    je          .Lg.if.en.13
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lg.if.en.13:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      f
    .text       
f:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $80, %rsp
    movl        %edi, -4(%rbp)
    movl        %esi, -8(%rbp)
    movl        %edx, -12(%rbp)
    movl        %ecx, -16(%rbp)
    movl        -4(%rbp), %r10d
    movl        %r10d, -20(%rbp)
    movl        -20(%rbp), %r11d
    imull       $2, %r11d
    movl        %r11d, -20(%rbp)
    movl        -8(%rbp), %r10d
    movl        %r10d, -24(%rbp)
    movl        -24(%rbp), %r11d
    imull       $2, %r11d
    movl        %r11d, -24(%rbp)
    movl        -12(%rbp), %r10d
    movl        %r10d, -28(%rbp)
    movl        -28(%rbp), %r11d
    imull       $2, %r11d
    movl        %r11d, -28(%rbp)
    movl        -16(%rbp), %r10d
    movl        %r10d, -32(%rbp)
    movl        -32(%rbp), %r11d
    imull       $2, %r11d
    movl        %r11d, -32(%rbp)
    movl        -20(%rbp), %edi
    movl        -24(%rbp), %esi
    movl        -28(%rbp), %edx
    movl        -32(%rbp), %ecx
    call        g@PLT
    movl        %eax, -36(%rbp)
    cmpl        $1, -36(%rbp)
    movl        $0, -40(%rbp)
    sete        -40(%rbp)
    cmpl        $0, -40(%rbp)
    je          .Lf.and.fl.8
    cmpl        $1, -4(%rbp)
    movl        $0, -44(%rbp)
    sete        -44(%rbp)
    cmpl        $0, -44(%rbp)
    je          .Lf.and.fl.8
    movl        $1, -48(%rbp)
    jmp         .Lf.and.en.9
.Lf.and.fl.8:
    movl        $0, -48(%rbp)
.Lf.and.en.9:
    cmpl        $0, -48(%rbp)
    je          .Lf.and.fl.12
    cmpl        $2, -8(%rbp)
    movl        $0, -52(%rbp)
    sete        -52(%rbp)
    cmpl        $0, -52(%rbp)
    je          .Lf.and.fl.12
    movl        $1, -56(%rbp)
    jmp         .Lf.and.en.13
.Lf.and.fl.12:
    movl        $0, -56(%rbp)
.Lf.and.en.13:
    cmpl        $0, -56(%rbp)
    je          .Lf.and.fl.16
    cmpl        $3, -12(%rbp)
    movl        $0, -60(%rbp)
    sete        -60(%rbp)
    cmpl        $0, -60(%rbp)
    je          .Lf.and.fl.16
    movl        $1, -64(%rbp)
    jmp         .Lf.and.en.17
.Lf.and.fl.16:
    movl        $0, -64(%rbp)
.Lf.and.en.17:
    cmpl        $0, -64(%rbp)
    je          .Lf.and.fl.20
    cmpl        $4, -16(%rbp)
    movl        $0, -68(%rbp)
    sete        -68(%rbp)
    cmpl        $0, -68(%rbp)
    je          .Lf.and.fl.20
    movl        $1, -72(%rbp)
    jmp         .Lf.and.en.21
.Lf.and.fl.20:
    movl        $0, -72(%rbp)
.Lf.and.en.21:
    movl        -72(%rbp), %eax
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
    call        f@PLT
    movl        %eax, -4(%rbp)
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
