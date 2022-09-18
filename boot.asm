[bits 16]           ; generate code designed to run on a processor operating in 16-bit mode
[org 0x7c00] ; MBR start address


jmp main

    ; mov ah, 0x0e            ; BIOS command to move our cursor forward
    ; mov al, 'X'             ; Store the character to print in the al register
    ; int 0x10                ; BIOS interrupt - equivalent to print function

; mov ax, HELLO_MSG ; 1st variable

main:
    ; set video mode
    mov ah, 0x00
    mov al, 0x03
    int 0x10


    ; set cursor position
    mov ah, 0x02
    mov dh, 1
    mov dl, 1
    int 0x10

    ; set colors
    mov ah, 0x0b




    mov si, hal_text        ; pass argument
    call print_text    ; call the function


    jmp $


print_text:
    pusha           ; push all registers to stack
    mov ah, 0x09    ; ;      Write Character and Attribute
    mov     cx, 2
    cld
next_char:
    lodsb
    ; mov ah, 0x09
    ; mov al, [bx]        ; Store the character to print in the al register
    cmp al, 0
    je end_print
    ; xchg   dx, bx       ; Only BX can be used as an index register
    mov bl, 0x04        ; color - light red
    int 0x10        ;  BIOS interrupt - equivalent to print function
    ; xchg   dx, bx       ; Only BX can be used as an index register
    inc bx
    jmp next_char
end_print:
    popa            ; pop all registers to stack
    ret




hal_text:
    db "I'm sorry Dave, I'm afraid I can't do that", 0

times 510-($-$$) db 0   ;     Byte padding
dw 0xaa55               ; Mandatory, to mark this as valid MBR
