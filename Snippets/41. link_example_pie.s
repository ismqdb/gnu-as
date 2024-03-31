.globl main

.section .data
    outp:
        .ascii "Hello.\n\0"

main:
    enter $0, $0

    movq stdout@GOTPCREL(%rip), %rdi
    movq (%rdi), %rdi
    leaq outp(%rip), %rsi
    call fprintf

    movq $0, %rax

    leave
    ret