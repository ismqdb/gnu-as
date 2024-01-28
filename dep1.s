.globl factOrExp
.section .text

factOrExp:
    pushq %rbp
    movq %rsp, %rbp
    subq $16, %rsp

    pushq %rax
    pushq %rbx
    pushq %rdx

    movq %rdi, %rax
    movq $2, %rbx
    divq %rbx
    cmpq $0, %rdx
    jz factorial
    jnz exponent

    popq %rdx
    popq %rbx
    popq %rax

    ret

factorial:
    pushq %rbp
    movq %rsp, %rbp
    subq $16, %rsp

    cmpq $1, %rdi
    jne factcontinue

    movq $1, %rax
    movq %rbp, %rsp
    popq %rbp
    ret

factcontinue:
    movq %rdi, -8(%rbp)
    decq %rdi
    call factorial

    mulq -8(%rbp)
    leave 
    ret

exponent:
    enter $16, $0
    pushq %rsi
    pushq %rax

    movq $3, %rsi

    movq $1, %rax

    movq %rsi, -8(%rbp)

expmainloop:
    mulq %rdi
    decq -8(%rbp)
    jnz expmainloop
    popq %rax
    popq %rsi
    leave
    ret