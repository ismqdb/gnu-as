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
    num:
        .quad 24
    

.section .text
    _start:
        movq num, %rax
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
            jmp finish

        even:
            movq $1, %rax
            movq $1, %rdi

            movq $10, %rcx

            movq $mystring2, %rsi
            movq $mystring_length2, %rdx
            
            syscall
            jmp finish
        
    finish:
        movq $0x3c, %rax
        movq $0, %rdi
        syscall