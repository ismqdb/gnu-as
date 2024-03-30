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

    movq %rdi, %rbx 
    movq %rdi, memloc

    movq $format, %rdi
    movq %rbx, %rsi
    movq $0, %rax
    call printf

    movq %rbx, %rdi
    movq $'a', %rsi
    movq $BLOCK_SIZE-1, %rdx
    call memset

    movq $'\n', BLOCK_SIZE-2(%rbx)
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