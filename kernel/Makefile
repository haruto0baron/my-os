CC=gcc
CFLAGS=-m32 -ffreestanding -nostdlib

all: os.iso

boot.o: boot.asm
	nasm -f elf32 boot.asm -o boot.o

main.o: main.c
	$(CC) $(CFLAGS) -c main.c -o main.o

kernel.bin: boot.o main.o linker.ld
	ld -m elf_i386 -T linker.ld -o kernel.bin boot.o main.o

os.iso: kernel.bin
	mkdir -p iso/boot/grub
	cp kernel.bin iso/boot/kernel.bin
	echo 'menuentry "MyOS" { multiboot /boot/kernel.bin }' > iso/boot/grub/grub.cfg
	grub-mkrescue -o os.iso iso

run: os.iso
	qemu-system-i386 -cdrom os.iso

clean:
	rm -rf *.o *.bin *.iso iso