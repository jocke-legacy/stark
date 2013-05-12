LD := ld
AS := nasm
CC := gcc

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
