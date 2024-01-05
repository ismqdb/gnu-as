.section .text
.globl _start

_start:
    movq $9, %rax
    movq $2, %rcx
    
    loop:
        subq %rcx, %rax
        cmpq $0, %rax
        cmpq $1, %rax
        jne loop
    
    movq %rax, %rdi
    movq $60, %rax
    syscall