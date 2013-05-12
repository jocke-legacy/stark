LD := ld
AS := nasm
CC := gcc

LDFLAGS := -melf_i386 --architecture i386 --noinhibit-exec
CFLAGS  := -m32 -c -O2 -Wall -Wextra  -pedantic -std=c99 \
           -nostdlib -fno-builtin -nostartfiles -nodefaultlibs
ASFLAGS := -f elf32

# these should burn in hell:
.SUFFIXES:

MAKEFLAGS += --no-print-directory

AS_MSG		:= "  AS       "
CC_MSG		:= "  CC       "
LD_MSG		:= "  LD       "
GEN_MSG		:= "  GEN      "
SFS_MSG		:= "  SFS      "
CLEAN_MSG	:= "  CLEAN    "

rwildcard 	 = $(foreach c, $1, \
                  $(foreach d, $(wildcard $c*), \
						   $(call rwildcard, $d/, $2) \
                     $(filter $(subst *, %, $2), $d)))
