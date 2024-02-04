.globl main
.section .data

.section .text
    main:
        movq $-5, %rdi
        call abs
        ret