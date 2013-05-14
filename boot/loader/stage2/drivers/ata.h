#ifndef _ATA_H_
#define _ATA_H_

#include <types.h>

#define PCI_CONFIG_ADDR 0xcf8
#define PCI_CONFIG_DATA 0xcfc

uint_32 ata_init(void);
int pci_exists(uint_32 address_base);
int pci_is_ide(uint_32 address_base);
uint_32 ata_detect(uint_8 bus, uint_8 device, uint_8 function);
uint_32 ata_get_BAR4(uint_32 address);

#endif
