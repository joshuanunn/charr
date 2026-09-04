    .globl      main
    .text       
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    cmpl        $0, i(%rip)
    movl        $0, -4(%rbp)
    setne       -4(%rbp)
    cmpl        $0, -4(%rbp)
    je          .Lmain.if.en.1
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.1:
    cmpq        $123456, j(%rip)
    movl        $0, -8(%rbp)
    setne       -8(%rbp)
    cmpl        $0, -8(%rbp)
    je          .Lmain.if.en.3
    movl        $2, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
.Lmain.if.en.3:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      i
    .bss        
    .align      4
i:
    .zero       4
    .globl      j
    .data       
    .align      8
j:
    .quad       123456
    .section    .note.GNU-stack,"",@progbits
