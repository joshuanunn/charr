    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
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
