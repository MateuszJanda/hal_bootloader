[org 0x7c00] ; MBR start address


mov ah, 0x0E ; BIOS command to move our cursor forward
mov al, 'X'  ; Store the character to print in the al register
int 0x10     ; BIOS interrupt - equivalent to print function


jmp $
times 510-($-$$) db 0 ; Byte padding
dw 0xAA55             ; Mandatory, to mark this as valid MBR