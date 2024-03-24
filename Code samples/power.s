.globl main

.section .data
    x:
        .quad 0
    y:
        .quad x

    .equ NUM1_OFFSET, 0
    .equ NUM2_OFFSET, -8
    .equ NUM3_OFFSET, -16
    .equ NUM4_OFFSET, -24

    .equ NUM_OFFSET, +8
    .equ UPPER_LIMIT, +50

.section .text

# int   x = 20;     mov $20, x
# int*  y = &x;     mov $x, y

main:
    movq $x, %rax
    movq $0x0, %rbx

    fill:
        movq %rbx, %rdi
        incq %rdi
        movq $3, %rsi
        call power

        movq %rcx, (%rax, %rbx, NUM_OFFSET)
        incq %rbx
        cmpq $UPPER_LIMIT, %rbx
        jb fill

    endloop:
        movq $60, %rax
        syscall

power:
    // rdi holds the number
    // rsi holds the power
    // rcx holds the result
    pushq %rax
    pushq %rbx

    movq $1, %rax
    movq $0, %rbx

    loop:
        mulq %rdi
        incq %rbx
        cmpq %rbx, %rsi
        jne loop

    movq %rax, %rcx
    popq %rbx
    popq %rax
    ret