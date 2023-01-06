%include 'biblioteca.asm'

SECTION .data
    msg1: DB 'Parte 1', LF, NULL
    msg2: DB 'Parte 2', LF, NULL
    msg3: DB 'Parte 3', LF, NULL
    msg4: DB 'Parte 4', LF, NULL

SECTION .text

GLOBAL _start

_start:
    mov eax, 0x4 ;SYS_WRITE
    mov ebx, 0x1 ;STD_OUT
    mov ecx, msg1 
    mov edx, 0xFF
    int 0x80 ; chama kernel

    mov eax, 0x1 ; SYS_EXIT
    mov ebx, 0x0 ; EXIT_SUCESS / RETURN 0
    int 0x80 ; SYSCALL

