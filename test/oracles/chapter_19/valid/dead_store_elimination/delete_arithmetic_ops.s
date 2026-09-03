    .globl      target
    .text       
target:
    pushq       %rbp
    movq        %rsp, %rbp
    movl        $5, %eax
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
    .globl      b
    .data       
    .align      4
b:
    .long       2
    .globl      a
    .data       
    .align      4
a:
    .long       1
    .section    .note.GNU-stack,"",@progbits
