segment .data
    LF          equ 0xA ; Pula Linha
    NULL        equ 0xD ; passa null
    SYS_CALL    equ 0x80 ; chama kernel
    ; EAX
    SYS_EXIT    equ 0x1 ; finaliza
    SYS_READ    equ 0x3 ; chama entrada
    SYS_WRITE   equ 0x4 ; escrita
    ; EBX
    RET_EXIT    equ 0x0 ; return 0
    STD_IN      equ 0x0 ; ; input
    STD_OUT     equ 0x1 ; output

    TAM_BUFFER  equ 0xA ;passa biblioteca com 10 posições


segment .bss
    BUFFER resb 0x1

segment .text

saidaResultado:
    ;jmp -> GOTO ponto
    ; call -> GOSUB ponto retorna até o ret
    ; ret retorna
    mov eax, SYS_WRITE
    mov ebx, STD_OUT
    mov ecx, BUFFER
    mov edx, TAM_BUFFER
    int SYS_CALL
    ret