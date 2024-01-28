.globl _start, programEnd
.section .data
    num:
        .quad 4

.section .text
    _start:
        movq num, %rax
        movq num, %rdi
        call factOrExp
        
    programEnd:
        #movq %rax, %rdi
        movq $60, %rax
        syscall