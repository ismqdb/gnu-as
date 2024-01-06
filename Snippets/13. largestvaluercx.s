.globl _start

.section .data
    numberofelements:
        .quad 7
    mynumbers:
        .quad 5, 20, 33, 80, 52, 10, 1
    num:
        .quad 35

.section .text

_start:
    movq numberofelements, %rcx

    movq $0, %rbx

    cmp $0, %rcx
    je endloop

    myloop:
        movq mynumbers-8(,%rcx,8), %rax
        cmp %rdi, %rax
        jae loopcontrol
        movq %rax, %rdi

    loopcontrol:
        loopq myloop

    endloop:
        movq $60, %rax
        syscall