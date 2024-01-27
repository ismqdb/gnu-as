.globl _start
.section .data
    mystring1:
        .ascii "Hello there\n"
    mystring_end1:
        .equ mystring_length1, mystring_end1-mystring1
    mystring2:
        .ascii "Krompir\n"
    mystring_end2:
        .equ mystring_length2, mystring_end2-mystring2

.section .text
    _start:
        movq $1, %rax
        movq $1, %rdi

        movq $10, %rcx

        movq $mystring1, %rsi
        movq $mystring_length1, %rdx
        
        syscall

        movq $1, %rax
        movq $1, %rdi

        movq $10, %rcx

        movq $mystring2, %rsi
        movq $mystring_length2, %rdx
        
        syscall
        
    finish:
        movq $0x3c, %rax
        movq $0, %rdi
        syscall