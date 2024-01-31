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

        movq $2, %rbx
        divq %rbx
        cmpq $0, %rdx
        jz even
        jnz odd
        
    finish:
        movq %rax, %rdi
        movq $60, %rax
        syscall

    printEvenString:
        movq stdout, %rdi
        movq $numStr, %rsi
        movq num, %rdx
        movq $evenStr, %rcx
        call fprintf

        ret

    printOddString:
        movq stdout, %rdi
        movq $numStr, %rsi
        movq num, %rdx
        movq $oddStr, %rcx
        call fprintf

        ret

    odd:
        pushq %rbp
        movq %rsp, %rbp
        subq $16, %rsp

        pushq %rax
        pushq %rdi
        pushq %rcx
        pushq %rsi
        pushq %rdx

        movq $1, %rax
        movq $1, %rdi

        movq $10, %rcx

        call printOddString

        popq %rdx
        popq %rsi
        popq %rcx
        popq %rdi
        #popq %rax

        movq %rbp, %rsp
        popq %rbp

        jmp finish

    even:
        pushq %rbp
        movq %rsp, %rbp
        subq $16, %rsp

        pushq %rax
        pushq %rdi
        pushq %rcx
        pushq %rsi
        pushq %rdx

        movq $1, %rax
        movq $1, %rdi

        movq $10, %rcx

        call printEvenString

        popq %rdx
        popq %rsi
        popq %rcx
        popq %rdi
        #popq %rax

        movq %rbp, %rsp
        popq %rbp

        jmp finish