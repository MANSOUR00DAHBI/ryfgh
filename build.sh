clear 
#!/bin/sh
set -xe 


#Assemble with
nasm -f bin boot.asm -o boot.bin.

# Compile with
gcc -ffreestanding -m32 -c main.c -o main.o.

# Link everything: sh

ld -m i386pe  -T linker.ld -o kernel.bin kernel.o

# Combine bootloader and kernel into one image:sh

cat boot.bin kernel.bin > os-image.bin

# Test your OS in QEMU:sh

qemu-system-x86_64 -drive format=raw,file=os-image.bin

