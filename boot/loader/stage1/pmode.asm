bits 16

global enter_pmode
extern enable_a20
extern gdtr

section .text

reload_segments:
   mov   ax, 0x10
   mov   ds, ax
   mov   es, ax
   mov   fs, ax
   mov   gs, ax
   mov   ss, ax

   ret

enter_pmode:
   cli
   lgdt  [gdtr]
   call  enable_a20

   mov   eax, cr0
   or    al, 1
   mov   cr0, eax

   call  reload_segments

   jmp   0x08:0x8000
