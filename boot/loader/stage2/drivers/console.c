#include <types.h>

#include "console.h"

unsigned short *videomem = (unsigned short *) 0xb8000;
int x = 0;
int y = 0;

void printb(const char *str) {
   while (*str++ != '\0') {
      putcb(*str);
   }
}

void putcb(const char c) {
   videomem[x++] = (unsigned short) c | 0x0f00;
}

void clearscr(void) {
   int i;

   for (i = 0; i < 80*24; i++) {
      videomem[i] = (unsigned short) 0x0000;
   }
}

