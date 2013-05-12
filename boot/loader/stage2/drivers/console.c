#include <types.h>

#include "console.h"

static uint_16 *videomem = (uint_16 *) 0xb8000;
static uint_8 x = 0;
static uint_8 y = 0;

void printb(const char *str) {
   while (*str != '\0') {
      putcb(*str++);
   }
}

void putcb(const char c) {
   videomem[x++ + y*80] = 0x0f00 | c;
   if (x >= 80) {
      x = 0;
      if (y < 24) {
         y++;
      }
      else {
         clearscr();
         y = 0;
      }
   }
}

void clearscr(void) {
   int i;

   for (i = 0; i < 80*25; i++) {
      videomem[i] = 0x0000;
   }
}

