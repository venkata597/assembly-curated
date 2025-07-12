section .data
    a dq 13
    b dq 7
    c dq 29
    max dq 0

section .text
    global _start

_start:
    mov r8, [a]
    mov [max], r8
    mov rax, [max]
    mov rbx, [b]
    mov rcx, [c]
    
    cmp rax, rbx
    jl .bgreat
    cmp rcx, rax
    jg .cgreat

.bgreat:
    mov [max], rbx
    jmp .done
.cgreat:
    mov [max],rcx
    jmp .done
.done:    
    mov rdi, [max]
    mov rax, 60
    syscall


