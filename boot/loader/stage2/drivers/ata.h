#ifndef _ATA_H_
#define _ATA_H_

#include <types.h>

void ata_init(void);
uint_32 ata_detect(uint_16 bus, uint_16 device);
uint_32 ata_get_BAR4(uint_32 address);

#endif
