    .globl      target
    .text       
target:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
.Lloop.ct.1:
    cmpl        $0, j(%rip)
    movl        $0, -4(%rbp)
    setg        -4(%rbp)
    cmpl        $0, -4(%rbp)
    je          .Lloop.br.1
    movl        j(%rip), %r10d
    movl        %r10d, -8(%rbp)
    subl        $1, -8(%rbp)
    movl        -8(%rbp), %r10d
    movl        %r10d, j(%rip)
    jmp         .Lloop.ct.1
.Lloop.br.1:
    movl        $0, i.0(%rip)
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
    call        target@PLT
    movl        %eax, -4(%rbp)
    cmpl        $0, j(%rip)
    movl        $0, -8(%rbp)
    sete        -8(%rbp)
    movl        -8(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret         
    .globl      j
    .data       
    .align      4
j:
    .long       3
    .bss        
    .align      4
i.0:
    .zero       4
    .section    .note.GNU-stack,"",@progbits
