.globl _start
.section .data

.section .text
    _start:
        movq $0b1111, %rdi
        orq $0b10000, %rdi
        
    finish:
        movq $60, %rax
        syscall