#ifndef _ATA_H_
#define _ATA_H_

#include <types.h>

#define PCI_CONFIG_ADDR 0x0cf8
#define PCI_CONFIG_DATA 0x0cfc

uint_32 ata_init(void);
uint_32 ata_detect(uint_16 bus, uint_16 device);
uint_32 ata_get_BAR4(uint_32 address);

#endif
