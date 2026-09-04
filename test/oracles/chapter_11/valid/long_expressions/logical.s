    .globl      not
    .text
not:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movq        %rdi, -8(%rbp)
    cmpq        $0, -8(%rbp)
    movl        $0, -12(%rbp)
    sete        -12(%rbp)
    movl        -12(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .globl      if_cond
    .text
if_cond:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movq        %rdi, -8(%rbp)
    cmpq        $0, -8(%rbp)
    je          .Lif_cond.if.en.0
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lif_cond.if.en.0:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .globl      and
    .text
and:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movq        %rdi, -8(%rbp)
    movl        %esi, -12(%rbp)
    cmpq        $0, -8(%rbp)
    je          .Land.and.fl.1
    cmpl        $0, -12(%rbp)
    je          .Land.and.fl.1
    movl        $1, -16(%rbp)
    jmp         .Land.and.en.2
.Land.and.fl.1:
    movl        $0, -16(%rbp)
.Land.and.en.2:
    movl        -16(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .globl      or
    .text
or:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    movl        %edi, -4(%rbp)
    movq        %rsi, -16(%rbp)
    cmpl        $0, -4(%rbp)
    jne         .Lor.or.tr.1
    cmpq        $0, -16(%rbp)
    jne         .Lor.or.tr.1
    movl        $0, -20(%rbp)
    jmp         .Lor.or.en.2
.Lor.or.tr.1:
    movl        $1, -20(%rbp)
.Lor.or.en.2:
    movl        -20(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .globl      main
    .text
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $48, %rsp
    movq        $1152921504606846976, %rdi
    call        not@PLT
    movl        %eax, -4(%rbp)
    cmpl        $0, -4(%rbp)
    je          .Lmain.if.en.1
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lmain.if.en.1:
    movq        $0, %rdi
    call        not@PLT
    movl        %eax, -8(%rbp)
    cmpl        $0, -8(%rbp)
    movl        $0, -12(%rbp)
    sete        -12(%rbp)
    cmpl        $0, -12(%rbp)
    je          .Lmain.if.en.4
    movl        $2, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lmain.if.en.4:
    movq        $1152921504606846976, %rdi
    call        if_cond@PLT
    movl        %eax, -16(%rbp)
    cmpl        $0, -16(%rbp)
    movl        $0, -20(%rbp)
    sete        -20(%rbp)
    cmpl        $0, -20(%rbp)
    je          .Lmain.if.en.7
    movl        $3, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lmain.if.en.7:
    movq        $0, %rdi
    call        if_cond@PLT
    movl        %eax, -24(%rbp)
    cmpl        $0, -24(%rbp)
    je          .Lmain.if.en.9
    movl        $4, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lmain.if.en.9:
    movq        $0, %rdi
    movl        $1, %esi
    call        and@PLT
    movl        %eax, -28(%rbp)
    cmpl        $0, -28(%rbp)
    je          .Lmain.if.en.11
    movl        $5, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lmain.if.en.11:
    movl        $1, %edi
    movq        $1152921504606846976, %rsi
    call        or@PLT
    movl        %eax, -32(%rbp)
    cmpl        $0, -32(%rbp)
    movl        $0, -36(%rbp)
    sete        -36(%rbp)
    cmpl        $0, -36(%rbp)
    je          .Lmain.if.en.14
    movl        $6, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lmain.if.en.14:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .section    .note.GNU-stack,"",@progbits
