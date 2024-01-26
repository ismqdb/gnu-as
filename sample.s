.globl _start
.section .data

.section .text
    _start:
        movq $people, %rax
        movq $6, %rcx

        movq $0, %rdx
        movq $0, %rdi

        loop:
            cmpb $0, (%rax)
            je nextword
            incq %rax
            incq %rdx
            jmp loop

        isLongest:
            cmpq %rdx, %rdi
            jg setLongest

        setLongest:
            movq %rdx, %rdi
            jmp cont
            
        nextword:
            jmp isLongest
            cont:
                decq %rcx
                cmpq $0, %rcx
                je finish
                addq $41, %rax
                movq $0, %rdx
                jmp loop
        
        finish:
            movq $60, %rax
            syscall