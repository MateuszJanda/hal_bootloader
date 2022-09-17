all: build

build:
	# Flat raw binary (MS-DOS, embedded, ...)
	nasm boot.asm -f bin -o boot.bin

clean:
	rm boot.bin
