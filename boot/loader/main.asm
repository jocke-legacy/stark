bits 16

global start
global memory_map
extern enter_pmode

section .text

start:
   call  get_memmap
   jmp   enter_pmode

get_memmap:
   mov   ax, 0
   mov   es, ax
   mov   di, memory_map

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

memory_map:
