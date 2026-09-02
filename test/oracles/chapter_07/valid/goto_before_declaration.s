    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    jmp         .Lmain.if.en.1
.Lreturn_a.0:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.1:
    jmp         .Lreturn_a.0
    .section    .note.GNU-stack,"",@progbits
