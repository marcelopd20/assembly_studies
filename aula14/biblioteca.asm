segment .data
    LF          equ 0xA
    NULL        equ 0xD
    SYS_CALL    equ 0x80

    SYS_EXIT    equ 0x1
    SYS_READ    equ 0x3
    SYS_WRITE   equ 0x4

    RET_EXIT    equ 0x0
    STD_IN      equ 0x0
    STD_OUT     equ 0x0

    estrela db '*',LF;
    espaco db ' ', LF;

segment .text

impEstrela:
    mov eax, SYS_WRITE
    mov ebx, STD_OUT
    mov ecx, estrela
    int SYS_CALL
    ret
    
impEspaco:
    mov eax, SYS_WRITE
    mov ebx, STD_OUT
    mov ecx, espaco
    int SYS_CALL
    ret

