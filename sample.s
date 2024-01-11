.globl _start
.section .data

.section .text
    _start:
        movq $people, %rbx
        movq $0, %rdx

        movq $0, %rcx        

        nextperson:
            leaq AGE_OFFSET(%rbx), %rax
            cmpq (%rax), %rdi
            jae endloop

            movq (%rax), %rdi

            endloop:
                addq $PERSON_RECORD_SIZE, %rbx
                incq %rcx
                cmpq %rcx, numpeople
                jnz nextperson
        
        finish:
            movq $60, %rax
            syscall