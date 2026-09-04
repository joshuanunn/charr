    .globl      switch_on_long
    .text
switch_on_long:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    movq        %rdi, -8(%rbp)
    cmpq        $0, -8(%rbp)
    movl        $0, -12(%rbp)
    sete        -12(%rbp)
    cmpl        $0, -12(%rbp)
    jne         .Lswit.cs.1.2
    cmpq        $100, -8(%rbp)
    movl        $0, -16(%rbp)
    sete        -16(%rbp)
    cmpl        $0, -16(%rbp)
    jne         .Lswit.cs.1.3
    movq        $8589934592, %r10
    cmpq        %r10, -8(%rbp)
    movl        $0, -20(%rbp)
    sete        -20(%rbp)
    cmpl        $0, -20(%rbp)
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
    movl        $-1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .globl      main
    .text
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movq        $8589934592, %rdi
    call        switch_on_long@PLT
    movl        %eax, -4(%rbp)
    cmpl        $2, -4(%rbp)
    movl        $0, -8(%rbp)
    setne       -8(%rbp)
    cmpl        $0, -8(%rbp)
    je          .Lmain.if.en.2
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lmain.if.en.2:
    movq        $100, %rdi
    call        switch_on_long@PLT
    movl        %eax, -12(%rbp)
    cmpl        $1, -12(%rbp)
    movl        $0, -16(%rbp)
    setne       -16(%rbp)
    cmpl        $0, -16(%rbp)
    je          .Lmain.if.en.6
    movl        $2, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lmain.if.en.6:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .section    .note.GNU-stack,"",@progbits
