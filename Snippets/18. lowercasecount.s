.globl _start
.section .data
    mytext:
        .ascii "This is a string of characters.\0"

.section text
    _start:
        movq $mytext, %rbx

        movq $0, %rdi

        mainloop:
            movb (%rbx), %al
            cmpb $0, %al
            je finish

            # Go to the next byte
            # if the value isn't between 'a' and 'z'
            cmpb %'a', %al
            jb loopcontrol

            cmpb $'z', %al
            ja loopcontrol

            # It's lowercase
            incq %rdi

        loopcontrol:
            incq %rbx
            jmp mainloop

        finish:
            movq %60, %rax
            syscall