include ../../../config.mk

ASFLAGS = -f elf64

SRCS = $(wildcard *.asm)
OBJS = $(SRCS:.asm=.o)

BIN = boot

.PHONY: all clean

all: $(OBJS)

clean:
	@echo $(CLEAN_MSG)$(CWD)
	@rm -f $(OBJS)

%.o: %.asm
	@echo $(AS_MSG)$(CWD)$@
	@$(AS) $(ASFLAGS) -o $@ $<
