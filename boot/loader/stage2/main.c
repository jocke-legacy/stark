#include "drivers/console.h"
#include "drivers/ata.h"

void bmain(void) {
   clearscr();
   ata_init();
}
