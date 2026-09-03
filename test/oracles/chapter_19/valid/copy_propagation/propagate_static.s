    .globl      target
    .text       
target:
    pushq       %rbp
    movq        %rsp, %rbp
    movl        $10, x(%rip)
    movl        $10, %eax
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
    cmpl        $10, -4(%rbp)
    movl        $0, -8(%rbp)
    setne       -8(%rbp)
    cmpl        $0, -8(%rbp)
    je          .Lmain.if.en.2
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.2:
    cmpl        $10, x(%rip)
    movl        $0, -12(%rbp)
    setne       -12(%rbp)
    cmpl        $0, -12(%rbp)
    je          .Lmain.if.en.4
    movl        $2, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.4:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      x
    .bss        
    .align      4
x:
    .zero       4
    .section    .note.GNU-stack,"",@progbits
