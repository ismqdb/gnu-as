.globl main, finish
.type finish, @function
.section .data
    

.section .bss
.section .rodata
    mystring1:
        .string "Odd\n"
    mystring_end1:
        .equ mystring_length1, mystring_end1-mystring1
    mystring2:
        .string "Even\n"
    mystring_end2:
        .equ mystring_length2, mystring_end2-mystring2
    num:
        .8byte 25
    numStr:
        .string "25"
    str1:
        .string "Num "
    str1Len:
        .8byte 4
    str2:
        .string " is:"
    str2Len:
        .8byte 4
    oddStr:
        .string "odd.\n"
    oddStrLen:
        .8byte 5
    evenStr:
        .string "even.\n"
    evenStrLen:
        .8byte 6


.section .text
    main:
        movq num, %rax
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
        pushq %rbp
        movq %rsp, %rbp
        subq $16, %rsp

        pushq %rax
        pushq %rdi
        pushq %rsi
        pushq %rdx

        movq $1, %rax
        movq $1, %rdi
        movq $str1, %rsi
        movq str1Len, %rdx
        syscall

        movq $1, %rax
        movq $1, %rdi
        movq $numStr, %rsi
        movq $2, %rdx
        syscall

        movq $1, %rax
        movq $1, %rdi
        movq $str2, %rsi
        movq str2Len, %rdx
        syscall

        movq $1, %rax
        movq $1, %rdi
        movq $evenStr, %rsi
        movq evenStrLen, %rdx
        syscall

        popq %rdx
        popq %rsi
        popq %rdi
        popq %rax

        movq %rsp, %rbp
        popq %rbp

        jmp finish

    printOddString:
        pushq %rbp
        movq %rsp, %rbp
        subq $16, %rsp

        pushq %rax
        pushq %rdi
        pushq %rsi
        pushq %rdx

        movq $1, %rax
        movq $1, %rdi
        movq $str1, %rsi
        movq str1Len, %rdx
        syscall

        movq $1, %rax
        movq $1, %rdi
        movq $numStr, %rsi
        movq $2, %rdx
        syscall

        movq $1, %rax
        movq $1, %rdi
        movq $str2, %rsi
        movq str2Len, %rdx
        syscall

        movq $1, %rax
        movq $1, %rdi
        movq $oddStr, %rsi
        movq oddStrLen, %rdx
        syscall

        popq %rdx
        popq %rsi
        popq %rdi
        popq %rax

        movq %rsp, %rbp
        popq %rbp

        jmp finish

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