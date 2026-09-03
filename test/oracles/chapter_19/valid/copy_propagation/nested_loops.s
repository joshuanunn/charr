    .globl      inner_loop1
    .text       
inner_loop1:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $80, %rsp
    movl        %edi, -4(%rbp)
    movl        %esi, -8(%rbp)
    movl        %edx, -12(%rbp)
    movl        %ecx, -16(%rbp)
    movl        %r8d, -20(%rbp)
    movl        %r9d, -24(%rbp)
    cmpl        $1, -4(%rbp)
    movl        $0, -28(%rbp)
    setne       -28(%rbp)
    cmpl        $0, -28(%rbp)
    jne         .Linner_loop1.or.tr.3
    cmpl        $11, -8(%rbp)
    movl        $0, -32(%rbp)
    setne       -32(%rbp)
    cmpl        $0, -32(%rbp)
    jne         .Linner_loop1.or.tr.3
    movl        $0, -36(%rbp)
    jmp         .Linner_loop1.or.en.4
.Linner_loop1.or.tr.3:
    movl        $1, -36(%rbp)
.Linner_loop1.or.en.4:
    cmpl        $0, -36(%rbp)
    jne         .Linner_loop1.or.tr.7
    cmpl        $12, -12(%rbp)
    movl        $0, -40(%rbp)
    setne       -40(%rbp)
    cmpl        $0, -40(%rbp)
    jne         .Linner_loop1.or.tr.7
    movl        $0, -44(%rbp)
    jmp         .Linner_loop1.or.en.8
.Linner_loop1.or.tr.7:
    movl        $1, -44(%rbp)
.Linner_loop1.or.en.8:
    cmpl        $0, -44(%rbp)
    jne         .Linner_loop1.or.tr.11
    cmpl        $4, -16(%rbp)
    movl        $0, -48(%rbp)
    setne       -48(%rbp)
    cmpl        $0, -48(%rbp)
    jne         .Linner_loop1.or.tr.11
    movl        $0, -52(%rbp)
    jmp         .Linner_loop1.or.en.12
.Linner_loop1.or.tr.11:
    movl        $1, -52(%rbp)
.Linner_loop1.or.en.12:
    cmpl        $0, -52(%rbp)
    jne         .Linner_loop1.or.tr.15
    cmpl        $20, -20(%rbp)
    movl        $0, -56(%rbp)
    setne       -56(%rbp)
    cmpl        $0, -56(%rbp)
    jne         .Linner_loop1.or.tr.15
    movl        $0, -60(%rbp)
    jmp         .Linner_loop1.or.en.16
.Linner_loop1.or.tr.15:
    movl        $1, -60(%rbp)
.Linner_loop1.or.en.16:
    cmpl        $0, -60(%rbp)
    jne         .Linner_loop1.or.tr.19
    cmpl        $100, -24(%rbp)
    movl        $0, -64(%rbp)
    setne       -64(%rbp)
    cmpl        $0, -64(%rbp)
    jne         .Linner_loop1.or.tr.19
    movl        $0, -68(%rbp)
    jmp         .Linner_loop1.or.en.20
.Linner_loop1.or.tr.19:
    movl        $1, -68(%rbp)
.Linner_loop1.or.en.20:
    cmpl        $0, -68(%rbp)
    je          .Linner_loop1.if.en.21
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Linner_loop1.if.en.21:
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      inner_loop2
    .text       
inner_loop2:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $128, %rsp
    movl        %edi, -4(%rbp)
    movl        %esi, -8(%rbp)
    movl        %edx, -12(%rbp)
    movl        %ecx, -16(%rbp)
    movl        %r8d, -20(%rbp)
    movl        %r9d, -24(%rbp)
    cmpl        $0, outer_flag(%rip)
    movl        $0, -28(%rbp)
    sete        -28(%rbp)
    cmpl        $0, -28(%rbp)
    je          .Linner_loop2.if.el.2
    cmpl        $1, -4(%rbp)
    movl        $0, -32(%rbp)
    setne       -32(%rbp)
    cmpl        $0, -32(%rbp)
    jne         .Linner_loop2.or.tr.6
    cmpl        $2, -8(%rbp)
    movl        $0, -36(%rbp)
    setne       -36(%rbp)
    cmpl        $0, -36(%rbp)
    jne         .Linner_loop2.or.tr.6
    movl        $0, -40(%rbp)
    jmp         .Linner_loop2.or.en.7
.Linner_loop2.or.tr.6:
    movl        $1, -40(%rbp)
.Linner_loop2.or.en.7:
    cmpl        $0, -40(%rbp)
    jne         .Linner_loop2.or.tr.10
    cmpl        $3, -12(%rbp)
    movl        $0, -44(%rbp)
    setne       -44(%rbp)
    cmpl        $0, -44(%rbp)
    jne         .Linner_loop2.or.tr.10
    movl        $0, -48(%rbp)
    jmp         .Linner_loop2.or.en.11
.Linner_loop2.or.tr.10:
    movl        $1, -48(%rbp)
.Linner_loop2.or.en.11:
    cmpl        $0, -48(%rbp)
    jne         .Linner_loop2.or.tr.14
    cmpl        $4, -16(%rbp)
    movl        $0, -52(%rbp)
    setne       -52(%rbp)
    cmpl        $0, -52(%rbp)
    jne         .Linner_loop2.or.tr.14
    movl        $0, -56(%rbp)
    jmp         .Linner_loop2.or.en.15
.Linner_loop2.or.tr.14:
    movl        $1, -56(%rbp)
.Linner_loop2.or.en.15:
    cmpl        $0, -56(%rbp)
    jne         .Linner_loop2.or.tr.18
    cmpl        $5, -20(%rbp)
    movl        $0, -60(%rbp)
    setne       -60(%rbp)
    cmpl        $0, -60(%rbp)
    jne         .Linner_loop2.or.tr.18
    movl        $0, -64(%rbp)
    jmp         .Linner_loop2.or.en.19
.Linner_loop2.or.tr.18:
    movl        $1, -64(%rbp)
.Linner_loop2.or.en.19:
    cmpl        $0, -64(%rbp)
    jne         .Linner_loop2.or.tr.22
    cmpl        $100, -24(%rbp)
    movl        $0, -68(%rbp)
    setne       -68(%rbp)
    cmpl        $0, -68(%rbp)
    jne         .Linner_loop2.or.tr.22
    movl        $0, -72(%rbp)
    jmp         .Linner_loop2.or.en.23
.Linner_loop2.or.tr.22:
    movl        $1, -72(%rbp)
.Linner_loop2.or.en.23:
    cmpl        $0, -72(%rbp)
    je          .Linner_loop2.if.en.24
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Linner_loop2.if.en.24:
    jmp         .Linner_loop2.if.en.1
.Linner_loop2.if.el.2:
    cmpl        $10, -4(%rbp)
    movl        $0, -76(%rbp)
    setne       -76(%rbp)
    cmpl        $0, -76(%rbp)
    jne         .Linner_loop2.or.tr.28
    cmpl        $11, -8(%rbp)
    movl        $0, -80(%rbp)
    setne       -80(%rbp)
    cmpl        $0, -80(%rbp)
    jne         .Linner_loop2.or.tr.28
    movl        $0, -84(%rbp)
    jmp         .Linner_loop2.or.en.29
.Linner_loop2.or.tr.28:
    movl        $1, -84(%rbp)
.Linner_loop2.or.en.29:
    cmpl        $0, -84(%rbp)
    jne         .Linner_loop2.or.tr.32
    cmpl        $12, -12(%rbp)
    movl        $0, -88(%rbp)
    setne       -88(%rbp)
    cmpl        $0, -88(%rbp)
    jne         .Linner_loop2.or.tr.32
    movl        $0, -92(%rbp)
    jmp         .Linner_loop2.or.en.33
.Linner_loop2.or.tr.32:
    movl        $1, -92(%rbp)
.Linner_loop2.or.en.33:
    cmpl        $0, -92(%rbp)
    jne         .Linner_loop2.or.tr.36
    cmpl        $4, -16(%rbp)
    movl        $0, -96(%rbp)
    setne       -96(%rbp)
    cmpl        $0, -96(%rbp)
    jne         .Linner_loop2.or.tr.36
    movl        $0, -100(%rbp)
    jmp         .Linner_loop2.or.en.37
.Linner_loop2.or.tr.36:
    movl        $1, -100(%rbp)
.Linner_loop2.or.en.37:
    cmpl        $0, -100(%rbp)
    jne         .Linner_loop2.or.tr.40
    cmpl        $20, -20(%rbp)
    movl        $0, -104(%rbp)
    setne       -104(%rbp)
    cmpl        $0, -104(%rbp)
    jne         .Linner_loop2.or.tr.40
    movl        $0, -108(%rbp)
    jmp         .Linner_loop2.or.en.41
.Linner_loop2.or.tr.40:
    movl        $1, -108(%rbp)
.Linner_loop2.or.en.41:
    cmpl        $0, -108(%rbp)
    jne         .Linner_loop2.or.tr.44
    cmpl        $100, -24(%rbp)
    movl        $0, -112(%rbp)
    setne       -112(%rbp)
    cmpl        $0, -112(%rbp)
    jne         .Linner_loop2.or.tr.44
    movl        $0, -116(%rbp)
    jmp         .Linner_loop2.or.en.45
.Linner_loop2.or.tr.44:
    movl        $1, -116(%rbp)
.Linner_loop2.or.en.45:
    cmpl        $0, -116(%rbp)
    je          .Linner_loop2.if.en.46
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Linner_loop2.if.en.46:
.Linner_loop2.if.en.1:
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      inner_loop3
    .text       
inner_loop3:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $176, %rsp
    movl        %edi, -4(%rbp)
    movl        %esi, -8(%rbp)
    movl        %edx, -12(%rbp)
    movl        %ecx, -16(%rbp)
    movl        %r8d, -20(%rbp)
    movl        %r9d, -24(%rbp)
    cmpl        $0, outer_flag(%rip)
    movl        $0, -28(%rbp)
    sete        -28(%rbp)
    cmpl        $0, -28(%rbp)
    je          .Linner_loop3.if.el.2
    cmpl        $2, inner_flag(%rip)
    movl        $0, -32(%rbp)
    sete        -32(%rbp)
    cmpl        $0, -32(%rbp)
    je          .Linner_loop3.if.el.5
    cmpl        $1, -4(%rbp)
    movl        $0, -36(%rbp)
    setne       -36(%rbp)
    cmpl        $0, -36(%rbp)
    jne         .Linner_loop3.or.tr.9
    cmpl        $11, -8(%rbp)
    movl        $0, -40(%rbp)
    setne       -40(%rbp)
    cmpl        $0, -40(%rbp)
    jne         .Linner_loop3.or.tr.9
    movl        $0, -44(%rbp)
    jmp         .Linner_loop3.or.en.10
.Linner_loop3.or.tr.9:
    movl        $1, -44(%rbp)
.Linner_loop3.or.en.10:
    cmpl        $0, -44(%rbp)
    jne         .Linner_loop3.or.tr.13
    cmpl        $3, -12(%rbp)
    movl        $0, -48(%rbp)
    setne       -48(%rbp)
    cmpl        $0, -48(%rbp)
    jne         .Linner_loop3.or.tr.13
    movl        $0, -52(%rbp)
    jmp         .Linner_loop3.or.en.14
.Linner_loop3.or.tr.13:
    movl        $1, -52(%rbp)
.Linner_loop3.or.en.14:
    cmpl        $0, -52(%rbp)
    jne         .Linner_loop3.or.tr.17
    cmpl        $4, -16(%rbp)
    movl        $0, -56(%rbp)
    setne       -56(%rbp)
    cmpl        $0, -56(%rbp)
    jne         .Linner_loop3.or.tr.17
    movl        $0, -60(%rbp)
    jmp         .Linner_loop3.or.en.18
.Linner_loop3.or.tr.17:
    movl        $1, -60(%rbp)
.Linner_loop3.or.en.18:
    cmpl        $0, -60(%rbp)
    jne         .Linner_loop3.or.tr.21
    cmpl        $5, -20(%rbp)
    movl        $0, -64(%rbp)
    setne       -64(%rbp)
    cmpl        $0, -64(%rbp)
    jne         .Linner_loop3.or.tr.21
    movl        $0, -68(%rbp)
    jmp         .Linner_loop3.or.en.22
.Linner_loop3.or.tr.21:
    movl        $1, -68(%rbp)
.Linner_loop3.or.en.22:
    cmpl        $0, -68(%rbp)
    jne         .Linner_loop3.or.tr.25
    cmpl        $100, -24(%rbp)
    movl        $0, -72(%rbp)
    setne       -72(%rbp)
    cmpl        $0, -72(%rbp)
    jne         .Linner_loop3.or.tr.25
    movl        $0, -76(%rbp)
    jmp         .Linner_loop3.or.en.26
.Linner_loop3.or.tr.25:
    movl        $1, -76(%rbp)
.Linner_loop3.or.en.26:
    cmpl        $0, -76(%rbp)
    je          .Linner_loop3.if.en.27
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Linner_loop3.if.en.27:
    jmp         .Linner_loop3.if.en.4
.Linner_loop3.if.el.5:
    cmpl        $1, -4(%rbp)
    movl        $0, -80(%rbp)
    setne       -80(%rbp)
    cmpl        $0, -80(%rbp)
    jne         .Linner_loop3.or.tr.31
    cmpl        $11, -8(%rbp)
    movl        $0, -84(%rbp)
    setne       -84(%rbp)
    cmpl        $0, -84(%rbp)
    jne         .Linner_loop3.or.tr.31
    movl        $0, -88(%rbp)
    jmp         .Linner_loop3.or.en.32
.Linner_loop3.or.tr.31:
    movl        $1, -88(%rbp)
.Linner_loop3.or.en.32:
    cmpl        $0, -88(%rbp)
    jne         .Linner_loop3.or.tr.35
    cmpl        $12, -12(%rbp)
    movl        $0, -92(%rbp)
    setne       -92(%rbp)
    cmpl        $0, -92(%rbp)
    jne         .Linner_loop3.or.tr.35
    movl        $0, -96(%rbp)
    jmp         .Linner_loop3.or.en.36
.Linner_loop3.or.tr.35:
    movl        $1, -96(%rbp)
.Linner_loop3.or.en.36:
    cmpl        $0, -96(%rbp)
    jne         .Linner_loop3.or.tr.39
    cmpl        $4, -16(%rbp)
    movl        $0, -100(%rbp)
    setne       -100(%rbp)
    cmpl        $0, -100(%rbp)
    jne         .Linner_loop3.or.tr.39
    movl        $0, -104(%rbp)
    jmp         .Linner_loop3.or.en.40
.Linner_loop3.or.tr.39:
    movl        $1, -104(%rbp)
.Linner_loop3.or.en.40:
    cmpl        $0, -104(%rbp)
    jne         .Linner_loop3.or.tr.43
    cmpl        $5, -20(%rbp)
    movl        $0, -108(%rbp)
    setne       -108(%rbp)
    cmpl        $0, -108(%rbp)
    jne         .Linner_loop3.or.tr.43
    movl        $0, -112(%rbp)
    jmp         .Linner_loop3.or.en.44
.Linner_loop3.or.tr.43:
    movl        $1, -112(%rbp)
.Linner_loop3.or.en.44:
    cmpl        $0, -112(%rbp)
    jne         .Linner_loop3.or.tr.47
    cmpl        $100, -24(%rbp)
    movl        $0, -116(%rbp)
    setne       -116(%rbp)
    cmpl        $0, -116(%rbp)
    jne         .Linner_loop3.or.tr.47
    movl        $0, -120(%rbp)
    jmp         .Linner_loop3.or.en.48
.Linner_loop3.or.tr.47:
    movl        $1, -120(%rbp)
.Linner_loop3.or.en.48:
    cmpl        $0, -120(%rbp)
    je          .Linner_loop3.if.en.49
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Linner_loop3.if.en.49:
.Linner_loop3.if.en.4:
    jmp         .Linner_loop3.if.en.1
.Linner_loop3.if.el.2:
    cmpl        $10, -4(%rbp)
    movl        $0, -124(%rbp)
    setne       -124(%rbp)
    cmpl        $0, -124(%rbp)
    jne         .Linner_loop3.or.tr.53
    cmpl        $11, -8(%rbp)
    movl        $0, -128(%rbp)
    setne       -128(%rbp)
    cmpl        $0, -128(%rbp)
    jne         .Linner_loop3.or.tr.53
    movl        $0, -132(%rbp)
    jmp         .Linner_loop3.or.en.54
.Linner_loop3.or.tr.53:
    movl        $1, -132(%rbp)
.Linner_loop3.or.en.54:
    cmpl        $0, -132(%rbp)
    jne         .Linner_loop3.or.tr.57
    cmpl        $12, -12(%rbp)
    movl        $0, -136(%rbp)
    setne       -136(%rbp)
    cmpl        $0, -136(%rbp)
    jne         .Linner_loop3.or.tr.57
    movl        $0, -140(%rbp)
    jmp         .Linner_loop3.or.en.58
.Linner_loop3.or.tr.57:
    movl        $1, -140(%rbp)
.Linner_loop3.or.en.58:
    cmpl        $0, -140(%rbp)
    jne         .Linner_loop3.or.tr.61
    cmpl        $4, -16(%rbp)
    movl        $0, -144(%rbp)
    setne       -144(%rbp)
    cmpl        $0, -144(%rbp)
    jne         .Linner_loop3.or.tr.61
    movl        $0, -148(%rbp)
    jmp         .Linner_loop3.or.en.62
.Linner_loop3.or.tr.61:
    movl        $1, -148(%rbp)
.Linner_loop3.or.en.62:
    cmpl        $0, -148(%rbp)
    jne         .Linner_loop3.or.tr.65
    cmpl        $20, -20(%rbp)
    movl        $0, -152(%rbp)
    setne       -152(%rbp)
    cmpl        $0, -152(%rbp)
    jne         .Linner_loop3.or.tr.65
    movl        $0, -156(%rbp)
    jmp         .Linner_loop3.or.en.66
.Linner_loop3.or.tr.65:
    movl        $1, -156(%rbp)
.Linner_loop3.or.en.66:
    cmpl        $0, -156(%rbp)
    jne         .Linner_loop3.or.tr.69
    cmpl        $100, -24(%rbp)
    movl        $0, -160(%rbp)
    setne       -160(%rbp)
    cmpl        $0, -160(%rbp)
    jne         .Linner_loop3.or.tr.69
    movl        $0, -164(%rbp)
    jmp         .Linner_loop3.or.en.70
.Linner_loop3.or.tr.69:
    movl        $1, -164(%rbp)
.Linner_loop3.or.en.70:
    cmpl        $0, -164(%rbp)
    je          .Linner_loop3.if.en.71
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Linner_loop3.if.en.71:
.Linner_loop3.if.en.1:
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      inner_loop4
    .text       
inner_loop4:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $48, %rsp
    movl        %edi, -4(%rbp)
    movl        %esi, -8(%rbp)
    movl        %edx, -12(%rbp)
    movl        %ecx, -16(%rbp)
    movl        %r8d, -20(%rbp)
    movl        %r9d, -24(%rbp)
    movl        -4(%rbp), %r10d
    movl        %r10d, -28(%rbp)
    movl        -8(%rbp), %r10d
    addl        %r10d, -28(%rbp)
    movl        -28(%rbp), %r10d
    movl        %r10d, -32(%rbp)
    movl        -12(%rbp), %r10d
    addl        %r10d, -32(%rbp)
    movl        -32(%rbp), %r10d
    movl        %r10d, -36(%rbp)
    movl        -16(%rbp), %r10d
    addl        %r10d, -36(%rbp)
    movl        -36(%rbp), %r10d
    movl        %r10d, -40(%rbp)
    movl        -20(%rbp), %r10d
    addl        %r10d, -40(%rbp)
    movl        -40(%rbp), %r10d
    movl        %r10d, -44(%rbp)
    movl        -24(%rbp), %r10d
    addl        %r10d, -44(%rbp)
    movl        -44(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      validate
    .text       
validate:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $80, %rsp
    movl        %edi, -4(%rbp)
    movl        %esi, -8(%rbp)
    movl        %edx, -12(%rbp)
    movl        %ecx, -16(%rbp)
    movl        %r8d, -20(%rbp)
    movl        %r9d, -24(%rbp)
    cmpl        $10, -4(%rbp)
    movl        $0, -28(%rbp)
    setne       -28(%rbp)
    cmpl        $0, -28(%rbp)
    jne         .Lvalidate.or.tr.3
    cmpl        $11, -8(%rbp)
    movl        $0, -32(%rbp)
    setne       -32(%rbp)
    cmpl        $0, -32(%rbp)
    jne         .Lvalidate.or.tr.3
    movl        $0, -36(%rbp)
    jmp         .Lvalidate.or.en.4
.Lvalidate.or.tr.3:
    movl        $1, -36(%rbp)
.Lvalidate.or.en.4:
    cmpl        $0, -36(%rbp)
    jne         .Lvalidate.or.tr.7
    cmpl        $12, -12(%rbp)
    movl        $0, -40(%rbp)
    setne       -40(%rbp)
    cmpl        $0, -40(%rbp)
    jne         .Lvalidate.or.tr.7
    movl        $0, -44(%rbp)
    jmp         .Lvalidate.or.en.8
.Lvalidate.or.tr.7:
    movl        $1, -44(%rbp)
.Lvalidate.or.en.8:
    cmpl        $0, -44(%rbp)
    jne         .Lvalidate.or.tr.11
    cmpl        $4, -16(%rbp)
    movl        $0, -48(%rbp)
    setne       -48(%rbp)
    cmpl        $0, -48(%rbp)
    jne         .Lvalidate.or.tr.11
    movl        $0, -52(%rbp)
    jmp         .Lvalidate.or.en.12
.Lvalidate.or.tr.11:
    movl        $1, -52(%rbp)
.Lvalidate.or.en.12:
    cmpl        $0, -52(%rbp)
    jne         .Lvalidate.or.tr.15
    cmpl        $20, -20(%rbp)
    movl        $0, -56(%rbp)
    setne       -56(%rbp)
    cmpl        $0, -56(%rbp)
    jne         .Lvalidate.or.tr.15
    movl        $0, -60(%rbp)
    jmp         .Lvalidate.or.en.16
.Lvalidate.or.tr.15:
    movl        $1, -60(%rbp)
.Lvalidate.or.en.16:
    cmpl        $0, -60(%rbp)
    jne         .Lvalidate.or.tr.19
    cmpl        $100, -24(%rbp)
    movl        $0, -64(%rbp)
    setne       -64(%rbp)
    cmpl        $0, -64(%rbp)
    jne         .Lvalidate.or.tr.19
    movl        $0, -68(%rbp)
    jmp         .Lvalidate.or.en.20
.Lvalidate.or.tr.19:
    movl        $1, -68(%rbp)
.Lvalidate.or.en.20:
    cmpl        $0, -68(%rbp)
    je          .Lvalidate.if.en.21
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lvalidate.if.en.21:
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      target
    .text       
target:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $96, %rsp
    movl        $1, -4(%rbp)
    movl        $2, -8(%rbp)
    movl        $3, -12(%rbp)
    movl        $4, -16(%rbp)
    movl        $5, -20(%rbp)
.Lloop.ct.1:
    cmpl        $2, outer_flag(%rip)
    movl        $0, -24(%rbp)
    setl        -24(%rbp)
    cmpl        $0, -24(%rbp)
    je          .Lloop.br.1
.Lloop.ct.2:
    cmpl        $1, inner_flag(%rip)
    movl        $0, -28(%rbp)
    setl        -28(%rbp)
    cmpl        $0, -28(%rbp)
    je          .Lloop.br.2
    movl        -4(%rbp), %edi
    movl        -8(%rbp), %esi
    movl        -12(%rbp), %edx
    movl        -16(%rbp), %ecx
    movl        -20(%rbp), %r8d
    movl        $100, %r9d
    call        inner_loop1@PLT
    movl        %eax, -32(%rbp)
    cmpl        $0, -32(%rbp)
    movl        $0, -36(%rbp)
    sete        -36(%rbp)
    cmpl        $0, -36(%rbp)
    je          .Ltarget.if.en.4
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Ltarget.if.en.4:
    movl        $10, -4(%rbp)
    movl        $1, inner_flag(%rip)
    jmp         .Lloop.ct.2
.Lloop.br.2:
.Lloop.ct.3:
    cmpl        $2, inner_flag(%rip)
    movl        $0, -40(%rbp)
    setl        -40(%rbp)
    cmpl        $0, -40(%rbp)
    je          .Lloop.br.3
    movl        -4(%rbp), %edi
    movl        -8(%rbp), %esi
    movl        -12(%rbp), %edx
    movl        -16(%rbp), %ecx
    movl        -20(%rbp), %r8d
    movl        $100, %r9d
    call        inner_loop2@PLT
    movl        %eax, -44(%rbp)
    cmpl        $0, -44(%rbp)
    movl        $0, -48(%rbp)
    sete        -48(%rbp)
    cmpl        $0, -48(%rbp)
    je          .Ltarget.if.en.8
    movl        $2, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Ltarget.if.en.8:
    movl        $11, -8(%rbp)
    movl        $2, inner_flag(%rip)
    jmp         .Lloop.ct.3
.Lloop.br.3:
.Lloop.ct.4:
    cmpl        $4, inner_flag(%rip)
    movl        $0, -52(%rbp)
    setl        -52(%rbp)
    cmpl        $0, -52(%rbp)
    je          .Lloop.br.4
    movl        -4(%rbp), %edi
    movl        -8(%rbp), %esi
    movl        -12(%rbp), %edx
    movl        -16(%rbp), %ecx
    movl        -20(%rbp), %r8d
    movl        $100, %r9d
    call        inner_loop3@PLT
    movl        %eax, -56(%rbp)
    cmpl        $0, -56(%rbp)
    movl        $0, -60(%rbp)
    sete        -60(%rbp)
    cmpl        $0, -60(%rbp)
    je          .Ltarget.if.en.12
    movl        $3, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Ltarget.if.en.12:
    movl        inner_flag(%rip), %r10d
    movl        %r10d, -64(%rbp)
    addl        $1, -64(%rbp)
    movl        -64(%rbp), %r10d
    movl        %r10d, inner_flag(%rip)
    movl        $12, -12(%rbp)
    jmp         .Lloop.ct.4
.Lloop.br.4:
.Lloop.ct.5:
    cmpl        $4, inner_flag(%rip)
    movl        $0, -68(%rbp)
    setl        -68(%rbp)
    cmpl        $0, -68(%rbp)
    je          .Lloop.br.5
    movl        -4(%rbp), %edi
    movl        -8(%rbp), %esi
    movl        -12(%rbp), %edx
    movl        -16(%rbp), %ecx
    movl        -20(%rbp), %r8d
    movl        $100, %r9d
    call        inner_loop4@PLT
    movl        %eax, -72(%rbp)
    movl        $13, -16(%rbp)
    jmp         .Lloop.ct.5
.Lloop.br.5:
    movl        $20, -20(%rbp)
    movl        outer_flag(%rip), %r10d
    movl        %r10d, -76(%rbp)
    addl        $1, -76(%rbp)
    movl        -76(%rbp), %r10d
    movl        %r10d, outer_flag(%rip)
    movl        $0, inner_flag(%rip)
    jmp         .Lloop.ct.1
.Lloop.br.1:
    movl        -4(%rbp), %edi
    movl        -8(%rbp), %esi
    movl        -12(%rbp), %edx
    movl        -16(%rbp), %ecx
    movl        -20(%rbp), %r8d
    movl        $100, %r9d
    call        validate@PLT
    movl        %eax, -80(%rbp)
    cmpl        $0, -80(%rbp)
    movl        $0, -84(%rbp)
    sete        -84(%rbp)
    cmpl        $0, -84(%rbp)
    je          .Ltarget.if.en.19
    movl        $4, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Ltarget.if.en.19:
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
    call        target@PLT
    movl        %eax, -4(%rbp)
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .bss        
    .align      4
outer_flag:
    .zero       4
    .data       
    .align      4
inner_flag:
    .long       1
    .section    .note.GNU-stack,"",@progbits
