#ifndef _ATA_H_
#define _ATA_H_

#include <types.h>

#define PCI_CONFIG_ADDR 0xcf8
#define PCI_CONFIG_DATA 0xcfc
#define PCI_INVALID     0xffffffff

#define PCI_IDE_CONTROLLER_CLASS 0x1234
#define PCI_CLASS_REVISION       0x08
#define PCI_BAR4                 0x20

uint_32 ata_init(void);
int pci_exists(uint_32 address_base);
int pci_is_ide(uint_32 address_base);
uint_32 ata_detect(uint_8 bus, uint_8 device);
uint_32 ata_get_BAR4(uint_32 address);

#endif
