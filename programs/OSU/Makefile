CC32 = riscv32-unknown-elf-as
CC64 = riscv64-unknown-elf-as
PY = ../riscv2hex

RECIPES:=$(subst /,,$(sort $(dir $(wildcard */))))
RECIPES64:=$(RECIPES:=64)
.PHONY: $(RECIPES)

$(RECIPES):
	@cd $@; \
	$(PY) $(CC32) $@.s

$(RECIPES64):
	@cd $(subst 64,,$@); \
	$(PY) $(CC64) $(subst 64,,$@).s

all: $(RECIPES)

all64: $(RECIPES64)

purge:
	rm -rf */*.hex
	rm -rf */*.dump
	rm -rf */*.out
