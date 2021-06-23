ALL_DIRS = 	control \
		datapath \
		cpu_top

ROOT_DIR =$(shell pwd)

all:
	for i in $(ALL_DIRS); do \
          echo "Making $$i"; \
          (cd $$i && make clean && make ROOT_DIR=$(ROOT_DIR)); \
        done

clean:	
	for i in $(ALL_DIRS); do \
	echo "Cleaning $$i"; \
	(cd $$i && make clean); \
	done
