.globl _start
.section .text

_start:
    # Pointer to first record
    leaq people, %rbx

    # Total record count
    movq numpeople, %rcx

    # Brown-hair count
    movq $0, %rdi

    ### Check preconditions ###
    cmpq $0, %rcx
    je finish

    mainloop:
        cmpq $2, HAIR_OFFSET(%rbx)
        jne endloop

        incq %rdi

    endloop:
        addq $PERSON_RECORD_SIZE, %rbx
        loopq mainloop

    finish:
        movq $60, %rax
        syscall