.globl main

.section .data
    outp:
        .ascii "Hello.\n\0"

.section .text

main:
    enter $0, $0

    movq stdout, %rdi
    movq $outp, %rsi
    call fprintf

    movq $0, %rax
    leave
    ret