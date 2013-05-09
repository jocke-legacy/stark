bits 16

global enter_pmode
extern enable_a20
extern gdtr
extern load_kernel

section .text

enter_pmode:
   ; get ready for protected mode
   cli
   lgdt  [gdtr]
   call  enable_a20

   ; enter pmode
   mov   eax, cr0
   or    al, 1
   mov   cr0, eax

   jmp   0x08:load_kernel
