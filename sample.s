.globl _start

.section .data
    numberofelements:
        .quad 7
    mynumbers:
        .quad 5, 20, 33, 80, 52, 10, 1
    num:
        .quad 52

.section .text

_start:
    movq $0, %rcx
    movq num, %rdx

    myloop:
        movq mynumbers(, %rbx, 8), %rax
        cmp %rax, %rdx 
        je found
        incq %rbx
        
        incq %rcx
        cmp $numberofelements, %rcx
        jne myloop

    cmp $0, %rcx
    je notfound  

    found:
        mov %rcx, %rdi  
        jmp endloop

    notfound:
        mov $0, %rdi
        jmp endloop

    endloop:
        movq $60, %rax
        syscall