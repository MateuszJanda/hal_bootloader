all: build

build:
	# Flat raw binary (MS-DOS, embedded, ...)
	nasm bootloader.asm -f bin -o bootloader.bin

hexdump:
	hexdump --no-squeezing --format '16/1 "0x%02x, " "\n"' bootloader.bin

clean:
	rm bootloader.bin
