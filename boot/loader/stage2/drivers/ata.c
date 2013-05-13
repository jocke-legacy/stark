#include <types.h>
#include <ioports.h>

#include "ata.h"
#include "console.h"

void ata_init(void) {
   if (ata_detect(0, 0) != 0x000000) {
      printb("IDE controller detected!\n");
   }
   else {
      printb("No IDE controller detected.\n*** Halting...");
      while (1);
   }
}

uint_32 ata_detect(uint_16 bus, uint_16 device) {
   uint_32 address;
   uint_32 offset;
   uint_16 c;

   offset = 0x08;

   if (bus < 256 && device < 32) {
      address = (uint_32) (((uint_32) bus    << 16)  |
                           ((uint_32) device << 11)  |
                           ((uint_32) offset & 0xfc) |
                           ((uint_32) 0x80000000));

      outl(0x0cf8, address);
      if ((c = (uint_16) (inl(0x0cfc)) << 16) == 0x0105) {
         return address ^ (offset & 0xfc);
      }
      else {
         return ata_detect((device < 31 ? bus : bus + 1),
                           (device < 31 ? device + 1 : 0));
      }
   }
   else {
      return 0x00000000;
   }
}

uint_32 ata_get_BAR4(uint_32 address) {
   address |= (uint_32) 0x20;
   outl(0x0cf8, address);

   return inl(0x0cfc);
}

