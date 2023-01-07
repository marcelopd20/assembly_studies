%include 'biblioteca.asm'

section .bss
    altura      resb 0x4
    linha       resb 0x4
    qtdEspaco   resb 0x4
    qtdEstrelas resb 0x4
    qtdLinhas   resb 0x4

section .text

global _start

_start:
    mov byte[altura], 0x8
    mov byte[qtdLinhas], 0x8
    mov byte[linha], 0x1
    mov byte[qtdEstrelas], 0x1

inicio:
    mov edi, dword[altura]
    sub edi, dword[linha]
    call impEspacos
    mov edi, dword[qtdEstrelas]
    call impEstrelas
    sub byte[qtdLinhas], 0x1
    cmp byte[qtdLinhas], 0x0
    je saida
    add byte[qtdEstrelas], 0x2
    add byte[linha], 0x1
    jmp inicio

impEspacos:
    cmp edi, 0x1
    jl finalImpEspaco
    mov edx, 0x1
    call impEspaco
    sub edi, 0x1
    jmp impEspacos

finalImpEspaco:
    ret

impEstrelas:
    cmp edi, 0x1
    je finalImpEstrela
    mov edx, 0x1
    call impEstrela
    sub edi, 0x1
    jmp impEstrelas

finalImpEstrela:
    mov edx, 0x2
    call impEstrela
    ret


saida:
    mov eax, SYS_EXIT
    mov ebx, RET_EXIT
    int SYS_CALL