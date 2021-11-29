# C_with_32bitAssembly
Just some c code with 32 bit assembly implemented into it
compile asm: nasm -g -f elf32 -F dwarf -o functions.o functions.asm
link and compile c: gcc -g -Wall -static -m32 -o backandforth backandforth.c functions.o
run: (be in directory with files) ./backandforth
