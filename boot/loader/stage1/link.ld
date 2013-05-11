OUTPUT_FORMAT("binary")
ENTRY(start)

address = 0x7c00;

SECTIONS {
   .text address : AT(address) {
      text = .;
      "main.o"(.text)
      *(.text)
   }

   .data : AT(address + (data - text)) {
      data = .;
      *(.data)
   }

   .signature : AT(address + 510) {
      signature = .;
      "signature.o"( .signature )
   }

  .bss : AT(address + (bss - signature)) {
      bss = .;
      "loader.o"(.bss)
      *(.bss)
   }
}
