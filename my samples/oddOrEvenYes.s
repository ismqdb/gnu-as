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

    scanChar:
        .ascii " %c\0" # Prepend blank space to discard \n

    cont:
        .ascii "Enter Y to continue:\0"

.equ LOCAL_NUMBER, -8
.equ CONTINUE, -16

    main:
        enter $16, $0

        loop:
            movq stdout, %rdi
            movq $prompt, %rsi
            movq $0, %rax
            call fprintf

            movq stdin, %rdi
            movq $inputStr, %rsi
            leaq LOCAL_NUMBER(%rbp), %rdx
            movq $0, %rax
            call fscanf

            movq LOCAL_NUMBER(%rbp), %rax

            movq $2, %rbx
            divq %rbx
            cmpq $0, %rdx
            je even
            jne odd
        jmp loop

        endloop:
            leave
            jmp finish
        
    finish:
        movq %rax, %rdi
        movq $60, %rax
        syscall

    continue:
        movq stdout, %rdi
        movq $cont, %rsi
        movq $0, %rax
        call fprintf

        movq stdin, %rdi
        movq $scanChar, %rsi
        leaq CONTINUE(%rbp), %rdx
        movq $0, %rax
        call fscanf

        cmpb $'Y', CONTINUE(%rbp)

        jne endloop
        je loop

    even:
        movq stdout, %rdi
        movq $numStr, %rsi
        movq LOCAL_NUMBER(%rbp), %rdx
        movq $evenStr, %rcx
        call fprintf

        jmp continue

    odd:
        movq stdout, %rdi
        movq $numStr, %rsi
        movq LOCAL_NUMBER(%rbp), %rdx
        movq $oddStr, %rcx
        call fprintf

        jmp continue