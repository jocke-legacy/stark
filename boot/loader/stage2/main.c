#include "drivers/console.h"
#include "drivers/ata.h"

void bmain(void) {
   clearscr();

   printb("Stark Loader (Stage2)\n\n");
   ata_init();
}
