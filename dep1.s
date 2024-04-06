.globl fprintf

.section .data
mytext:
    "Haha! I intercepted you.\n\0"
mytextend:

.section .text:
fprintf:
    movq $1, %rax
    movq $1, %rdi
    leaq mytext(%rip), %rsi
    movq $(mytextend - mytext), %rdx
    syscall
    ret