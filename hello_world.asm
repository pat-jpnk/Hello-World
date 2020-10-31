; Hello-World program in x86-64 assembly
; from a tutorial by John Hammond


global _start


section .text:

_start:
    mov eax, 0x4              ; "write" syscall
    mov ebx, 1                ; '1' -> file descriptor for stdout
    mov ecx, message          ; use the message as the buffer
    mov edx, message_length   ; supply the message length
    int 0x80                  ; invoke syscall 
    

    ; exit gracefully

    mov eax, 0x1
    mov ebx, 0x0
    int 0x80

section .rodata:                      ; read-only data
    message: db "Hello World!", 0x0A
    message_length equ $-message      ; Explanation of $-message syntax: $ means current location (i.e message_length) - address of message, gives difference between message
                                      ; and message_length = length of string. It only works if they are after one another.
                                        
