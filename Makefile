all: build

build:
	# Flat raw binary (MS-DOS, embedded, ...)
	nasm boot_loader.asm -f bin -o boot_loader.bin

clean:
	rm boot_loader.bin
