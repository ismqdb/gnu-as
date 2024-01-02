.data
    string:
        .string "Hello, World!\n"
    lenght = . - string

.text
    .globl _start

_start:
    # write the string to stdout
    movl $4, %eax          # syscall: write
    movl $1, %ebx          # file descriptor: STDOUT
    movl $string, %ecx     # pointer to the string
    movl $lenght, %edx     # length of the string
    int $0x80              # interrupt to invoke the kernel

    # exit the program
    movl $1, %eax          # syscall: exit
    xorl %ebx, %ebx        # exit code 0
    int $0x80              # interrupt to invoke the kernel
