OUTPUT_FORMAT("binary")
ENTRY(start)

address = 0x7c00;

SECTIONS {
   .text address : AT(address) {
      code = .;
/*      *(.text) */
   }
   
   .data : AT(address + 510) {
      data = .;
/*      *(.data) */
   }

   end = .;
}
