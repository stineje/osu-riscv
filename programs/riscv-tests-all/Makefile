TARGETDIR	:= reg-test
TARGET		:= $(TARGETDIR)/reg-test
ROOT		:= ..
LIBRARY_DIRS	:= ${ROOT}/crt0
LIBRARY_FILES	:= crt0
LINK_FLAGS      := -nostartfiles -Wl,-Map=$(TARGET).map

CFLAGS =-march=rv32i -mabi=ilp32 -Wa,-alhs -Wa,-L
CC=riscv32-unknown-elf-gcc
DA=riscv32-unknown-elf-objdump -d


include $(ROOT)/makefile.inc


