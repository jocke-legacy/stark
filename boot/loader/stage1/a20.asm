bits 16

global enable_a20

section .text

enable_a20:
   ; do fast a20
   in    al, 0x92
   or    al, 2
   out   0x92, al

   ret
