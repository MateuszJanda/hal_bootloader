all: build

build:
	# Flat raw binary (MS-DOS, embedded, ...)
	nasm bootloader.asm -f bin -o bootloader.bin

clean:
	rm bootloader.bin
