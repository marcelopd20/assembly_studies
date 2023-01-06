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

    TAM_BUFFER  equ 0xA

segment .bss
    BUFFER resb 1

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

; ----------------------------------
;        INTEIRO PARA STRING
; ----------------------------------
;   entrada: inteiro em EAX
;   saida: BUFFER(Valor ECX) TAM_BUFFER (EDX)
; ----------------------------------

int_to_string:
    lea esi, [BUFFER] ; associa variável à registrador
    add esi, 0x9 ; 
    mov byte[esi], 0xA ; 
    mov ebx, 0xA
.prox_digito:
    xor edx, edx ; zera edx
    div ebx ; divide ebx
    add dl, '0' ; adiciona 
    dec esi
    mov [esi], dl
    test eax, eax
    jnz .prox_digito
    ret

; ------------------------------
; Converte string para inteiro
; ------------------------------
; Entrada: ESI (valor conv) ECX (tamanho)
; Saída..: EAX com o valor
; ------------------------------
string_to_int:
    xor ebx, ebx
.prox_digito:
    movzx eax, byte[esi]
    inc esi
    sub al, '0'
    imul ebx, 0xA ; ebx * 10
    add ebx, eax ; ebx + eax
    loop .prox_digito ; while (--ecx)
    mov eax, ebx
    ret