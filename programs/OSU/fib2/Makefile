TARGET=fib2
ASFLAGS =-march=rv32i -W
CCFLAGS =-march=rv32i
AS=riscv32-unknown-elf-as
CC=riscv32-unknown-elf-gcc


all: $(TARGET).hex

%.o: %.s
	$(AS) $(ASFLAGS) -c -o $@ $<

%.o: %.c
	$(CC) $(CCFLAGS) -c -o $@ $<

# link
$(TARGET): start.o fib.o
	$(CC) -o $@ $^ -nostartfiles -T linker.x

# convert to hex
$(TARGET).hex: $(TARGET)
	riscv32-unknown-elf-elf2hex --bit-width 32 --input $< --output $@



.PHONY: clean
clean:
	rm -rf $(TARGET) *.o *.hex *.hex.lower *.hex.upper 
