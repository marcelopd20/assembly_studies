%include 'biblioteca.asm'

SECTION .data
    msg     db "Hello World! Voltamjjjos ao início....", LF, 'LALALALA', LF
    tamMsg  equ $ - msg
    arq     db "Hello"
    tamArq  equ $ - arq
    fd      dq 0 ; file descriptor

SECTION .text

global _start

_start:
    mov eax, CREATE_FILE
    mov ebx, arq
    mov ecx, 0o664     ; Permissões em octal 1 x  2 w 3 xw 4 r 5 rx 6 rw 7 rwx
    mov edx, tamArq
    int SYS_CALL

escrever:
    mov [fd], eax
    mov eax, WRITE_FILE
    mov ebx, [fd]
    mov ecx, msg
    mov edx, tamMsg
    int SYS_CALL

fechar:
    mov eax, CLOSE_FILE
    mov ebx, [fd]
    int SYS_CALL

termino:
    mov eax, SYS_EXIT
    mov ebx, RET_EXIT
    int SYS_CALL
