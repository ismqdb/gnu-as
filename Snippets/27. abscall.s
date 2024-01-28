.globl _start
.section .data

.section .text
    _start:
        movq $-5, %rdi
        call abs
        
    programEnd:
        movq %rax, %rdi
        movq $60, %rax
        syscall