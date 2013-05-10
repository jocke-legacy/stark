bits 32

global load_kernel
extern pci_scan


reload_segments:
   mov   ax, 0x10
   mov   ds, ax
   mov   es, ax
   mov   fs, ax
   mov   gs, ax
   mov   ss, ax

   ret

load_kernel:
   call  reload_segments
   call  pci_scan

   jc    hang

   mov   edi, 0xb8000
   mov   ax, 0x0f41
   mov   [edi], ax

hang:
   jmp   $

section .data

message db "Success!", 0x00
