include ../../config.mk

SUBDIRS = stage1/ stage2/

BOOTIMG = boot.img

.PHONY: all clean $(SUBDIRS)

all: $(SUBDIRS) $(BOOTIMG)

$(BOOTIMG): stage1/stage1 stage2/stage2
	@echo $(GEN_MSG)$(CWD)$@
	@$(shell ../../tools/mkbootimg.sh ./ $(BOOTIMG) > /dev/null 2>&1)

clean: $(SUBDIRS)
	@echo $(CLEAN_MSG)$(CWD)
	@rm -f $(BOOTIMG)

$(SUBDIRS):
	@CWD=$(CWD)$@ $(MAKE) -C $@ $(MAKECMDGOALS)
