OUTPUT_FORMAT("binary")
ENTRY(start)

address = 0x8000;

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

  .bss : AT(address + (bss - data)) {
      bss = .;
      *(.bss)
   }
}
