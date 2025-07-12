section .text
    global _start

_start:
    mov rdi, 13
    mov rsi, 7
    mov rdx, 29
    call max3

    mov rdi, rax
    mov rax, 60
    syscall


max3:
    push rbp
    mov rbp, rsp
    mov r8, rdi

    cmp r8,rsi
    jl .bgreater

.cmpc:
    cmp r8, rdx
    jge .done

    mov r8, rdx
    jmp .done

.bgreater:
    mov r8, rsi
    jmp .cmpc

.done:
    mov rax, r8
    pop rbp
    ret
