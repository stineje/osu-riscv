#! /bin/bash

.DEFAULT: flow 
.PHONY: flow copy copy_results build clean_netlist clean_build fix_build 

RUN_DIR:=$(shell pwd)
SHELL:=bash
HDL_DIR:=./OpenROAD-flow-scripts/flow/designs/src/riscv32i
DESIGN?=single
RESULTS_DIR:=./OpenROAD-flow-scripts/flow/results/sky130hs/riscv32i

build:
	cd OpenROAD-flow-scripts && ./build_openroad.sh --local
	cd OpenROAD-flow-scripts && source setup_env.sh

copy: clean_netlist
	@for f in ./hdl_${DESIGN}/top/*.sv; do \
		cp "$$f" "$${f%.sv}.v"; \
	done
	@for f in ./hdl_${DESIGN}/cpu/*/*.sv; do \
		cp "$$f" "$${f%.sv}.v"; \
	done
	@for f in ./hdl_${DESIGN}/prims/*.sv; do \
		cp "$$f" "$${f%.sv}.v"; \
	done
	cp ./hdl_${DESIGN}/top/*.v ${HDL_DIR} 
	cp ./hdl_${DESIGN}/top/dmem.v ${HDL_DIR} 
	cp ./hdl_${DESIGN}/top/imem.v ${HDL_DIR} 
	cp ./hdl_${DESIGN}/cpu/*/*.v ${HDL_DIR}
	cp ./hdl_${DESIGN}/prims/*.v ${HDL_DIR}

flow: clean_build copy
	@echo "Making ${DESIGN} design"
	cd OpenROAD-flow-scripts/flow && make DESIGN_CONFIG=./designs/sky130hs/riscv32i/config.mk
	@if [ -d ${RESULTS_DIR} ]; then \
		cp -r ${RESULTS_DIR} ./; \
	fi

clean_build:
	@echo "Cleaning old make of OpenROAD"
	cd OpenROAD-flow-scripts/flow && make clean_all
	@if [ -d riscv32i ]; then \
		rm -rf riscv32i; \
	fi

clean_netlist:
	@echo "Cleaning old netlist from OpenROAD"
	@rm -rf ${HDL_DIR}
	@mkdir ${HDL_DIR}

fix_build:
	rm OpenROAD-flow-scripts/tools/build/*
	cd OpenROAD-flow-scripts && ./build_openroad -o 
	cd OpenROAD-flow-scripts &&  source setup_env.sh

	
