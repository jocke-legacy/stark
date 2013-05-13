#ifndef _IO_PORTS_H_
#define _IO_PORTS_H_

#include <types.h>

extern uint_8 inb(uint_16 port);
extern uint_16 inw(uint_16 port);
extern uint_32 inl(uint_16 port);
extern void outb(uint_16 port, uint_8 value);
extern void outw(uint_16 port, uint_16 value);
extern void outl(uint_16 port, uint_32 value);

#endif
