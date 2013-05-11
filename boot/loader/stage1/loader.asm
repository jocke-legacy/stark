bits 16

global load_stage2

section .text

load_stage2:
   mov   si, DISK_ADDR_PACKET
   mov   ah, 0x42 ; read from
   mov   dl, 0x80 ; primary master
   int   0x13

   ret

section .data

;  Disk Address Package for stage2
DISK_ADDR_PACKET:
   db    0x10 
   db    0
   dw    8        ; copy 8 setors
   dw    0x8000   ; to 0x8000 offset in
   dw    0x00     ; segment 0x00
   dd    1        ; from sector 1 on disc
   dd    0
