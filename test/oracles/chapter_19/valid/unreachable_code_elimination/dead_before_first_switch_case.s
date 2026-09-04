    .globl      callee
    .text
callee:
    pushq       %rbp
    movq        %rsp, %rbp
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .globl      target
    .text
target:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        %edi, -4(%rbp)
    cmpl        $1, -4(%rbp)
    movl        $0, -8(%rbp)
    sete        -8(%rbp)
    cmpl        $0, -8(%rbp)
    jne         .Lswit.cs.1.2
    jmp         .Lswit.df.1
.Lswit.cs.1.2:
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lswit.df.1:
    movl        $2, %eax
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
