include ../../../../config.mk

ASFLAGS := -f elf64
CFLAGS  := -c -Wall

SRCS := $(wildcard *.asm *.c)
OBJS := $(addsuffix .o, $(SRCS))

.PHONY: all clean

all: $(OBJS)

clean:
	@echo $(CLEAN_MSG)$(CWD)
	@rm -f $(OBJS)

%.asm.o: %.asm
	@echo $(AS_MSG)$(CWD)$@
	@$(AS) $(ASFLAGS) -o $@ $<

%.c.o: %.c
	@echo $(CC_MSG)$(CWD)$@
	@$(CC) $(CFLAGS) -o $@ $<
