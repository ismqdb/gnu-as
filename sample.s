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
    
    file1path:
        .ascii "input.txt\0"
    file2path:
        .ascii "output.txt\0"
    file1mode:
        .ascii "r\0"
    file2mode:
        .ascii "w\0"

    iomode:
        .ascii "%d\0"

.equ INPUT_FD, -8
.equ OUTPUT_FD, -16
.equ NUMBER, -24

    main:
        enter $32, $0

        movq $file1path, %rdi
        movq $file1mode, %rsi
        call fopen
        movq %rax, INPUT_FD(%rbp)

        movq $file2path, %rdi
        movq $file2mode, %rsi
        call fopen
        movq %rax, OUTPUT_FD(%rbp)

        movq INPUT_FD(%rbp), %rdi
        movq $iomode, %rsi
        leaq NUMBER(%rbp), %rdx
        movq $0, %rax
        call fscanf

        movq OUTPUT_FD(%rbp), %rdi
        movq $iomode, %rsi
        movq NUMBER(%rbp), %rdx
        movq $0, %rax
        call fprintf

    finish:
        movq %rax, %rdi
        movq $60, %rax
        syscall