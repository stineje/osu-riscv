#! /bin/csh

.DEFAULT: flow 
.PHONY: flow copy build clean_netlist clean_build fix_build 

RUN_DIR:=$(shell pwd)
SHELL:=csh
HDL_DIR:=./OpenROAD-flow-scripts/flow/designs/src/riscv32i
DESIGN?=single

build:
	cd OpenROAD-flow-scripts && ./build_openroad.sh --local
	cd OpenROAD-flow-scripts && source setup_env.sh

copy: clean_netlist
	cp ./hdl_${DESIGN}/top/*.sv ${HDL_DIR} 
	cp ./hdl_${DESIGN}/top/dmem.v ${HDL_DIR} 
	cp ./hdl_${DESIGN}/top/imem.v ${HDL_DIR} 
	cp ./hdl_${DESIGN}/cpu/*/*.sv ${HDL_DIR}
	cp ./hdl_${DESIGN}/prims/*.sv ${HDL_DIR}

flow: clean_build copy
	    @echo "Making ${DESIGN} design"
	    cd OpenROAD-flow-scripts/flow && make DESIGN_CONFIG=./designs/sky130hs/riscv32i/config.mk

clean_build:
	echo "Cleaning old make of OpenROAD"
	cd OpenROAD-flow-scripts/flow && make clean_all

clean_netlist:
	echo "Cleaning old netlist from OpenROAD"
	rm -f ${HDL_DIR}/*

fix_build:
	rm OpenROAD-flow-scripts/tools/build/*
	cd OpenROAD-flow-scripts && ./build_openroad -o 
	cd OpenROAD-flow-scripts &&  source setup_env.sh
