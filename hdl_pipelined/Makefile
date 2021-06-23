ALL_DIRS = 	stdcell \
		prims \
		cpu \
		top \
		io_interface \
		tbs

ROOT_DIR =$(shell pwd)
export HDL_HOME =$(ROOT_DIR)

all:
	for i in $(ALL_DIRS); do \
          echo "Making $$i"; \
          (cd $$i && make clean && make ROOT_DIR=$(ROOT_DIR)); \
        done

_private_do:
	@cd sims/$(TEST_DIR); \
	vsim -do $(TEST_NAME).do $(VSIM_ARGS)

regtest: TEST_DIR=regtests
regtest: _private_do
	@:

unit_test: TEST_DIR=unit_tests
unit_test: _private_do
	@:

clean:	
	for i in $(ALL_DIRS); do \
	echo "Cleaning $$i"; \
	(cd $$i && make clean); \
	done
