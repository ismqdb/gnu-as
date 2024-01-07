.globl _start
.section .text

_start:
    # Pointer to first record
    leaq people, %rbx

    # Record count
    movq numpeople, %rcx

    # Tallest value found
    movq $0, %rdi

    ### Check preconditions ###
    # If there is no records, finish
    cmpq $0, %rcx
    je finish

    # Main loop ###
    mainloop:
        # %rbx is the pointer to the whole struct
        # This instruction grabs the height field
        # and stores it in %rax
        movq HEIGHT_OFFSET(%rbx), %rax

        # If it is less than or equal to our current
        # tallest, go to the next one
        cmpq %rdi, %rax
        jbe endloop

        # Copy this value as the tallest value
        movq %rax, %rdi

    endloop:
        # Move %rbx to point to the next record
        addq $PERSON_RECORD_SIZE, %rbx

        # Decrement %rcx and do it again
        loop mainloop

    finish:
        movq $60, %rax
        syscall
    