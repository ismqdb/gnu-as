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
    allocLoop:
        movq $1, %rdi
        call allocate

        movq %rax, memloc
        movq $'a', (%rax)

        movq $1, %rax
        movq $1, %rdi
        movq memloc, %rsi
        movq $1, %rdx
        syscall

        movq $memloc, %rdi
        call deallocate

        incq counter
        cmpq $BLOCK_SIZE, counter
        jne allocLoop

    programEnd:
        movq $60, %rax
        syscall