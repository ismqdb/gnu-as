.globl main
.globl allocate, deallocate

.section .data
    memory_start:
        .quad 0
    memory_end:
        .quad 0

.section .text
.equ HEADER_SIZE, 16
.equ HDR_IN_USE_OFFSET, 0
.equ HDR_SIZE_OFFSET, 8
.equ BRK_SYSCALL, 12

allocate_init:
    movq $0, %rdi
    movq $BRK_SYSCALL, %rax
    syscall

    movq %rax, memory_start
    movq %rax, memory_end
    jmp allocate_continue

allocate_move_break:
    movq %rcx, %r8
    movq %rcx, %rdi
    addq %rdx, %rdi
    movq %rdi, memory_end

    movq $BRK_SYSCALL, %rax
    syscall

    movq $1, HDR_IN_USE_OFFSET(%r8)
    movq $1, HDR_SIZE_OFFSET(%r8)

    addq $HEADER_SIZE, %r8
    movq %r8, %rax
    ret

allocate:
    movq %rdi, %rdx
    addq $HEADER_SIZE, %rdx

    cmpq $0, memory_start
    je allocate_init

allocate_continue:
    movq memory_start, %rsi
    movq memory_end, %rcx

allocate_loop:
    cmpq %rsi, %rcx
    je allocate_move_break

    cmpq $0, HDR_IN_USE_OFFSET(%rsi)
    jne try_next_block

    cmpq %rdx, HDR_SIZE_OFFSET(%rsi)
    jb try_next_block

    movq $1, HDR_IN_USE_OFFSET(%rsi)

    addq $HEADER_SIZE, %rsi

    movq %rsi, %rax
    ret

try_next_block:
    addq HDR_SIZE_OFFSET(%rsi), %rsi
    jmp allocate_loop

deallocate:
    movq $0, HDR_IN_USE_OFFSET-HEADER_SIZE(%rdi)
    ret