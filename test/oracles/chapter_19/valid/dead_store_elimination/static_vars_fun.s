    .globl      get_x
    .text       
get_x:
    pushq       %rbp
    movq        %rsp, %rbp
    movl        x(%rip), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $5, x(%rip)
    call        get_x@PLT
    movl        %eax, -4(%rbp)
    movl        $10, x(%rip)
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      x
    .data       
    .align      4
x:
    .long       100
    .section    .note.GNU-stack,"",@progbits
