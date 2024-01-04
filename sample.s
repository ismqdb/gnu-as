.globl _start
.section .text

_start:
    movb $0xFF, %al
    addb $0xFF, %ah

    movw $0xFF00, %ax
    addw $0x00FF, %ax

    movl $0xFFFF0000, %eax
    addl $0x0000FFFF, %eax

    movabsq $0xFFFFFFFF00000000, %rax
    movabsq $0x00000000FFFFFFFF, %rbx

    addq %rbx, %rax

    movq $60, %rax
    syscall
