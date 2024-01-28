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

    finish:
    movq %rax, %rdi
    popq %rdx
    popq %rbx
    popq %rax

    leave
    jmp programEnd

factorial:
    pushq %rbp
    movq %rsp, %rbp
    subq $16, %rsp

    cmpq $1, %rdi
    jne factcontinue

    movq $1, %rax
    movq %rbp, %rsp
    popq %rbp

    leave
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
    movq %rdi, %rax

    pushq %rsi
    pushq %rax

    movq $3, %rsi

    movq $1, %rax

    movq %rsi, -8(%rbp)
    jmp expmainloop

expmainloop:

    mulq %rdi
    decq -8(%rbp)
    jnz expmainloop    
    jmp finish