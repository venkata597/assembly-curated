section .data
    res dq 0

section .text
    global _start

_start:
    mov r9, 10 ; N -- boundary value
    mov r8, 0 ; loop variable

.loop:
    inc r8
    mov rax, [res]
    add rax, r8
    mov [res], rax

    cmp r8,r9
    jne .loop

    mov rdi, [res]
    mov rax, 60
    syscall
