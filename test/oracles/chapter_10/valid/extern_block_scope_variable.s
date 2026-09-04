    .globl      main
    .text
main:
    pushq       %rbp
    movq        %rsp, %rbp
    movl        foo(%rip), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .globl      foo
    .data
    .align      4
foo:
    .long       3
    .section    .note.GNU-stack,"",@progbits
