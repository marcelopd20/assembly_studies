;nasm -f elf64 hello.asm --> transforma o programa para linguagem de máquina
;Linkeditar transformar o programa em linguagem de maquin para um executável
;linkeditor -> ld -s -o hello hello.o

section .data
    
section .text
global _start
_start:
    mov eax, 0x1 ;movimentação de valores(destino, origem), eax(registrador), 1(valor)
    mov ebx, 0x0 ;move para ebx o valor 0, tipo um return 0
    int 0x80 ;manda o valor para o SO e executa, chama o kernel
