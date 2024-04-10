.globl main
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
    main:
        movq num(%rip), %rax
        movq $2, %rbx
        xor %edx, %edx
        divq %rbx
        cmpq $0, %rdx
        jz even
        jnz odd

        odd:
            movq $1, %rax
            movq $1, %rdi

            movq $10, %rcx

            leaq mystring1(%rip), %rsi
            leaq mystring_length1(%rip), %rdx        
            syscall
            jmp finish

        even:
            movq $1, %rax
            movq $1, %rdi

            movq $10, %rcx

            leaq mystring2(%rip), %rsi
            leaq mystring_length2(%rip), %rdx
            
            syscall
            jmp finish
        
    finish:
        movq $0x3c, %rax
        movq $0, %rdi
        syscall