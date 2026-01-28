; nasm -f elf64 main.nasm
; ld main.o -o viewer

section .data
    msg_usage db "Usage: ./viewer <file>", 10
    len_usage equ $ - msg_usage

    msg_error db "Error: cannot open file", 10
    len_error equ $ - msg_error

section .bss
    buffer resb 1024

section .text
    global _start

_start:
    mov rax, [rsp]        ; argc
    cmp rax, 2
    jl usage_error

    mov rax, 2            ; sys_open
    mov rdi, [rsp + 16]   ; argv[1]
    mov rsi, 0            ; O_RDONLY
    ; mov rdx, 0
    syscall

    cmp rax, 0
    jl open_error

    mov r12, rax          ; file descriptor

read_loop:
    mov rax, 0            ; sys_read
    mov rdi, r12
    mov rsi, buffer
    mov rdx, 1024
    syscall

    cmp rax, 0            ; is EOF?
    je close_file

    mov rdx, rax
    mov rax, 1            ; sys_write
    mov rsi, buffer
    mov rdi, 1            ; stdout
    syscall

    jmp read_loop

close_file:
    mov rax, 3            ; sys_close
    mov rdi, r12
    syscall

    jmp exit_ok

usage_error:
    mov rax, 1
    mov rdi, 1
    mov rsi, msg_usage
    mov rdx, len_usage
    syscall
    jmp exit_fail

open_error:
    mov rax, 1
    mov rdi, 1
    mov rsi, msg_error
    mov rdx, len_error
    syscall

exit_fail:
    mov rax, 60
    mov rdi, 1
    syscall

exit_ok:
    mov rax, 60
    xor rdi, rdi
    syscall
