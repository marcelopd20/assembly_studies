; --------------------------------
; Biblioteca para Registradores E
; --------------------------------

segment .data
    LF          equ 0xA     ; Pula Linha
    NULL        equ 0xD     ; Final de String

    SYS_EXIT    equ 0x1     ; Código de chamada para finalizar
    RET_EXIT    equ 0x0     ; Operação com Sucesso
    
    SYS_READ    equ 0x3     ; Operação de Leitura
    SYS_WRITE   equ 0x4     ; Operação de Escrita

    STD_IN      equ 0x0     ; Entrada Padrão
    STD_OUT     equ 0x1     ; Saida Padrão

    READ_FILE   equ 0x3     ; Ler Arquivo
    WRITE_FILE  equ 0x4     ; Escrever no Aqruvio
    OPEN_FILE   equ 0x5     ; Abrir Arquivo
    CLOSE_FILE  equ 0x6     ; Fechar Arquivo
    CREATE_FILE equ 0x8     ; Criar o Arquivo

    OPEN_READ   equ 0x0     ; Arquivo para Leitura
    OPEN_WRITE  equ 0x1     ; Arquivo para Escrita
    OPEN_RW     equ 0x2     ; Arquivo para leitura / escrita
    OPEN_CREATE equ 0x40    ; Se o arquivo não existe, cria
    OPEN_APPEND equ 0x400   ; Arquivo para adição de informação

    SYS_CALL    equ 0x80    ; chama Kernel

