    .globl      add
    .text       
add:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    movl        %edi, -4(%rbp)
    movl        %esi, -8(%rbp)
    movslq      -4(%rbp), %r11
    movq        %r11, -16(%rbp)
    movslq      -8(%rbp), %r11
    movq        %r11, -24(%rbp)
    movq        -16(%rbp), %r10
    movq        %r10, -32(%rbp)
    movq        -24(%rbp), %r10
    addq        %r10, -32(%rbp)
    movq        -32(%rbp), %rax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $2147483645, %edi
    movl        $2147483645, %esi
    call        add@PLT
    movq        %rax, -8(%rbp)
    movq        $4294967290, %r10
    cmpq        %r10, -8(%rbp)
    movl        $0, -12(%rbp)
    sete        -12(%rbp)
    cmpl        $0, -12(%rbp)
    je          .Lmain.if.en.2
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.2:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
