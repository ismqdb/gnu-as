.section .data
    .globl people, numpeople
    numpeople:
        .quad (endpeople-people)/PERSON_RECORD_SIZE
    people:
        .ascii "Marko\0"
        .ascii "Djuro\0"
        .ascii "Pero\0"
    endpeople:

    .equ PERSON_RECORD_SIZE, 32