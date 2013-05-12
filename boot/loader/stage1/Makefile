include ../../../config.mk

SRCS = $(wildcard *.asm)
OBJS = $(addsuffix .o, $(SRCS))

LDSCRIPT = link.ld

BIN = stage1

.PHONY: all clean

all: $(BIN)

clean:
	@echo $(CLEAN_MSG)$(CWD)
	@rm -f $(OBJS) $(BIN)

$(BIN): $(OBJS) $(LDSCRIPT)
	@echo $(LD_MSG)$(CWD)$(BIN)
	@$(LD) -T $(LDSCRIPT) -o $(BIN) $(OBJS)

%.asm.o: %.asm
	@echo $(AS_MSG)$(CWD)$@
	@$(AS) $(ASFLAGS) -o $@ $<
