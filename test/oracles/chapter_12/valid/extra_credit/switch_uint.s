    .globl      switch_on_uint
    .text
switch_on_uint:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        %edi, -4(%rbp)
    cmpl        $5, -4(%rbp)
    movl        $0, -8(%rbp)
    sete        -8(%rbp)
    cmpl        $0, -8(%rbp)
    jne         .Lswit.cs.1.2
    cmpl        $-10, -4(%rbp)
    movl        $0, -12(%rbp)
    sete        -12(%rbp)
    cmpl        $0, -12(%rbp)
    jne         .Lswit.cs.1.3
    cmpl        $10, -4(%rbp)
    movl        $0, -16(%rbp)
    sete        -16(%rbp)
    cmpl        $0, -16(%rbp)
    jne         .Lswit.cs.1.4
    jmp         .Lswit.df.1
.Lswit.cs.1.2:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lswit.cs.1.3:
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lswit.cs.1.4:
    movl        $2, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lswit.df.1:
    movl        $3, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .globl      main
    .text
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    movl        $5, %edi
    call        switch_on_uint@PLT
    movl        %eax, -4(%rbp)
    cmpl        $0, -4(%rbp)
    movl        $0, -8(%rbp)
    setne       -8(%rbp)
    cmpl        $0, -8(%rbp)
    je          .Lmain.if.en.3
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lmain.if.en.3:
    movl        $-10, %edi
    call        switch_on_uint@PLT
    movl        %eax, -12(%rbp)
    cmpl        $1, -12(%rbp)
    movl        $0, -16(%rbp)
    setne       -16(%rbp)
    cmpl        $0, -16(%rbp)
    je          .Lmain.if.en.7
    movl        $2, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lmain.if.en.7:
    movl        $10, %edi
    call        switch_on_uint@PLT
    movl        %eax, -20(%rbp)
    cmpl        $2, -20(%rbp)
    movl        $0, -24(%rbp)
    setne       -24(%rbp)
    cmpl        $0, -24(%rbp)
    je          .Lmain.if.en.11
    movl        $3, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lmain.if.en.11:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .section    .note.GNU-stack,"",@progbits
