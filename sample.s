.globl main
.section .data
    prompt:
        .ascii "Enter a number:\0"
    inputStr:
        .ascii "%d\0"
    numStr:
        .ascii "Number %d is %s.\n\0"
    oddStr:
        .ascii "odd.\n\0"
    evenStr:
        .ascii "even.\n\0"
    num:
        .quad 0

    main:
        enter $16, $0

        movq stdout, %rdi
        movq $prompt, %rsi
        movq $0, %rax
        call fprintf

        movq stdin, %rdi
        movq $inputStr, %rsi
        movq $num, %rdx
        movq $0, %rax
        call fscanf
        
    finish:
        movq %rax, %rdi
        movq $60, %rax
        syscall
