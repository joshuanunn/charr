    .globl      return_truncated_long
    .text
return_truncated_long:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movq        %rdi, -8(%rbp)
    movl        -8(%rbp), %r10d
    movl        %r10d, -12(%rbp)
    movl        -12(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .globl      return_extended_int
    .text
return_extended_int:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $16, %rsp
    movl        %edi, -4(%rbp)
    movslq      -4(%rbp), %r11
    movq        %r11, -16(%rbp)
    movq        -16(%rbp), %rax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .globl      truncate_on_assignment
    .text
truncate_on_assignment:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $32, %rsp
    movq        %rdi, -8(%rbp)
    movl        %esi, -12(%rbp)
    movl        -8(%rbp), %r10d
    movl        %r10d, -16(%rbp)
    movl        -12(%rbp), %r10d
    cmpl        %r10d, -16(%rbp)
    movl        $0, -20(%rbp)
    sete        -20(%rbp)
    movl        -20(%rbp), %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .globl      main
    .text
main:
    pushq       %rbp
    movq        %rsp, %rbp
    subq        $48, %rsp
    movq        $4294967298, %rdi
    call        return_truncated_long@PLT
    movl        %eax, -4(%rbp)
    movslq      -4(%rbp), %r11
    movq        %r11, -16(%rbp)
    cmpq        $2, -16(%rbp)
    movl        $0, -20(%rbp)
    setne       -20(%rbp)
    cmpl        $0, -20(%rbp)
    je          .Lmain.if.en.3
    movl        $1, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lmain.if.en.3:
    movl        $-10, %edi
    call        return_extended_int@PLT
    movq        %rax, -32(%rbp)
    cmpq        $-10, -32(%rbp)
    movl        $0, -36(%rbp)
    setne       -36(%rbp)
    cmpl        $0, -36(%rbp)
    je          .Lmain.if.en.9
    movl        $2, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lmain.if.en.9:
    movq        $17179869184, %rdi
    movl        $0, %esi
    call        truncate_on_assignment@PLT
    movl        %eax, -40(%rbp)
    cmpl        $0, -40(%rbp)
    movl        $0, -44(%rbp)
    sete        -44(%rbp)
    cmpl        $0, -44(%rbp)
    je          .Lmain.if.en.15
    movl        $4, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
.Lmain.if.en.15:
    movl        $0, %eax
    movq        %rbp, %rsp
    popq        %rbp
    ret
    .section    .note.GNU-stack,"",@progbits
