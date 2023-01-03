;compilar - Transformar o programa para linguagem de m´quina
; nasm -f elf64 hello.asm
;Linkeditar - transformar o prograa em linguagem de máquina para um executável
; ld -s -o * *.o

section .data
    msg db 'Hello World, Marcelão!', 0xA ;msg(ponteiro) db string 0xA indica quebra de linha
    tam equ $- msg ;passa tamanho da string tam é um ponteiro
    msgC db 'Hello World, Marcelão!', 0xA 

section .text

global _start
_start:
    mov eax, 0x4 ; 0x4 manda para o output padrão
    mov ebx, 0x1 ;ebx e eax são pareados, e ebx também aponta para output
    mov ecx, msg; passa mensagem para registrador 
    mov edx, tam; passa tamanho para registrador
    int 0x80


    mov eax, 0x1
    mov ebx, 0x0
    int 0x80