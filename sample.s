.globl _start
.section .data

.section .text
    _start:
        movq $people, %rbx
        movq $0, %rdx

        movq $numpeople, %rcx

        nextperson:
            leaq AGE_OFFSET(%rbx), %rax
            cmpq (%rax), %rdx
            ja endloop

            movb (%rax), %dl

            endloop:
                addq $PERSON_RECORD_SIZE, %rbx
                loopq nextperson
        
        finish:
            movq $60, %rax
            syscall