.globl _start, programEnd
.section .data
    num:
        .quad 4

.section .text
    _start:
        movq num, %rax
        movq num, %rdi
        call factOrExp
        
    programEnd:
        movq $60, %rax
        syscall

factOrExp:
    enter $16, $0

    pushq %rax
    pushq %rbx
    pushq %rdx

    movq %rdi, %rax
    movq $2, %rbx
    divq %rbx
    cmpq $0, %rdx
    jz callFact
    jnz callExp

    finish:
    movq %rax, %rdi
    popq %rdx
    popq %rbx
    popq %rax

    leave
    ret

callFact:
    call factorial
    jmp finish

callExp:
    call exponent
    jmp finish

factorial:
    enter $16, $0

    cmpq $1, %rdi
    jne factcontinue

    movq $1, %rax

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
    leave
    ret