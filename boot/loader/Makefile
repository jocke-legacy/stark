AS = nasm

ASFLAGS = -f elf64

OBJS = a20.o gdt.o pmode.o main.o

LINK_SCRIPT = link.ld

BIN = boot

all: $(OBJS)
	@echo -e '  LD\t$(BIN)'
	@$(LD) -T $(LINK_SCRIPT) -o $(BIN) $(OBJS)

clean:
	@rm -f $(OBJS)

%.o: %.asm
	@echo -e '  AS\t$<'
	@$(AS) $(ASFLAGS) -o $@ $<
