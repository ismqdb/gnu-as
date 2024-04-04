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
.equ BLOCK_SIZE, 120

main:
    movq $BLOCK_SIZE, %rdi
    call allocate

    movq %rax, %rdi
    movq $BLOCK_SIZE, %rsi
    call deallocate

    movq $200, %rdi
    call allocate

    movq %rax, %rdi
    movq $200, %rsi
    call deallocate

    programEnd:
        movq $60, %rax
        syscall