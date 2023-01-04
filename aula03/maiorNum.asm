segment .data:
    LF      equ 0xA
    NULL    equ 0xD
    SYS_CALL equ 0x80

    SYS_EXIT equ 0x1
    SYS_READ equ 0x3
    SYS_WRITE equ 0x4

    RET_EXIT equ 0x0
    STD_IN equ 0x0
    STD_OUT equ 0x1

section .data
    x dd 10 ; db = define byte, 
            ; dw = define word, 
            ; dd = define double word(~int~short)
            ; dq = define quad word 
            ; dt = define ten wordss 
    y dd 50
    msg1 db 'X é maior que Y', LF, NULL
    tam1 equ $ - msg1
    msg2 db 'Y é maior que X', LF, NULL
    tam2 equ $ - msg2

section .text

global _start
_start: ; sempre em assembly precisa de registradores
        ; passar var para o registrador e depois processa
    mov eax, DWORD[x] ; movimentação de data para dentro dos registradores
    mov ebx, DWORD[y] ; movimenta ponteiro para dentro dos registradores
    ; if - comparação
    cmp eax, ebx ; compara, olha para os dois registadores
    ; salto condicional
    ; je = jg > jge >= jl <  jle <= jne !=
    ; salto incondicional
    ; jmp goto
    jge maior ; eax >= ebx
    mov ecx, msg2
    mov edx, tam2
    jmp final ; pula para o final, pula bloco maior

maior:
    mov ecx, msg1
    mov edx, tam1

final:
    mov eax, SYS_WRITE
    mov ebx, STD_OUT
    int SYS_CALL

    mov eax, SYS_EXIT
    mov ebx, RET_EXIT ; xor EBX, EBX  - > diferença aqui é igual a 0
    int SYS_CALL      ; AND OR XOR

; 8421 régua binaria
;      AND    OR     XOR(diferença entra valores 0111 - 0101 = 0010 -> 7 - 5 = 2)
; 7 - 0111  0111    0111  0111
; 5 - 0101  0101    0101  
;     0101  0111    0010  
;       5     7       2 