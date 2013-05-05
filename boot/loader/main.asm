bits 16

global start
extern enter_pmode

section .text

start:
   call  get_memmap
   call  get_pcidevices
   jmp   enter_pmode

get_memmap:
   mov   ax, 0
   mov   es, ax
   mov   di, 0x7e00

   and   ebx, 0
   mov   eax, 0xe820
   mov   edx, 0x534d4150
   mov   ecx, 24
   int   0x15

   jc    .end
   cmp   edx, eax
   jne   .end

   mov   [es:di + 20], dword 1

   .loop:
      mov   ecx, [es:di + 8]
      or    ecx, [es:di + 12]
      jz    .skip

      add   di, 24
      inc   bp

   .skip:
      test  ebx, ebx
      jz    .end

      mov   eax, 0xe820
      mov   ecx, 24
      int   0x15
      jc    .end

      mov   [es:di + 20], dword 1

      jmp   .loop
      
   .end:
      ret

get_pcidevices:
   ret

section .data

db    0x55
db    0xaa
   
