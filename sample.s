.globl _start
.section .data

.section .text
    _start:
        # Longest name
        movq $0, %rdi

        # Name index
        movq numpeople, %rcx

        peopleIterator:
            cmpq $0, %rcx
            je finish

            loopq peopleIterator
        
        finish:
            movq $60, %rax
            syscall