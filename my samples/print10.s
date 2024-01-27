.globl _start
.section .data
    mystring:
        .ascii "Hello there\n"
    mystring_end:
        .equ mystring_length, mystring_end-mystring
    len:
        .quad 10

.section .text
    _start:
        printLoop:
            movq $1, %rax
            movq $1, %rdi        

            movq $mystring, %rsi
            movq $mystring_length, %rdx

            syscall
            decq len
            cmpq $0, len
            jnz printLoop
        
    finish:
        movq $0x3c, %rax
        movq $0, %rdi
        syscall