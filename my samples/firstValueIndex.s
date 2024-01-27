.globl _start
.section .data
    mystring:
        .ascii "This is string.\0"

.section .text
    _start:
        movq $-1, %rcx
        movq $mystring, %rdi
        movb $'s', %al
        repne scasb

        notq %rcx
        decq %rcx
        
    finish:
        movq $60, %rax
        syscall