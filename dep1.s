.section .data
    .globl people, numpeople
    numpeople:
        #.quad (endpeople-people)/PERSON_RECORD_SIZE
    people:
        # Array of people
        .quad $gkcname, 200, 10, 2, 74, 20
        .quad $jbname, 280, 12, 2, 72, 44 # me!
        .quad $cslname, 150, 8, 1, 68, 30
        .quad $taname, 250, 14, 3, 75, 24
        .quad $inname, 250, 10, 4, 70, 11
        .quad $gmname, 180, 11, 5, 69, 65
    endpeople:

    gkcname:
        .ascii "Gilbert Keith Chester\0"
    jbname:
        .ascii "Jonathan Bartlett\0"
    cslname:
        .ascii "Clive Silver Lewis\0"
    taname: 
        .ascii "Tommy Aquinas\0"
    inname:
        .ascii "Isaac Newton\0"
    gmname:
        .ascii "Gregory Mend\0"

    .globl NAME_PTR_OFFSET
    .globl WEIGHT_OFFSET, HAIR_OFFSET
    .globl HEIGHT_OFFSET, AGE_OFFSET
    .globl SHOE_OFFSET

    .equ NAME_PTR_OFFSET, 0
    .equ WEIGHT_OFFSET, NAME_OFFSET+8
    .equ SHOE_OFFSET, WEIGHT_OFFSET+8
    .equ HAIR_OFFSET, SHOE_OFFSET+8
    .equ HEIGHT_OFFSET, HAIR_OFFSET+8
    .equ AGE_OFFSET, HEIGHT_OFFSET+8

    .globl PERSON_RECORD_SIZE
    .equ PERSON_RECORD_SIZE, AGE_OFFSET+8