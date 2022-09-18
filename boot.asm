[org 0x7c00] ; MBR start address


    ; mov ah, 0x0e            ; BIOS command to move our cursor forward
    ; mov al, 'X'             ; Store the character to print in the al register
    ; int 0x10                ; BIOS interrupt - equivalent to print function

; mov ax, HELLO_MSG ; 1st variable

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




mov bx, HAL_TEXT        ; pass argument
call PRINT_TEXT    ; call the function


jmp $


PRINT_TEXT:
    pusha           ; push all registers to stack
    mov ah, 0x0e    ; ;      BIOS command to move our cursor forward
NEXT_CHAR:
    mov al, [bx]        ; Store the character to print in the al register
    xchg   cx, bx       ; Only BX can be used as an index register
    mov bh, 0xc        ; color - light red
    cmp al, 0
    je END_PRINT
    int 0x10        ;  BIOS interrupt - equivalent to print function
    xchg   cx, bx       ; Only BX can be used as an index register
    inc bx
    jmp NEXT_CHAR
END_PRINT:
    popa            ; pop all registers to stack
    ret




HAL_TEXT:
    db "I'm sorry Dave, I'm afraid I can't do that", 0

times 510-($-$$) db 0   ;     Byte padding
dw 0xaa55               ; Mandatory, to mark this as valid MBR
