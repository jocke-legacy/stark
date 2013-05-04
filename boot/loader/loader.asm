bits 32

global load_kernel

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

   mov   al, 0x41
   mov   ah, 0x07
   mov   edi, 0xb8000
   mov   word [ds:edi], ax

   hlt
