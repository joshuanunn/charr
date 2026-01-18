    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    jmp         .Lother_if.1
.Lfirst_if.0:
    jmp         .Lmain.if.en.2
.Lother_if.1:
    jmp         .Lfirst_if.0
.Lmain.if.en.2:
    movl        $11, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .section    .note.GNU-stack,"",@progbits
