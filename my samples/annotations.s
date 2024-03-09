.globl main
.globl myvar
.globl myfunc

.type myvar, @object
.type myfunc, @function

.section .text

    main:
        mov $some, %rax    
        
    finish:
        movq %rax, %rdi
        movq $60, %rax
        syscall

    myfunc:
        # Do things
        ret

.section .bss
    mydata:
        .skip 1000, $1
    .lcomm some, 251

.section .rodata
    myrodata:
        .quad 7

.section .data
    myvar:
        .quad 0
    two:
        .2byte 70000
    rand:
        .skip 5, 10
    zero:
        .zero 1000
    align1:
        .balign 8, 12