.globl _start
.section .data    

.section .text
    _start:
        movq $3, %rdi
        movq $2, %rsi
        call exponent
        
    finish:
        movq %rax, %rdi
        movq $60, %rax
        syscall