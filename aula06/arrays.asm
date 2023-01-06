%include 'biblioteca.asm'

section .data
    array: DD 10, 22, 13, 14, 55 

section .text

global _start

_start:
    mov EAX, [array + 4 * 0]
    call int_to_string
    call saidaResultado

    mov EAX, 0x1 ; SYS_EXIT
    mov EBX, 0x0 ; RETURN 0
    int 0x80 ; CHAMA KERNEL SYS_CALL