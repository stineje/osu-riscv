#! /bin/csh

.DEFAULT: single 
.PHONY: single pipeline build clean fix_build 

RUN_DIR:=$(shell pwd)
SHELL:=csh
HDL_DIR:=./OpenROAD-flow-scripts/flow/designs/src/riscv32i

build:
	cd OpenROAD-flow-scripts && ./build_openroad.sh --local
	cd OpenROAD-flow-scripts && source setup_env.sh

copy: clean_netlist
	cp ./hdl_single/top/*v ${HDL_DIR} 
	cp ./hdl_single/cpu/*/*v ${HDL_DIR}
	cp ./hdl_single/prims/*.sv ${HDL_DIR}

single: clean_build
	@echo "Making single cycle design"
	cd OpenROAD-flow-scripts/flow && make

pipeline: clean_build
	echo "Making Pipeline design"
	cd OpenROAD-flow-scripts/flow && make

clean_build:
	echo "Cleaning old make of OpenROAD"
	cd OpenROAD-flow-scripts/flow && make clean_all

clean_netlist:
	echo "Cleaning old netlist from OpenROAD"
	rm ${HDL_DIR}/*

fix_build:
	rm OpenROAD-flow-scripts/tools/build/*
	cd OpenROAD-flow-scripts && ./build_openroad -o 
	cd OpenROAD-flow-scripts &&  source setup_env.sh
