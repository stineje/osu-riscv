TARGETDIR	:= reg-test
TARGET		:= $(TARGETDIR)/reg-test
ROOT		:= ..
LIBRARY_DIRS	:= ${ROOT}/crt0
LIBRARY_FILES	:= crt0
LINK_FLAGS      := -nostartfiles -Wl,-Map=$(TARGET).map

CFLAGS =-march=rv32i -mabi=ilp32 -Wa,-alhs -Wa,-L
CC=riscv32-unknown-elf-gcc #switch to 64 for normal stuff; 32 for standard lib stuff
DA=riscv32-unknown-elf-objdump -d


%.o: %.c
		$(CC) $(CFLAGS) $(INC) -c -o $@ $<

montecarlo: montecarlo.o ../crt0/start.o
		$(CC) $(LINK_FLAGS) -g -o $@ $d^ -T ../linker.x

clean:
		rm -rf *.o

monte_carlo.hex: monte_carlo
		riscv64-unknown-elf-elf2hex --bit-width 32 --input $< --output $@
