.globl main

.section .data
    outp:
        .ascii "Hello.\n\0"

main:
    enter $0, 0

    movq stdout, %rdi
    movq $output, %rsi
    call fprintf

    movq $0, %rax
    leave
    ret