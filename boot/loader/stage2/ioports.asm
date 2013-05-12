bits 32

global out
global in

section .text

in:
   pop   dx
   in    eax, dx

   ret

out:
   pop   eax
   pop   dx
   out   dx, eax

   ret


