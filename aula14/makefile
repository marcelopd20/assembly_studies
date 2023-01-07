NOME = piramide

all: $(NOME).o
	ld $(NOME).o -o $(NOME)
	rm -rf *.o

%.o: %.asm
	nasm -f elf64 $<