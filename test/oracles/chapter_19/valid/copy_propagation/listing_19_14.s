    .globl      f
    .text
f:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        %edi, -4(%rbp)
    movl        -4(%rbp), %r10d
    movl        %r10d, total.1(%rip)
    cmpl        $100, -4(%rbp)
    movl        $0, -8(%rbp)
    setg        -8(%rbp)
    cmpl        $0, -8(%rbp)
    je          .Lf.if.en.1
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lf.if.en.1:
    movl        $10, total.1(%rip)
    call        indirect_update@PLT
    movl        %eax, -12(%rbp)
    movl        total.1(%rip), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .globl      indirect_update
    .text
indirect_update:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $101, %edi
    call        f@PLT
    movl        %eax, -4(%rbp)
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .globl      main
    .text
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        $1, %edi
    call        f@PLT
    movl        %eax, -4(%rbp)
    movl        -4(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .bss
    .align      4
total.1:
    .zero       4
    .section    .note.GNU-stack,"",@progbits
