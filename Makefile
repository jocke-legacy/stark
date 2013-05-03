include config.mk

MAKEFLAGS += --no-print-directory

TOPDIR = $(shell pwd)
export TOPDIR

SUBDIRS = boot/loader/

.PHONY: all subdirs clean_helper $(SUBDIRS)

all: subdirs
	@echo -e '  Done!'

clean: $(SUBDIRS)
	@echo -e '  Done cleaning!'

subdirs: $(SUBDIRS)

$(SUBDIRS):
	@CWD=$@ $(MAKE) -C $@ $(MAKECMDGOALS)
