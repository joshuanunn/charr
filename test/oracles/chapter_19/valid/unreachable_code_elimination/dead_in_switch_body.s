    .globl      callee
    .text       
callee:
    pushq       %rbp
    movq        %rsp, %rbp
    movl        $-1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      target
    .text       
target:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    movl        %edi, -4(%rbp)
    cmpl        $1, -4(%rbp)
    movl        $0, -8(%rbp)
    sete        -8(%rbp)
    cmpl        $0, -8(%rbp)
    jne         .Lswit.cs.1.1
    cmpl        $2, -4(%rbp)
    movl        $0, -12(%rbp)
    sete        -12(%rbp)
    cmpl        $0, -12(%rbp)
    jne         .Lswit.cs.1.2
    cmpl        $3, -4(%rbp)
    movl        $0, -16(%rbp)
    sete        -16(%rbp)
    cmpl        $0, -16(%rbp)
    jne         .Lswit.cs.1.3
    jmp         .Lswit.df.1
.Lswit.cs.1.1:
    movl        $1, -20(%rbp)
    jmp         .Lswit.br.1
.Lswit.cs.1.2:
    movl        $2, -20(%rbp)
    jmp         .Lswit.br.1
.Lswit.cs.1.3:
    movl        $10, -20(%rbp)
    jmp         .Lswit.br.1
.Lswit.df.1:
    movl        $-1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lswit.br.1:
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
    movl        $3, %edi
    call        target@PLT
    movl        %eax, -4(%rbp)
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
