.globl main
.globl allocate, deallocate

.section .data
    memory_start:
        .quad 0
    memory_end:
        .quad 0
    size_requested:
        .quad 0

.section .text
.equ HEADER_SIZE, 16
.equ HDR_IN_USE_OFFSET, 0
.equ HDR_SIZE_OFFSET, 8
.equ BRK_SYSCALL, 12
.equ MMAP_SYSCALL, 9

# Register usage:
# %rdx - size requested
# %rsi - pointer to current memory being examined
# %rcx - copy of memory_end

allocate_init:
    # Find the program break
    movq $0, %rdi
    movq $BRK_SYSCALL, %rax
    syscall

    # The current break will be both the start and end of our memory
    movq %rax, memory_start
    movq %rax, memory_end
    jmp allocate_continue

allocate_move_break:
    # Old break is saved in %r8 to return to user
    movq %rcx, %r8

    # Calculate where we want the new break to be
    # (old break+size)
    movq %rcx, %rdi
    addq %rdx, %rdi

    # Save this value
    movq %rdi, memory_end

    pushq %rdx
    pushq %r8

    movq $MMAP_SYSCALL, %rax
    movq memory_start, %rdi
    movq size_requested, %rsi
    movq $0x03, %rdx
    movq $0x22, %r10
    movq $-1, %r8
    movq $0, %r9
    syscall

    popq %r8
    popq %rdx
    #movq %rax, %r8

    # Address is in %r8 - mark size and availability
    movq $1, HDR_IN_USE_OFFSET(%r8)
    movq %rdx, HDR_SIZE_OFFSET(%r8)

    # Actual return value is beyond our header
    addq $HEADER_SIZE, %r8
    movq %r8, %rax
    ret

allocate:
    # Save the amount requested into %rdx
    movq %rdi, %rdx
    movq %rdx, size_requested

    # Actual amount needed is actually larger
    addq $HEADER_SIZE, %rdx

    # If we haven't initialized, do so
    cmpq $0, memory_start
    je allocate_init

allocate_continue:
    movq memory_start, %rsi
    movq memory_end, %rcx

allocate_loop:
    # If we have reached the end of memory
    # we have to allocate new memory by moving the break
    cmpq %rsi, %rcx
    je allocate_move_break

    # is the next block available?
    cmpq $0, HDR_IN_USE_OFFSET(%rsi)
    jne try_next_block

    # is the next block big enough?
    cmpq %rdx, HDR_SIZE_OFFSET(%rsi)
    jb try_next_block

    # This block fits
    # Mark it as unavailable
    movq $1, HDR_IN_USE_OFFSET(%rsi)

    # Move beyond the header
    addq $HEADER_SIZE, %rsi

    # Return the value
    movq %rsi, %rax
    ret

try_next_block:
    # This block didn't work, move to the next one
    addq HDR_SIZE_OFFSET(%rsi), %rsi
    jmp allocate_loop

deallocate:
    # Free is simple - just mark the block as unavailable
    call munmap
    ret