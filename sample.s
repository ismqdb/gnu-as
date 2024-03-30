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
.equ BLOCK_SIZE, 256

main:
    movq $1000, %rdi
    call allocate

    programEnd:
        movq $60, %rax
        syscall