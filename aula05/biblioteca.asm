segment .data
    LF          equ 0xA
    NULL        equ 0xD
    SYS_CALL    equ 0x80

    SYS_EXIT    equ 0x1
    SYS_READ    equ 0x3
    SYS_WRITE   equ 0x4

    RET_EXIT    equ 0x0
    STD_IN      equ 0x0
    STD_OUT     equ 0x1

segment .text

;---------------------------------------
; Saida no terminal da string
;---------------------------------------
mst_saida:
    call tamStr
    mov EAX, SYS_WRITE
    mov EBX, STD_OUT
    int SYS_CALL
    ret
    
;---------------------------------------
; Calcular tamanho da string
;---------------------------------------
; entrada -> valor da string pra ECX
; saida tamanho da string na EDX
;---------------------------------------
tamStr:
    mov EDX, ECX ; move edx para ecx
proxchar:
    cmp byte[EDX], NULL ; compara byte
    jz terminei ; edx null -> terminei || inc em edx
    inc EDX
    jmp proxchar
terminei:
    sub EDX, ECX ; subtrai
    ret