include ../../../config.mk

SUBDIRS := drivers/

CFLAGS += -I./include

SRCS := $(wildcard *.asm *.c)
OBJS := $(addsuffix .o, $(SRCS))

LDSCRIPT := link.ld

BIN := stage2

.PHONY: all clean $(SUBDIRS)

all: $(SUBDIRS) $(BIN)

clean: $(SUBDIRS)
	@echo $(CLEAN_MSG)$(CWD)
	@rm -f $(OBJS) $(BIN)

$(BIN): $(OBJS) $(LDSCRIPT)
	@echo $(LD_MSG)$(CWD)$(BIN)
	@$(LD) $(LDFLAGS) -T $(LDSCRIPT) -o $(BIN) $(OBJS) \
	   $(call rwildcard, $(SUBDIRS), *.o)

%.asm.o: %.asm
	@echo $(AS_MSG)$(CWD)$@
	@$(AS) $(ASFLAGS) -o $@ $<

%.c.o: %.c
	@echo $(CC_MSG)$(CWD)$@
	@$(CC) $(CFLAGS) -o $@ $<

$(SUBDIRS):
	@CWD=$(CWD)$@ $(MAKE) -C $@ $(MAKECMDGOALS)
