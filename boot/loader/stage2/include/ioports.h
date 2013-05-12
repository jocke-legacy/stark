#ifndef _IO_PORTS_H_
#define _IO_PORTS_H_

#include <types.h>

void out(uint_16 port, uint_32 value);
uint_32 in(uint_16 port);

#endif
