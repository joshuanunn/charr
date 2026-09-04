    .globl      target
    .text
target:
    pushq       %rbp
    movq        %rsp, %rbp
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
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .bss
    .align      4
glob:
    .zero       4
    .section    .note.GNU-stack,"",@progbits
