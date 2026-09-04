    .globl      main
    .text
main:
    pushq       %rbp
    movq        %rsp, %rbp
    movl        $16, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .section    .note.GNU-stack,"",@progbits
