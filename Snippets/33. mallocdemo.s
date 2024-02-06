.globl main

.section .data
    scanformat:
        .ascii "%499s\0"
    outformat:
        .ascii "%s\n\0"

.section .text
    .equ LOCAL_BUFFER, -8

    main:
        enter $16, $0

        movq $500, %rdi
        call malloc
        movq %rax, LOCAL_BUFFER(%rbp)

        movq $5, (%rax)

        movq stdin, %rdi
        movq $scanformat, %rsi
        movq LOCAL_BUFFER(%rbp), %rdx
        movq $0, %rax
        call fscanf

        movq stdout, %rdi
        movq $outformat, %rsi
        movq LOCAL_BUFFER(%rbp), %rdx
        movq $0, %rax
        call fprintf

        movq LOCAL_BUFFER(%rbp), %rdi
        call free

        movq $0, %rax
        leave
        ret