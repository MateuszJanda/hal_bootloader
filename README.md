Toy project. Simple bootloader written in NASM (variant of Intel assembly syntax).
It resides in MBR memory and doesn't boot OS just print nice HAL graphic.

<p align="center">
<img src="./img/demo.png"/>
</p>

# Build and run
```bash
make
qemu-system-x86_64 -drive format=raw,file=bootloader.bin
```

# Links and credits
- https://medium.com/swlh/an-introduction-to-i386-boot-loader-programming-823354b80846
- https://en.wikipedia.org/wiki/INT_10H
- https://en.wikipedia.org/wiki/Code_page_437
- https://en.wikibooks.org/wiki/X86_Assembly/16,_32,_and_64_Bits
