include ../../config.mk

SUBDIRS = stage1/ stage2/

.PHONY: all clean $(SUBDIRS)

all: $(SUBDIRS)

clean: $(SUBDIRS)

$(SUBDIRS):
	@CWD=$(CWD)$@ $(MAKE) -C $@ $(MAKECMDGOALS)
