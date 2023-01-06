section .text
global Question


Question:
    mov eax, edi
    jmp _testar2
    ret

_testar:
    cmp edi, 0
    je _par
    jl mostra_impar
    sub edi, 2
    jmp _testar

_testar2:
    mov edx, 0x0
    mov ebx, 0x2
    div ebx
    cmp edx, 0x0
    jz _par
    
mostra_impar:
    mov eax, 0
    ret

_par:
    mov eax, 1
    ret
