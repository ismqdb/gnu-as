.globl main
.section .text
    prompt:
        .ascii "Enter a number:\0"
    inputStr:
        .ascii "%d\0"
    numStr:
        .ascii "Number %d is %s.\n\0"
    oddStr:
        .ascii "odd.\0"
    evenStr:
        .ascii "even.\0"
    num:
        .quad 0

.equ LOCAL_NUMBER, -8

    main:
        enter $16, $0

        movq stdout, %rdi
        movq $prompt, %rsi
        movq $0, %rax
        call fprintf

        movq stdin, %rdi
        movq $inputStr, %rsi
        leaq LOCAL_NUMBER(%rbp), %rdx
        movq $0, %rax
        call fscanf

        movq LOCAL_NUMBER(%rbp), %rcx

        movq $2, %rbx
        divq %rbx
        cmpq $0, %rdx
        jz even
        jnz odd
        
    finish:
        movq %rax, %rdi
        movq $60, %rax
        syscall

    even:
        movq stdout, %rdi
        movq $numStr, %rsi
        movq %rcx, %rdx
        movq $evenStr, %rcx
        call fprintf

        ret

    odd:
        movq stdout, %rdi
        movq $numStr, %rsi
        movq %rcx, %rdx
        movq $oddStr, %rcx
        call fprintf

        ret