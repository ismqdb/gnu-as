.globl _start
.section .data

.section .text
    _start:
        movq $num1, %rsi
        movq $num2, %rdi
        movq $result, %rdx
        movq $4, %rcx

        loop:
            movq (%rsi, %rcx, 8), %rax
            movq (%rdi, %rcx, 8), %rbx

            adcq %rbx, %rax
            movq %rax, (%rdx, %rcx, 8)

            decq %rcx
            cmpq $0, %rcx
            jnl loop
        
    finish:
        movq $60, %rax
        syscall