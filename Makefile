all: os.iso

kernel.bin: boot.asm kernel.c
	nasm -f elf64 boot.asm -o boot.o
	gcc -m64 -ffreestanding -c kernel.c -o kernel.o
	ld -n -o kernel.bin -T linker.ld boot.o kernel.o

os.iso: kernel.bin
	mkdir -p iso/boot/grub
	cp kernel.bin iso/boot/
	cp grub/grub.cfg iso/boot/grub/
	grub-mkrescue -o os.iso iso

run: os.iso
	qemu-system-x86_64 -nographic -cdrom os.iso

clean:
	rm -rf *.o *.bin *.iso iso
