#include <types.h>

#include "console.h"

uint_16 *videomem = (uint_16 *) 0xb8000;
uint_8 x = 0;
uint_8 y = 0;

void printb(const char *str) {
   while (*str != '\0') {
      putcb(*str++);
   }
}

void putcb(const char c) {
   if (x >= 80 || c == '\n') {
      x = 0;
      y++;
   }
   if (y > 24) {
      clearscr();
   }
   if (c != '\n') {
      videomem[x++ + y*80] = 0x0f00 | c;
   }
}

void clearscr(void) {
   int i;

   x = 0;
   y = 0;
   for (i = 0; i < 80*25; i++) {
      videomem[i] = 0x0000;
   }
}

