section .data
    msg db "Please Enter a number: ", 0
    mlen equ $ - msg
    op db "The number converted: ", 0
    olen equ $ - op

section .text
    global _start

_start:
    ; Prints "Enter a number: "
    mov rax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, mlen
    syscall

    ; Takes the number as input
    mov rax, 0
    mov rdi, 0
    mov rsi, buf
    mov rdx, 20
    syscall
    
    mov rdi, rsi
    call atoi
    
    mov rdi, rax
    mov rax, 60
    syscall

atoi:
    mov rsi, rdi
    xor rax, rax

    .convert_loop:
        movzx rcx, byte [rsi]
        cmp rcx, 10
        je .done
        
        sub rcx, '0'
        imul rax, rax, 10
        add rax, rcx
        inc rsi
        jmp .convert_loop
.done:
    ret

section .bss
    buf resb 20
