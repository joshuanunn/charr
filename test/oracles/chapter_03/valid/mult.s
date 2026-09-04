    .globl      main
    .text
main:
    pushq       %rbp
    movq        %rsp, %rbp
    movl        $6, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .section    .note.GNU-stack,"",@progbits
