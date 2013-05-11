bits 16

global get_memmap
global MEMMAP_ADDR

get_memmap:
   mov   ax, 0
   mov   es, ax
   mov   di, MEMMAP_ADDR

   xor   ebx, ebx
   mov   eax, 0xe820
   mov   edx, 0x534d4150
   mov   ecx, 24
   int   0x15

   jc    end
   cmp   edx, eax
   jne   end

   mov   [es:di + 20], dword 1

   lp0:
      mov   ecx, [es:di + 8]
      or    ecx, [es:di + 12]
      jz    skip

      add   di, 24
      inc   bp

   skip:
      test  ebx, ebx
      jz    end

      mov   eax, 0xe820
      mov   ecx, 24
      int   0x15
      jc    end

      mov   [es:di + 20], dword 1

      jmp   lp0

   end:
   ret

section .bss

MEMMAP_ADDR resq 512
