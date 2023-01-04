%include 'biblioteca.asm'

section .text

global _start

_start:
    lea esi, [BUFFER];  load effective adress, tudo que passar pra esi passa para buffer
    add esi, 0x9 ; 0x9 ->começo de string
    mov byte[esi], 0xA ;

    dec esi ;
    mov dl, 0x11 ;0x11 -> 'A' 0x31 -> 'a'
    add dl, '0' ; quando adiciona 0 converto 0x11 em string, caractér
    mov  [esi], dl ; move dl para dentro de esi

    dec esi ;
    mov dl, 0x12 ;0x12 -> 'B' 0x32 -> 'b'
    add dl, '0' ; quando adiciona 0 converto 0x12 em string, caractér
    mov  [esi], dl ; move dl para dentro de esi

    dec esi ;
    mov dl, 0x33 ;0x13 -> 'C' 0x33 -> 'c'
    add dl, '0' ; quando adiciona 0 converto 0x12 em string, caractér
    mov  [esi], dl ; move dl para dentro de esi

call saidaResultado

mov eax, SYS_EXIT
mov ebx, RET_EXIT
int SYS_CALL