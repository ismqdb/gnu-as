.globl _start
.section .data    

.section .text
    _start:
        movq $4, %rdi
        call factorial
        
    finish:
        movq %rax, %rdi
        movq $60, %rax
        syscall