.section .text
.globl _start

_start:
    # %rbx will hold the base
    movq $2, %rbx

    # %rcx will hold the current exponent count
    movq $3, %rcx

    # Store the accumulated value in %rax
    movq $1, %rax

    cmpq $0, %rcx
    je complete

    mainloop:
        # Multiply the accumulated value by our base
        mulq %rbx

        loopq mainloop
    
    complete:
        # Move the accumulated value to %rdi so we can return it
        movq %rax, %rdi
        movq $60, %rax
        syscall

