NASM uses a variant of Intel assembly syntax.

# Build and run
```bash
make
qemu-system-x86_64 -drive format=raw,file=boot_loader.bin
```

# Links:
- https://medium.com/swlh/an-introduction-to-i386-boot-loader-programming-823354b80846
- https://en.wikipedia.org/wiki/INT_10H
- https://en.wikipedia.org/wiki/Code_page_437
- https://en.wikibooks.org/wiki/X86_Assembly/16,_32,_and_64_Bits