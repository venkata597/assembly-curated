section .data
    msg db "Enter your name: ", 17
    len equ $ - msg
    greet db "Hello,", 6
    glen equ $ - greet
section .text
    global _start

_start:
    ; PRINTS "Enter your name: "
    mov rax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, len
    syscall
    
    ; Takes user input
    mov rax, 0
    mov rdi, 0
    mov rsi, name
    mov rdx, 100
    syscall
    
    mov r9, rax ;Stores the length of the input buffer
    add r9, 1 ; For a new-line, potential bug
    
    mov rax, 1
    mov rdi, 1
    mov rsi, greet
    mov rdx, glen
    syscall
    ; Print name
    mov rax, 1
    mov rdi, 1
    mov rsi, name
    mov rdx, r9
    syscall

    mov rax, 60
    xor rdi,rdi
    syscall

section .bss
    name db 50

