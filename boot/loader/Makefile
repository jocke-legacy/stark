include ../../config.mk

SUBDIRS = stage1/ stage2/

BOOTIMG = boot.img

.PHONY: all clean $(SUBDIRS)

all: $(BOOTIMG)

$(BOOTIMG): $(SUBDIRS)
	@echo $(GEN_MSG)$(CWD)$@
	@../../tools/mkbootimg.sh ./ $(BOOTIMG)

clean: $(SUBDIRS)
	@echo $(CLEAN_MSG)$(CWD)
	@rm -f $(BOOTIMG)

$(SUBDIRS):
	@CWD=$(CWD)$@ $(MAKE) -C $@ $(MAKECMDGOALS)
