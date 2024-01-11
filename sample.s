.globl _start
.section .data

.section .text
    _start:
        movq $people, %rbx
        movq $0, %rdx

        nextperson:
            leaq AGE_OFFSET(%rbx), %rax
            cmpq (%rax), %rdx
            ja endloop

            movq (%rax), %rdi

            endloop:
                addq $PERSON_RECORD_SIZE, %rbx
                jmp nextperson
        
        finish:
            movq $60, %rax
            syscall