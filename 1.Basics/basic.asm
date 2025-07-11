section .text
    global _start

_start:
    mov r8, 10
    mov r9, 2
    add r8,r9

    mov rax, 60
    xor rdi, r8 ; For now returns the value that was in r8 reg
    syscall
