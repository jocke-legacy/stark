bits 32

global pci_scan 

section .text

pci_scan:
   and   ebx, 0
   and   ecx, 0

   lp0:
      push  eax
      push  ebx
      push  ecx

      mov   eax, 0x80000020   ; register 0x08, i.e 0x80000000 | (0x08 << 2)
      shl   ebx, 16
      shl   ecx, 11
      or    eax, ebx
      or    eax, ecx

      mov   dx, 0x0cf8
      out   dx, eax

      pop   ecx
      pop   ebx

      mov   dx, 0x0cfc
      in    eax, dx
      
      shr   eax, 16
      cmp   ax, 0x0501        ; is ATA-controller?
      pop   eax
      je    lp0end

      incslot:
         cmp   ecx, 31
         inc   ecx
         jne   lp0

      incbus:
         and   ecx, 0

         cmp   ebx, 255
         je    failed0
         inc   ebx
         jmp   lp0
   lp0end:

   mov   al, 0x80             ; register 0x20, i.e 0x20 << 2
   mov   dx, 0x0cf8
   out   dx, eax

   mov   dx, 0x0cfc
   in    eax, dx
   mov   [ATA_BAR4], eax

   ret

   failed0:
   stc
   ret

section .bss

ATA_BAR4    resw 2
