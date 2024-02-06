.globl main
.globl myvar
.globl myfunc

.type myvar, @object
.type myfunc, @function

.section .text

    main:
        movq $mydata, %rax
        movq $3, 3(%rax)

        
        
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
.section .rodata
    myrodata:
        .quad 7
.section .data
    myvar:
        .quad 0