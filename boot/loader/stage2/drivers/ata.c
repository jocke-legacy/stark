#include <types.h>
#include <ioports.h>

#include "ata.h"
#include "console.h"

uint_32 ata_init(void) {
   uint_32 address;

   printb("Searching for IDE controller...");
   if ((address = ata_detect(0, 0)) != 0xffffffff) {
      printb("detected!");
      printb("Config address: ");
      printhexb(address);
      putcb('\n');
      return address;
   }
   else {
      printb("not found!\n");
      return address;
   }
}

uint_32 ata_detect(uint_16 bus, uint_16 device) {
   uint_32 address_base, address;

   address_base = ((uint_32) bus    << 16) |
                  ((uint_32) device << 11) |
                  0x80000000;
   address = address_base | (uint_32) (0x10 & 0xfc);

   outl(PCI_CONFIG_ADDR, address);
   if ((uint_16) inl(PCI_CONFIG_DATA) == 0x0105) {
      return address_base;
   }
   else if (bus < 256) {
      if (device < 32) {
         return ata_detect(bus, device + 1);
      }
      else {
         return ata_detect(bus + 1, 0);
      }
   }
   else {
      putcb('\n');
      printhexb(bus);
      putcb('\n');
      printhexb(device);
      putcb('\n');
      return 0xffffffff;
   }
}

uint_32 ata_get_BAR4(uint_32 address) {
   address |= (uint_32) (0x20 & 0xfc);
   outl(PCI_CONFIG_ADDR, address);

   return inl(PCI_CONFIG_DATA);
}

