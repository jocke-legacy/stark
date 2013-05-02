bits 16

global eoc
extern enter_pmode

section .text

start:
   jmp   enter_pmode

; end of code
eoc:
   times 510 - ($-$$) db 0
   db    0x55
   db    0xaa
   
