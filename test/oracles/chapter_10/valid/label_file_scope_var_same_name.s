    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    movl        x(%rip), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      x
    .bss        
    .align      4
x:
    .zero       4
    .section    .note.GNU-stack,"",@progbits
