segment .data ; parte de uma seção
    LF       equ 0xA  ; Line break
    NULL     equ 0xD  ; Final da string
    SYS_CALL equ 0x80 ; chama kernel
                      ; valores mandados para eax
    SYS_EXIT equ 0x1  ; código para finalizar o programa
    SYS_READ equ 0x3  ; Operação de leitura
    SYS_WRITE equ 0x4 ; Operação de Escrita
                      ; valores mandados para ebx
    RET_EXIT equ 0x0  ; Operação realizada com sucesso
    STD_IN equ 0x0    ; entrada padrão input
    STD_OUT  equ 0x1  ; saída padrão


section .data ; seção propriamente dita para constantes
    msg db "Entre com seu Nome: ", LF, NULL
    tam equ $- msg

section .bss ; seção para variáveis
    nome resb 1

section .text

global _start

_start:
    mov eax, SYS_WRITE ; passa msg na tela
    mov ebx, STD_OUT   ; chama func 0x1
    mov ecx, msg       ; chama msg
    mov edx, tam       ; passa tamaho
    int SYS_CALL       ; finaliza chamando kernel


    mov eax, SYS_READ  ; chama func 0x3 para leityra
    mov ebx, STD_IN    ; chama func para entrada
    mov ecx, nome      ; recebe entrada
    mov edx, 0xA       ; passa tamanho da entrada
    int SYS_CALL       ; chama kernel


    mov eax, SYS_EXIT   ; 0x0 sucesso
    mov ebx, RET_EXIT   ; finaliza 0x1
    int SYS_CALL