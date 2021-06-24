# osu-riscv
OSU Datapath/Control RV32 Single-Cycle and Pipelined Architecture in SV

To build OpenROAD:
	First, run:
		`scl enable devtoolset-7 bash`
	Next, in the same terminal, run:
		`make build`
	This should set up the enviornment to be able to run the flow.

To run the OpenROAD flow:
	Must have first built the OpenROAD enviornment - see above.
	After building the enviornment, either the single cycle or pipeline can be ran with:
		`make single` or `make pipeline`
	(TODO) The results will then be copied to the home directory after the flow finishes.
