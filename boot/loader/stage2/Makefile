include ../../../config.mk

ASFLAGS	= -f elf64
CFLAGS	= -c -Wall

ASSRCS = $(wildcard *.asm)
CSRCS  = $(wildcard *.c)
OBJS   = $(ASSRCS:.asm=.o) \
         $(CSRCS:.c=.o)

LDSCRIPT = link.ld

BIN = stage2

.PHONY: all clean

all: $(BIN)

clean:
	@echo $(CLEAN_MSG)$(CWD)
	@rm -f $(OBJS) $(BIN)

$(BIN): $(OBJS) $(LDSCRIPT)
	@echo $(LD_MSG)$(CWD)$(BIN)
	@$(LD) -T $(LDSCRIPT) -o $(BIN) $(OBJS) 	

%.o: %.asm
	@echo $(AS_MSG)$(CWD)$@
	@$(AS) $(ASFLAGS) -o $@ $<

%.o: %.c
	@echo $(CC_MSG)$(CWD)$@
	@$(CC) $(CFLAGS) -o $@ $<
