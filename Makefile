include config.mk

SUBDIRS = boot/loader/

.PHONY: all clean $(SUBDIRS)

all: $(SUBDIRS)
	@echo -e '  Done!'

clean: $(SUBDIRS)
	@echo -e '  Done cleaning!'

$(SUBDIRS):
	@CWD=$@ $(MAKE) -C $@ $(MAKECMDGOALS)
