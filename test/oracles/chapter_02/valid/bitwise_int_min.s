    .globl      main
    .text
main:
    pushq       %rbp
    movq        %rsp, %rbp
    movl        $2147483646, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .section    .note.GNU-stack,"",@progbits
