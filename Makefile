#! /bin/bash
default_target: flow 
.PHONY: defualt_target build flow copy clean_netlist clean_flow remove_build 
RUN_DIR:=$(shell pwd)
OPENROAD_HDL_DIR?=./OpenROAD-flow-scripts/flow/designs/src/riscv32i

DESIGN?=single
DESIGN_FILES := $(wildcard hdl_$(DESIGN)/*)

BUILD_DIR:=./OpenROAD-flow-scripts/tools/build
OPENROAD_RESULTS_DIR:=./OpenROAD-flow-scripts/flow/results/sky130hs/riscv32i

RESULTS_DIR:=./results

flow: build clean_flow copy | $(RESULTS_DIR)
	@echo "Making $(DESIGN) design...."
	cd OpenROAD-flow-scripts/flow && make DESIGN_CONFIG=./designs/sky130hs/riscv32i/config.mk
	@echo "Copying results...."
	cp -r $(OPENROAD_RESULTS_DIR) $(RESULTS_DIR) 


build: 
	@if [ -z $(shell which openroad) ] || [ ! -f $(BUILD_DIR)/OpenROAD/src/openroad ]; then \
		cd OpenROAD-flow-scripts && ./build_openroad.sh --local && bash setup_env.sh; \
	else \
		echo "OpenROAD is built."; \
	fi


copy: $(DESIGN_FILES) clean_netlist
	@echo "DESIGN FILES: $(DESIGN_FILES)"
	cp ./hdl_$(DESIGN)/*.v $(OPENROAD_HDL_DIR)


$(RESULTS_DIR):
	mkdir results


clean_flow:
	@echo "Cleaning old make of OpenROAD"
	cd OpenROAD-flow-scripts/flow && make clean_all
	@if [ -d $(RESULTS_DIR) ]; then \
		rm -rf $(RESULTS_DIR); \
	fi

clean_netlist:
	@echo "Cleaning old netlist from OpenROAD"
	rm -rf $(OPENROAD_HDL_DIR)
	mkdir $(OPENROAD_HDL_DIR)

remove_openroad: 
	rm -rf $(BUILD_DIR)/OpenROAD/*

remove_yosys: 
	rm -rf $(BUILD_DIR)/yosys/*

remove_build: remove_openroad remove_yosys
