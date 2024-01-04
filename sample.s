.section .data
    hello_msg:
        .ascii "Hello, World!"

.section .text
    .globl _start

_start:
    # write syscall (write to stdout)
    mov $1, %rax            # syscall number for sys_write
    mov $1, %rdi            # file descriptor 1 (stdout)
    mov $hello_msg, %rsi    # pointer to the message
    mov $13, %rdx           # message length

    movb $77, 0x402000

    syscall

    # exit syscall
    mov $60, %rax           # syscall number for sys_exit
    xor %rdi, %rdi          # exit code 0
    syscall
