.globl _start
.section .data

.section .text
    _start:
        movq $-5, %rdi
        call abs
        ret