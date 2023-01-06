%include 'biblioteca.asm'

section .text

global _start

_start:
    mov edx, 0x0
    mov eax, 0xA ; 10
    mov ebx, 0x3 ; 
    div ebx ; EAX = EAX / EBX -> resto fica em EDX

    ; mov eax, eax
    mov eax, edx
    call int_to_string
    call saidaResultado

saida:
    mov eax, 0x1
    int 0x80

