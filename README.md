NASM uses a variant of Intel assembly syntax.

# Build
```bash
make
```

# Run application:
```bash
qemu-system-x86_64 -drive format=raw,file=boot.bin
```

# Links:
- https://medium.com/swlh/an-introduction-to-i386-boot-loader-programming-823354b80846
- https://en.wikipedia.org/wiki/Code_page_437
- https://en.wikibooks.org/wiki/X86_Assembly/16,_32,_and_64_Bits