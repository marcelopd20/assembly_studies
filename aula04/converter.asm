%include 'biblioteca.asm'

section .data
    v1 dw '105', LF, NULL ; ponteiro de palavra

section .text

global _start

_start:
    call converter_valor
    call mostrar_valor

    mov eax, SYS_EXIT
    mov ebx, RET_EXIT
    int SYS_CALL


converter_valor:
    lea esi, [v1]
    mov ecx, 0x3  ;105 tem 3 caracteres
    call string_to_int
    add eax, 0x2 ; soma eax + 0x2
    ret

mostrar_valor:
    call int_to_string
    call saidaResultado

; ----------------------------------
;        STRING PARA INTEIRO
; ----------------------------------
;   entrada: ESI (valor para converter) ECX(TAM)
;   saida: EAX
; ----------------------------------
string_to_int:
    xor ebx, ebx  ; zera ebx
.prox_digito:
    movzx eax, byte[esi]; associação de registradores, mov 1 elemento de um registrador para outro
    inc esi ; incrementa esi
    sub al, '0' ; subtrai al para 0
    imul ebx, 0xA ; multiplica ebx * 0xA 
    add ebx, eax ; adiciona ebx para eax 
    ; ebx = ebx * 10 + eax
    loop .prox_digito ; while (--ecx) pega controlador(ecx) e subtrai
    mov eax, ebx
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