.globl factorial

.section .text
    factorial:
        pushq $0

        pushvalues:
            pushq %rax
            decq %rax
            jnz pushvalues

            movq $1, %rax

            multiply:
                popq %rcx

                cmpq $0, %rcx
                je finish

                mulq %rcx

                jmp multiply
        
        finish:
        ret