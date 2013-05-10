bits 32

section .text

; sector count:
;    Push 1: 16 bit 
;
; LBA:
;    Push 2: 32 bit - high qword
;    Push 3: 16 bit - low word
ata_read:
   pop   cx
   pop   ebx

   mov   al, 0x40
   mov   dx, 0x01f6
   out   dx, al      ; select master

   pop   ax
   ror   ax, 8
   mov   dx, 0x01f2  ; high byte, sector count
   out   dx, al
   ror   ax, 8

   ; LBA 4-6
   ror   ebx, 16
   mov   al, bl
   mov   dx, 0x01f3
   out   dx, al
   mov   al, bh
   mov   dx, 0x01f4
   out   dx, al
   ror   ebx, 16
   mov   al, bl
   mov   dx, 0x01f5
   out   dx, al

   mov   dx, 0x01f2
   out   dx, al      ; lowbyte, sector count

   ; LBA 1-3
   mov   al, bh
   mov   dx, 0x01f3
   out   dx, al
   mov   al, ch
   mov   dx, 0x01f4
   out   dx, al
   mov   al, cl
   mov   dx, 0x01f5
   out   dx, al
   mov   al, 0x24
   mov   dx, 0x01f7
   out   dx, al      ; send read command
