bits 16

global load_gdt

section .text

load_gdt:
   lgdt  [gdtr]

   ret


gdtr:
   dw    gdt_end - gdt
   dd    gdt

gdt:
   ; null descriptor
   dw    0
   dw    0
   dw    0
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
