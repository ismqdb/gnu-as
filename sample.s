.globl _start
.section .data

.section .text
    _start:
        # Longest name
        movq $0, %rdi

        # Name index
        movq $0, %rcx

        # Pointer to name
        movq $people, %rbx

        checkname:
            movq %rbx, %rax
            addq %rcx, %rax

            cmpq $0, (%rax)
            je nextname

            

            incq %rcx
            jmp checkname

        nextname:
            addq $PERSON_RECORD_SIZE, %rbx
            movq $0, %rcx
            cmpq %rcx, %rdi
            jg newbiggest

        newbiggest:
            movq %rcx, %rdi
            jmp nextname

        isletter:
            movq $0, %rsi

        isLowercaseLetter:
            

        isUppercaseLetter:

        
        finish:
            movq $60, %rax
            syscall