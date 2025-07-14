section .data
    newline db 10
    buffer db 20 dup(0)

section .text
    global _start

_start:
    mov rdi, 12345
    call print_int
    
    mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, 1
    syscall

    mov rax, 60
    xor rdi, rdi
    syscall

print_int:
    mov rcx, buffer+20
    .convert_loop:
        xor rdx,rdx
        mov rax, rdi
        mov rbx, 10
        div rbx
        add dl, '0'
        dec rcx
        mov [rcx], dl
        mov rdi, rax
        test rax, rax
        jnz .convert_loop

    mov rax, 1
    mov rdi, 1
    mov rsi, rcx
    mov rdx, buffer+20
    sub rdx, rcx
    syscall
    ret
