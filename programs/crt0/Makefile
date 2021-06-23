TARGETDIR	:= bin
TARGET		:= $(TARGETDIR)/start
ROOT		:= ..
LIBRARY_DIRS	:= 
LIBRARY_FILES	:=
LINK_FLAGS      := -nostartfiles

AFLAGS =-march=rv32i -W
CFLAGS =-march=rv32i

CFLAGS =-march=rv32i -mabi=ilp32 -Wa,-alhs -Wa,-L
CC=riscv32-unknown-elf-gcc
AS=riscv32-unknown-elf-as
AR=riscv32-unknown-elf-ar

all: libcrt0.a

%.o: %.s
	${AS} ${AFLAGS} -c $< -o $@

libcrt0.a: start.o
	${AR} -r $@ $^

clearn:
	rm -rf *.a *.o
