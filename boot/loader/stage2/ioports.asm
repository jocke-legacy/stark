bits 32

global inb
global inwke
global inl
global outb
global outw
global outl

section .text

inb:
   push  ebp
   mov   ebp, esp
   mov   dx, word [ebp+8]
   xor   eax, eax
   in    al, dx

   leave
   ret

inw:
   push  ebp
   mov   ebp, esp
   mov   dx, word [ebp+8]
   xor   eax, eax
   in    ax, dx

   leave
   ret

inl:
   push  ebp
   mov   ebp, esp
   mov   dx, word [ebp+8]
   in    eax, dx

   leave
   ret

outb:
   push  ebp
   mov   ebp, esp
   mov   dx, word [ebp+8]
   mov   al, byte [ebp+10]
   out   dx, al

   leave
   ret

outw:
   push  ebp
   mov   ebp, esp
   mov   dx, word [ebp+8]
   mov   ax, word [ebp+10]
   out   dx, ax

   leave
   ret

outl:
   push  ebp
   mov   ebp, esp
   mov   dx, word [ebp+8]
   mov   eax, dword [ebp+10]
   out   dx, eax

   leave
   ret
