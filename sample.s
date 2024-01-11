.globl _start
.section .data

.section .text
    _start:
        movq $0, %rcx
        movq $people, %rdx
        movq $people, %rcx

        # Count starts at zero
        movq $0, %rdi

        mainloop:
            movq (%rdx), %rbx
            # Get the next quadword
            movq %rbx, %rax

            cmpb $0, %al
            je nextname

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
            addq $0x8, %rdx
            jmp mainloop

        nextname:
            addq $PERSON_RECORD_SIZE, %rcx
            movq %rcx, %rdx
            jmp mainloop

        finish:
            movq $60, %rax
            syscall