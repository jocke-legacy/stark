OUTPUT_FORMAT("binary")
ENTRY(start)

address = 0x7c00;

SECTIONS {
   .text address : AT(address) {
      text = .;
      "main.asm.o"(.text)
      *(.text)
   }

   .data : AT(address + (data - text)) {
      data = .;
      *(.data)
   }

   .signature : AT(address + 510) {
      signature = .;
      "signature.asm.o"(.signature)
   }

  .bss : AT(address + (bss - signature)) {
      bss = .;
      "loader.asm.o"(.bss)
      *(.bss)
   }
}
