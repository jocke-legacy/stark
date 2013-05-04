include config.mk

SUBDIRS = boot/loader/

.PHONY: all subdirs $(SUBDIRS)

all: subdirs
	@echo -e '  Done!'

clean: $(SUBDIRS)
	@echo -e '  Done cleaning!'

subdirs: $(SUBDIRS)

$(SUBDIRS):
	@CWD=$@ $(MAKE) -C $@ $(MAKECMDGOALS)
