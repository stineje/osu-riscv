# osu-riscv
OSU Datapath/Control RV32 Single-Cycle and Pipelined Architecture in SV

To populate the OpenROAD submodule:
    git submodule update --init

To build OpenROAD:
    Follow the instructions at https://github.com/The-OpenROAD-Project/OpenROAD-flow-scripts#building-from-source

To run the OpenROAD flow:
	Must have first built the OpenROAD enviornment - see above.
	After building the enviornment, either the single cycle or pipeline can be ran with:
		`make single` or `make pipeline`
	(TODO) The results will then be copied to the home directory after the flow finishes.
