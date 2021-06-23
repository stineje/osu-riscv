SPI Flash unit written by the authors of picorv32
    https://github.com/cliffordwolf/picorv32

WORKING

*spiflash.v
	-Base spi unit with memory mapping

*spiflash_tb.v
	-Basic testbench for the SPI unit written for Icarus Verilog

*spimemio.v
	-Control flow for the SPI unit


WIP

*firmware.hex
	-Memory mapping file used to test memory loading in the spi unit

*firmware2.hex
	-Properly formatted memory file created by hexBreaker.py

*hexBreaker.py
	-Python script to properly format hex file
	