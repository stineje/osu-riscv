# osu-riscv
OSU Datapath/Control RV32 Single-Cycle and Pipelined Architecture in SV

This 32-bit RISC-V (RV32i) has a single-cycle and pipelined architecture.  It implements most of the ISA and includes a mechanism for simulation and verification.  This item is as-is and all are welcome to use and benefit from it.

To populate the OpenROAD submodule:
    `git submodule update --init`

To build OpenROAD:
    Follow the instructions at https://github.com/The-OpenROAD-Project/OpenROAD-flow-scripts#building-from-source

To run the OpenROAD flow:
	Must have first built the OpenROAD enviornment - see above.
	After building the enviornment, to run the flow:
		`make flow DESIGN=single|pipelined`
	The results will then be copied to the home directory after the flow finishes.
	By default the single cycle design will be used if DESIGN is not specified.
