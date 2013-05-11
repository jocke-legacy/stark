bits 16

global start
extern get_memmap
extern load_stage2
extern enter_pmode

section .text

start:
   call  get_memmap
   call  load_stage2
   jmp   enter_pmode
