.globl _start
.section .data

.section .text
    _start:
        # Longest name
        movq $0, %rdi

        # Name index
        movq $0, %rcx

        
        
        finish:
            movq $60, %rax
            syscall