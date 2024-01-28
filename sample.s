.globl _start
.section .data
    num:
        .quad 25

.section .text
    _start:
        movq num, %rax
        movq num, %rdi
        call factOrExp
        
    finish:
        movq %rax, %rdi
        movq $60, %rax
        syscall