global gdtr

section .data

gdtr:
   ; dummy descriptor, used as gdt pointer to save 8 bytes
   dw    gdt_end - gdtr
   dd    gdtr
   dw    0

   ; flat setup
   ; code descriptor
   dw    0xffff   ; limit  0:15
   dw    0        ; base   0:15
   db    0        ; base   16:23
   db    0x9a     ; access 0:7
   db    0xcf     ; limit  16:19, flags 0:3
   db    0        ; base   24:31

   ; data descriptor
   dw    0xffff   ; limit  0:15
   dw    0        ; base   0:15
   db    0        ; base   16:23
   db    0x92     ; access 0:7
   db    0xcf     ; limit  16:19, flags 0:3
   db    0        ; base   24:31
gdt_end:
