segment .data ; parte de uma seção
    LF       equ 0xA  ; Line feed
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


section .data ; seção propriamente dita