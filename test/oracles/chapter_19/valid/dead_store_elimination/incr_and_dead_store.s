    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    addl        $1, x(%rip)
    movl        x(%rip), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .data       
    .align      4
x:
    .long       10
    .section    .note.GNU-stack,"",@progbits
