.globl main
.globl allocate, deallocate

.section .data
    memloc:
        .quad 0
    format:
        .ascii "Address = %x\n"

.section .text
.equ BLOCK_SIZE, 256

main:
    movq $BLOCK_SIZE, %rdi
    call allocate

    movq %rax, %rbx 
    movq %rax, memloc

    movq $format, %rdi
    movq %rbx, %rsi
    movq $0, %rax
    call printf

    movq %rbx, %rdi
    movq $'a', %rsi
    movq $BLOCK_SIZE-1, %rdx
    call memset

    movq $'\0', BLOCK_SIZE-1(%rbx)

    movq $1, %rax
    movq $1, %rdi
    movq %rbx, %rsi
    movq $BLOCK_SIZE-1, %rdx
    syscall

    movq $memloc, %rdi
    call deallocate

    programEnd:
        movq $60, %rax
        syscall