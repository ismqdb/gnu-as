.globl _start
.section .data

mytext:
    .ascii "This is a string of characters.\0"

.section .text
    _start:
        # Move the pointer to the string into %rbx
        movq $mytext, %rbx

        # Count starts at zero
        movq $0, %rdi

        mainloop:
            # Get the next quadword
            movq (%rbx), %rax

            # Check if lower byte is zero
            # If it is, end the program
            cmpb $0x20, %al
            jb finish
            
        lowerbyte:
            cmpb $'a', %al
            jb upperbyte
            cmpb $'z', %al
            ja upperbyte
            incq %rdi

        upperbyte:
            cmpb $'a', %ah
            jb shiftbytes
            cmpb $'z', %al
            ja shiftbytes
            incq %rdi

        shiftbytes:
            shr $16, %rax
            cmpb $0, %al
            je nextword
            jne lowerbyte

        nextword:
            addq $8, %rbx
            jmp mainloop

        finish:
            movq $60, %rax
            syscall