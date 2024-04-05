.globl main

.section .data
    outp:
        .ascii "Hello.\n\0"

.section .text

main:
    enter $0, $0

    call printstuff

    movq $0, %rax
    leave
    ret