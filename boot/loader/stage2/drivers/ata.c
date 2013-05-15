#include <types.h>
#include <ioports.h>

#include "ata.h"
#include "console.h"

uint_32 ata_init(void) {
   uint_32 address;

   printb("Detecting IDE controller...");
   if ((address = ata_detect(0, 0)) != PCI_INVALID) {
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
 
   return inl(PCI_CONFIG_DATA) != PCI_INVALID;
}

int pci_is_ide(uint_32 address_base) {
   outl(PCI_CONFIG_ADDR, address_base | PCI_CLASS_REVISION);

   return inl(PCI_CONFIG_DATA) >> 16  ==  PCI_IDE_CONTROLLER_CLASS;
}

uint_32 ata_detect(uint_8 bus, uint_8 device) {
   uint_32 address_base;

   address_base = ((uint_32) bus      << 16) |
                  ((uint_32) device   << 11) |
                  0x80000000;

   if (pci_exists(address_base) && pci_is_ide(address_base)) {
      return address_base;
   }
   else if (device != 32) {
      return ata_detect(bus, ++device);
   }
   else if (bus != 255) {
      return ata_detect(++bus, 0);
   }
   else {
      return PCI_INVALID;
   }
}

uint_32 ata_get_BAR4(uint_32 address) {
   outl(PCI_CONFIG_ADDR, address | PCI_BAR4);

   return inl(PCI_CONFIG_DATA);
}

