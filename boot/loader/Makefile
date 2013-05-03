include $(TOPDIR)/config.mk

ASFLAGS = -f elf64

LDSCRIPT = link.ld

SRCS = $(wildcard *.asm)
OBJS = $(SRCS:.asm=.o)

BIN = boot

.PHONY: clean

all: $(BIN)

clean:
	@echo $(CLEAN_MSG)$(CWD)
	@rm -f $(OBJS) $(BIN)

$(BIN): $(OBJS)
	@echo $(LD_MSG)$(CWD)$(BIN)
	@$(LD) -T $(LDSCRIPT) -o $(BIN) $(OBJS)

%.o: %.asm
	@echo $(AS_MSG)$(CWD)$@
	@$(AS) $(ASFLAGS) -o $@ $<
