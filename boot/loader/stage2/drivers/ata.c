#include <types.h>
#include <ioports.h>

#include "ata.h"
#include "console.h"

uint_32 ata_init(void) {
   uint_32 address;

   printb("Detecting IDE controller...");
   if ((address = ata_detect(0, 0, 0)) != 0xffffffff) {
      printb("detected!\n");
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

int pci_exists(uint_32 address_base) {
   outl(PCI_CONFIG_ADDR, address_base);
 
   return inl(PCI_CONFIG_DATA) != 0xffffffff;
}

int pci_is_ide(uint_32 address_base) {
   uint_32 data;

   outl(PCI_CONFIG_ADDR, address_base | ((uint_32) 0x04<< 2));
   data = inl(PCI_CONFIG_DATA);
   putcb('\n');
   printhexb(data);
   putcb('\n');
   return (uint_16) (data >> 16) == 0x0101;
}

uint_32 ata_detect(uint_8 bus, uint_8 device, uint_8 function) {
   uint_32 address_base;

   address_base = ((uint_32) bus      << 16) |
                  ((uint_32) device   << 11) |
                  ((uint_32) function << 8)  |
                  0x80000000;

   if (pci_exists(address_base) && pci_is_ide(address_base)) {
      return address_base;
   }
   else if (function != 8) {
      return ata_detect(bus, device, ++function);
   }
   else if (device != 32) {
      return ata_detect(bus, ++device, 0);
   }
   else if (bus != 255) {
      return ata_detect(++bus, 0, 0);
   }
   else {
      return 0xffffffff;
   }
}

uint_32 ata_get_BAR4(uint_32 address) {
   address |= (uint_32) (0x20 & 0xfc);
   outl(PCI_CONFIG_ADDR, address);

   return inl(PCI_CONFIG_DATA);
}

