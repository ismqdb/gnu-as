.section .text
.globl _start

_start:
    # %rbx will hold the base
    movq $2, %rbx

    # %rcx will hold the current exponent count
    movq $3, %rcx

    # Store the accumulated value in %rax
    movq $1, %rax

    mainloop:
        # Adding zero will allow us to use the flags to
        # determine if %rcx has zero to begin with
        addq $0, %rcx

        # If the exponent is zero, we are done
        jz complete

        # Otherwise, multiply the accumulated value by our base
        mulq %rbx

        # Decrement the counter
        decq %rcx

        # Go back to the beginning of the loop and try again
        jmp mainloop
    
    complete:
        # Move the accumulated value to %rdi so we can return it
        movq %rax, %rdi
        movq $60, %rax
        syscall

