    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $144, %rsp
    movq        glob(%rip), %r10
    movq        %r10, -8(%rbp)
    movq        $4294967307, %r10
    movq        -8(%rbp), %r11
    imulq       %r10, %r11
    movq        %r11, -8(%rbp)
    movq        glob(%rip), %r10
    movq        %r10, -16(%rbp)
    subq        $4, -16(%rbp)
    movl        -16(%rbp), %r10d
    movl        %r10d, -20(%rbp)
    movl        -20(%rbp), %r10d
    movl        %r10d, -24(%rbp)
    movl        -20(%rbp), %r10d
    addl        %r10d, -24(%rbp)
    movl        $2, -28(%rbp)
    movl        -20(%rbp), %r10d
    addl        %r10d, -28(%rbp)
    movl        -24(%rbp), %r10d
    movl        %r10d, -32(%rbp)
    movl        -32(%rbp), %r11d
    imull       -24(%rbp), %r11d
    movl        %r11d, -32(%rbp)
    movl        $6, -36(%rbp)
    movl        -20(%rbp), %r10d
    subl        %r10d, -36(%rbp)
    movl        -24(%rbp), %r10d
    movl        %r10d, -40(%rbp)
    movl        -40(%rbp), %r11d
    imull       -28(%rbp), %r11d
    movl        %r11d, -40(%rbp)
    movl        -20(%rbp), %r10d
    movl        %r10d, -44(%rbp)
    addl        $6, -44(%rbp)
    movl        -24(%rbp), %r10d
    movl        %r10d, -48(%rbp)
    movl        -48(%rbp), %r11d
    imull       $4, %r11d
    movl        %r11d, -48(%rbp)
    movl        -28(%rbp), %r10d
    movl        %r10d, -52(%rbp)
    movl        -52(%rbp), %r11d
    imull       -28(%rbp), %r11d
    movl        %r11d, -52(%rbp)
    movl        -32(%rbp), %r10d
    movl        %r10d, -56(%rbp)
    movl        -40(%rbp), %r10d
    addl        %r10d, -56(%rbp)
    movl        $16, -60(%rbp)
    movl        -36(%rbp), %r10d
    subl        %r10d, -60(%rbp)
    movl        -40(%rbp), %r10d
    movl        %r10d, -64(%rbp)
    movl        -40(%rbp), %r10d
    addl        %r10d, -64(%rbp)
    subq        $8, %rsp
    movl        -20(%rbp), %edi
    movl        -24(%rbp), %esi
    movl        -28(%rbp), %edx
    movl        -32(%rbp), %ecx
    movl        -36(%rbp), %r8d
    movl        -40(%rbp), %r9d
    pushq       $1
    movl        -64(%rbp), %eax
    pushq       %rax
    movl        -60(%rbp), %eax
    pushq       %rax
    movl        -56(%rbp), %eax
    pushq       %rax
    movl        -52(%rbp), %eax
    pushq       %rax
    movl        -48(%rbp), %eax
    pushq       %rax
    movl        -44(%rbp), %eax
    pushq       %rax
    call        check_12_ints@PLT
    addq        $64, %rsp
    movl        %eax, -68(%rbp)
    movq        glob(%rip), %r10
    movq        %r10, -80(%rbp)
    addq        $8, -80(%rbp)
    movl        -80(%rbp), %r10d
    movl        %r10d, -84(%rbp)
    movl        -84(%rbp), %r10d
    movl        %r10d, -88(%rbp)
    addl        $1, -88(%rbp)
    movl        $28, -92(%rbp)
    movl        -84(%rbp), %r10d
    subl        %r10d, -92(%rbp)
    movl        -88(%rbp), %r10d
    movl        %r10d, -96(%rbp)
    addl        $2, -96(%rbp)
    movl        $4, -100(%rbp)
    movl        -84(%rbp), %r10d
    addl        %r10d, -100(%rbp)
    movl        $32, -104(%rbp)
    movl        -88(%rbp), %r10d
    subl        %r10d, -104(%rbp)
    movl        $35, -108(%rbp)
    movl        -96(%rbp), %r10d
    subl        %r10d, -108(%rbp)
    movl        -92(%rbp), %r10d
    movl        %r10d, -112(%rbp)
    addl        $5, -112(%rbp)
    movl        -84(%rbp), %r10d
    movl        %r10d, -116(%rbp)
    movl        -116(%rbp), %r11d
    imull       $2, %r11d
    movl        %r11d, -116(%rbp)
    movl        -116(%rbp), %r10d
    movl        %r10d, -120(%rbp)
    subl        $5, -120(%rbp)
    movl        -92(%rbp), %r10d
    movl        %r10d, -124(%rbp)
    addl        $7, -124(%rbp)
    movl        $6, -128(%rbp)
    movl        -100(%rbp), %r10d
    addl        %r10d, -128(%rbp)
    movl        -84(%rbp), %r10d
    movl        %r10d, -132(%rbp)
    addl        $11, -132(%rbp)
    subq        $8, %rsp
    movl        -84(%rbp), %edi
    movl        -88(%rbp), %esi
    movl        -92(%rbp), %edx
    movl        -96(%rbp), %ecx
    movl        -100(%rbp), %r8d
    movl        -104(%rbp), %r9d
    pushq       $13
    movl        -132(%rbp), %eax
    pushq       %rax
    movl        -128(%rbp), %eax
    pushq       %rax
    movl        -124(%rbp), %eax
    pushq       %rax
    movl        -120(%rbp), %eax
    pushq       %rax
    movl        -112(%rbp), %eax
    pushq       %rax
    movl        -108(%rbp), %eax
    pushq       %rax
    call        check_12_ints@PLT
    addq        $64, %rsp
    movl        %eax, -136(%rbp)
    movq        $21474836535, %r10
    cmpq        %r10, -8(%rbp)
    movl        $0, -140(%rbp)
    setne       -140(%rbp)
    cmpl        $0, -140(%rbp)
    je          .Lmain.if.en.33
    movl        $-1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.33:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      check_12_ints
    .text       
check_12_ints:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $160, %rsp
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
    movl        32(%rbp), %r10d
    movl        %r10d, -36(%rbp)
    movl        40(%rbp), %r10d
    movl        %r10d, -40(%rbp)
    movl        48(%rbp), %r10d
    movl        %r10d, -44(%rbp)
    movl        56(%rbp), %r10d
    movl        %r10d, -48(%rbp)
    movl        64(%rbp), %r10d
    movl        %r10d, -52(%rbp)
    movl        -52(%rbp), %r10d
    movl        %r10d, -56(%rbp)
    addl        $0, -56(%rbp)
    movl        -56(%rbp), %r10d
    cmpl        %r10d, -4(%rbp)
    movl        $0, -60(%rbp)
    setne       -60(%rbp)
    cmpl        $0, -60(%rbp)
    je          .Lcheck_12_ints.if.en.2
    movl        -56(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lcheck_12_ints.if.en.2:
    movl        -52(%rbp), %r10d
    movl        %r10d, -64(%rbp)
    addl        $1, -64(%rbp)
    movl        -64(%rbp), %r10d
    cmpl        %r10d, -8(%rbp)
    movl        $0, -68(%rbp)
    setne       -68(%rbp)
    cmpl        $0, -68(%rbp)
    je          .Lcheck_12_ints.if.en.5
    movl        -64(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lcheck_12_ints.if.en.5:
    movl        -52(%rbp), %r10d
    movl        %r10d, -72(%rbp)
    addl        $2, -72(%rbp)
    movl        -72(%rbp), %r10d
    cmpl        %r10d, -12(%rbp)
    movl        $0, -76(%rbp)
    setne       -76(%rbp)
    cmpl        $0, -76(%rbp)
    je          .Lcheck_12_ints.if.en.8
    movl        -72(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lcheck_12_ints.if.en.8:
    movl        -52(%rbp), %r10d
    movl        %r10d, -80(%rbp)
    addl        $3, -80(%rbp)
    movl        -80(%rbp), %r10d
    cmpl        %r10d, -16(%rbp)
    movl        $0, -84(%rbp)
    setne       -84(%rbp)
    cmpl        $0, -84(%rbp)
    je          .Lcheck_12_ints.if.en.11
    movl        -80(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lcheck_12_ints.if.en.11:
    movl        -52(%rbp), %r10d
    movl        %r10d, -88(%rbp)
    addl        $4, -88(%rbp)
    movl        -88(%rbp), %r10d
    cmpl        %r10d, -20(%rbp)
    movl        $0, -92(%rbp)
    setne       -92(%rbp)
    cmpl        $0, -92(%rbp)
    je          .Lcheck_12_ints.if.en.14
    movl        -88(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lcheck_12_ints.if.en.14:
    movl        -52(%rbp), %r10d
    movl        %r10d, -96(%rbp)
    addl        $5, -96(%rbp)
    movl        -96(%rbp), %r10d
    cmpl        %r10d, -24(%rbp)
    movl        $0, -100(%rbp)
    setne       -100(%rbp)
    cmpl        $0, -100(%rbp)
    je          .Lcheck_12_ints.if.en.17
    movl        -96(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lcheck_12_ints.if.en.17:
    movl        -52(%rbp), %r10d
    movl        %r10d, -104(%rbp)
    addl        $6, -104(%rbp)
    movl        -104(%rbp), %r10d
    cmpl        %r10d, -28(%rbp)
    movl        $0, -108(%rbp)
    setne       -108(%rbp)
    cmpl        $0, -108(%rbp)
    je          .Lcheck_12_ints.if.en.20
    movl        -104(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lcheck_12_ints.if.en.20:
    movl        -52(%rbp), %r10d
    movl        %r10d, -112(%rbp)
    addl        $7, -112(%rbp)
    movl        -112(%rbp), %r10d
    cmpl        %r10d, -32(%rbp)
    movl        $0, -116(%rbp)
    setne       -116(%rbp)
    cmpl        $0, -116(%rbp)
    je          .Lcheck_12_ints.if.en.23
    movl        -112(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lcheck_12_ints.if.en.23:
    movl        -52(%rbp), %r10d
    movl        %r10d, -120(%rbp)
    addl        $8, -120(%rbp)
    movl        -120(%rbp), %r10d
    cmpl        %r10d, -36(%rbp)
    movl        $0, -124(%rbp)
    setne       -124(%rbp)
    cmpl        $0, -124(%rbp)
    je          .Lcheck_12_ints.if.en.26
    movl        -120(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lcheck_12_ints.if.en.26:
    movl        -52(%rbp), %r10d
    movl        %r10d, -128(%rbp)
    addl        $9, -128(%rbp)
    movl        -128(%rbp), %r10d
    cmpl        %r10d, -40(%rbp)
    movl        $0, -132(%rbp)
    setne       -132(%rbp)
    cmpl        $0, -132(%rbp)
    je          .Lcheck_12_ints.if.en.29
    movl        -128(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lcheck_12_ints.if.en.29:
    movl        -52(%rbp), %r10d
    movl        %r10d, -136(%rbp)
    addl        $10, -136(%rbp)
    movl        -136(%rbp), %r10d
    cmpl        %r10d, -44(%rbp)
    movl        $0, -140(%rbp)
    setne       -140(%rbp)
    cmpl        $0, -140(%rbp)
    je          .Lcheck_12_ints.if.en.32
    movl        -136(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lcheck_12_ints.if.en.32:
    movl        -52(%rbp), %r10d
    movl        %r10d, -144(%rbp)
    addl        $11, -144(%rbp)
    movl        -144(%rbp), %r10d
    cmpl        %r10d, -48(%rbp)
    movl        $0, -148(%rbp)
    setne       -148(%rbp)
    cmpl        $0, -148(%rbp)
    je          .Lcheck_12_ints.if.en.35
    movl        -144(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lcheck_12_ints.if.en.35:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      glob
    .data       
    .align      8
glob:
    .quad       5
    .section    .note.GNU-stack,"",@progbits
