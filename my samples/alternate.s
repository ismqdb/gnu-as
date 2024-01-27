.globl _start
.section .data
    mystring1:
        .ascii "Odd\n"
    mystring_end1:
        .equ mystring_length1, mystring_end1-mystring1
    mystring2:
        .ascii "Even\n"
    mystring_end2:
        .equ mystring_length2, mystring_end2-mystring2
    len:
        .quad 10
    

.section .text
    _start:
        xor %rax, %rax
        xor %rbx, %rbx
        xor %rcx, %rcx
        xor %rdx, %rdx

        movq len, %rax
        movq $2, %rbx
        divq %rbx
        cmpq $0, %rdx
        jz even
        jnz odd

        odd:
            movq $1, %rax
            movq $1, %rdi

            movq $10, %rcx

            movq $mystring1, %rsi
            movq $mystring_length1, %rdx        
            syscall
            
            decq len
            cmpq $0, len
            je finish
            jne _start

        even:
            movq $1, %rax
            movq $1, %rdi

            movq $10, %rcx

            movq $mystring2, %rsi
            movq $mystring_length2, %rdx
            
            syscall

            decq len
            cmpq $0, len
            je finish
            jne _start
        
    finish:
        movq $0x3c, %rax
        movq $0, %rdi
        syscall