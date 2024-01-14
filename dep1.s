.section .data
    .globl num1, num2
    .globl numbersize

    num1:
        .quad 0,0,0,0,0
    num2:
        .quad 0,0,0,0,0

    .equ numbersize, 5*8

    .globl PERSON_RECORD_SIZE
    .equ PERSON_RECORD_SIZE, AGE_OFFSET+8