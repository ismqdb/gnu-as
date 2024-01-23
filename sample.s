.globl _start
.section .data

value:
    .quad 50

.section .text
    _start:        
        movq $value, %rax

        movq $20, (%rax)

        incq %rax
        movq $30, (%rax)
        
        finish:
            movq $60, %rax
            syscall