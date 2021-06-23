# Copyright 1991-2007 Mentor Graphics Corporation
# 
# Modification by Oklahoma State University
# Use with Testbench 
# James Stine, 2008
# Go Cowboys!!!!!!
#
# All Rights Reserved.
#
# THIS WORK CONTAINS TRADE SECRET AND PROPRIETARY INFORMATION
# WHICH IS THE PROPERTY OF MENTOR GRAPHICS CORPORATION
# OR ITS LICENSORS AND IS SUBJECT TO LICENSE TERMS.

# Use this run.do file to run this example.
# Either bring up ModelSim and type the following at the "ModelSim>" prompt:
#     do run.do
# or, to run from a shell, type the following at the shell prompt:
#     vsim -do run.do -c
# (omit the "-c" to see the GUI while running from the shell)

onbreak {resume}

# create library
if [file exists work] {
    vdel -all
}
vlib work

set MEMORY_FILE ./memfile.dat

# compile source files
vlog imem.v dmem.v arm_single.sv

# start and run simulation
vsim -novopt work.testbench

# initialize memory (start of user memory is 0x3000=12,288)
mem load -startaddress 0 -i ${MEMORY_FILE} -format hex /testbench/dut/imem/RAM

# view list
# view wave

-- display input and output signals as hexidecimal values
# Diplays All Signals recursively
# add wave -hex -r /stimulus/*
add wave -noupdate -divider -height 32 "Datapath"
add wave -hex /testbench/dut/arm/dp/*
add wave -noupdate -divider -height 32 "Control"
add wave -hex /testbench/dut/arm/c/*
add wave -noupdate -divider -height 32 "Data Memory"
add wave -hex /testbench/dut/dmem/*
add wave -noupdate -divider -height 32 "Instruction Memory"
add wave -hex /testbench/dut/imem/*
add wave -noupdate -divider -height 32 "Register File"
add wave -hex /testbench/dut/arm/dp/rf/*
add wave -hex /testbench/dut/arm/dp/rf/rf


-- Set Wave Output Items 
TreeUpdate [SetDefaultTree]
WaveRestoreZoom {0 ps} {200 ns}
configure wave -namecolwidth 250
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2

-- Run the Simulation
run 230 ns

-- Save memory for checking (if needed)
mem save -outfile dmemory.dat -wordsperline 1 /testbench/dut/dmem/RAM
mem save -outfile imemory.dat -wordsperline 1 /testbench/dut/imem/RAM


