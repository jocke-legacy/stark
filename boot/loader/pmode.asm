bits 16

global enter_pmode
extern enable_a20
extern load_gdt
;extern load_kernel
extern eoc

section .text

load_kernel:
   hlt

enter_pmode:
   ; don't enter protected mode if we're already in it
   mov   eax, cr0
   and   al, 1
   cmp   al, 1
   jne   end

   ; enter protected mode
   cli
   call  load_gdt
   call  enable_a20

   mov   eax, cr0
   or    al, 1
   mov   cr0, eax

   end:
      jmp   0x08:load_kernel
