bits 32

global start

start:
   mov   ebx, 0xb8000
   mov   ax, 0x0f41
   mov   [ebx], ax

   hlt
