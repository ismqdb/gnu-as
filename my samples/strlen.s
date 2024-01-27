.globl _start
.section .data
    mystring:
        .ascii "This is string.\0"

.section .text
    _start:
        movq $-1, %rcx
        movq $mystring, %rdi
        movb $0, %al
        repne scasb

        subq $mystring, %rdi
        decq %rdi
        
    finish:
        movq $60, %rax
        syscall