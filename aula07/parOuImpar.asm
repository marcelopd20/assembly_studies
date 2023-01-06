%include 'biblioteca.asm'

section .data
    msg db 'Entre com um valor de 3 digitos: ', LF, NULL
    tamMsg equ $ - msg
    parMsg db 'Número par!', LF ,NULL
    tamPar equ $ - parMsg
    imparMsg db 'Número Impar!', LF, NULL
    tamImpar equ $ - imparMsg

section .bss
    num resb 1

section .text

global _start

_start:
    mov eax, 0x4 ; SYS_WRITE
    mov ebx, 0x1 ; STD_OUT
    mov ecx, msg
    mov edx, tamMsg
    int 0x80 

entrada_valor:
    mov eax, 0x3 ; SYS_READ
    mov ebx, 0x0 ; STD_IN
    mov ecx, num
    mov edx, 0x4 ; SYS_WRITE
    int 0x80

    lea esi, [num]
    mov ecx, 0x3 ; len
    call string_to_int ; manda para eax inteiro

verificar:
    mov edx, 0x0 ; zera edx
    mov ebx, 0x2 ; passa 2 para ebx
    div ebx ; EBX 
    cmp edx, 0x0
    jz mostra_par

mostra_impar:
    mov eax, SYS_WRITE
    mov ebx, STD_OUT
    mov ecx, imparMsg
    mov edx, tamImpar
    int SYS_CALL
    jmp saida

mostra_par:
    mov eax, SYS_WRITE
    mov ebx, STD_OUT
    mov ecx, parMsg
    mov edx, tamPar
    int SYS_CALL
    jmp saida

saida:
    mov eax, SYS_EXIT
    mov ebx, RET_EXIT
    int SYS_CALL