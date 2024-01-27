.globl _start
.section .data
    num1:
        .quad 122
    num2:
        .quad 255
    num3:
        .quad 37709

.section .text
    _start:
        movq $63, %rsi
        movq $0b1, %rdi
        movq $0, %rcx

        loop:
            movq num1, %rax
            andq %rdi, %rax
            jz endloop

            movq num2, %rax
            andq %rdi, %rax
            jz endloop

            movq num3, %rax
            andq %rdi, %rax
            jz endloop

            incq %rcx

            endloop:
                shl %rdi
                decq %rsi
                cmpq $0, %rsi
                jne loop

    finish:
        movq $60, %rax
        syscall