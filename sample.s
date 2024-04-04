.globl main
.globl allocate, deallocate

.section .data
    memloc:
        .quad 0
    format:
        .ascii "Address = %x\n"
    counter:
        .quad 0

.section .text
.equ BLOCK_SIZE, 17

main:
    movq $BLOCK_SIZE, %rdi
    call allocate

    movq %rax, %rdi
    call deallocate

    programEnd:
        movq $60, %rax
        syscall