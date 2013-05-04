include ../../config.mk

ASFLAGS = -f elf64

LDSCRIPT = link.ld

SUBDIRS = drivers/

SRCS  = $(wildcard *.asm)
OBJS = $(SRCS:.asm=.o)

BIN = boot

.PHONY: clean $(SUBDIRS)

all: $(BIN)

clean: $(SUBDIRS)
	@echo $(CLEAN_MSG)$(CWD)
	@rm -f $(OBJS) $(BIN)

$(BIN): $(SUBDIRS) $(OBJS) $(LDSCRIPT)
	@echo $(LD_MSG)$(CWD)$(BIN)
	@$(LD) -T $(LDSCRIPT) -o $(BIN) $(OBJS) $(wildcard drivers/*.o)

%.o: %.asm
	@echo $(AS_MSG)$(CWD)$@
	@$(AS) $(ASFLAGS) -o $@ $<

drivers/:
	@CWD=$(CWD)$@ $(MAKE) -C $@ $(MAKECMDGOALS)
