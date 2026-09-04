    .globl      target
    .text       
target:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    movl        %edi, -4(%rbp)
    movl        $10, -8(%rbp)
    cmpl        $1, -4(%rbp)
    movl        $0, -12(%rbp)
    sete        -12(%rbp)
    cmpl        $0, -12(%rbp)
    jne         .Lswit.cs.1.2
    cmpl        $2, -4(%rbp)
    movl        $0, -16(%rbp)
    sete        -16(%rbp)
    cmpl        $0, -16(%rbp)
    jne         .Lswit.cs.1.3
    jmp         .Lswit.df.1
.Lswit.cs.1.2:
    movl        $0, -8(%rbp)
.Lswit.cs.1.3:
    movl        -8(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lswit.df.1:
    movl        $-1, -20(%rbp)
    movl        -20(%rbp), %eax
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
    call        target@PLT
    movl        %eax, -4(%rbp)
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
