OUTPUT_FORMAT("binary")
ENTRY(start)

address = 0x7c00;

SECTIONS {
   .text address : AT(address) {
      code = .;
      *(.text)
   }
   end = .;
}
