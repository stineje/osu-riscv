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

if {$argc < 1} {
    puts "running preload with default test."
    set PRELOAD_EN 1
} else {
    set PRELOAD_EN $1
}

onbreak {resume}

# Default fall-through if manual execution
lassign {OSU fib} test_folder test_name
if {$argc == 2} {
    set test_name $2
} elseif {$argc == 3} {
    set test_name $3
    set test_folder $2
} else {
    echo "Malformed args"
    exit
}

echo $PRELOAD_EN
echo $test_folder
echo $test_name

if {[info exists env(HDL_HOME)]} {
    set HDL_HOME $env(HDL_HOME)
} else {
# Default fall-through if manual execution
    set HDL_HOME ../../
}

switch -glob -- ${test_name} {
    default {set MEMORY_FILE ${HDL_HOME}/../programs/${test_folder}/${test_name}/${test_name}.hex}
}

switch -glob -- ${test_name} {
    default {set RUN_TIME -all}
}

# start and run simulation
vsim -debugdb \
    -voptargs=+acc  \
    -L tbs_lib \
    -L prims_lib \
    -L control_lib \
    -L datapath_lib \
    -L cpu_top_lib \
    -L top_lib \
    -L stdcell_lib \
    -L io_interface_lib \
    -l transcript_mram.txt \
    -gPRELOAD_EN=$PRELOAD_EN \
    -gSPI_FILE=$MEMORY_FILE \
    -gMRAM0_PRELOAD=$MEMORY_FILE.lower \
    -gMRAM1_PRELOAD=$MEMORY_FILE.upper \
    -wlf riscv_mram.wlf \
    tbs_lib.riscv_mram_tb

# initialize memory (start of user memory is 0x0=0)
#mem load -startaddress 0 -i ${MEMORY_FILE}.lower -format hex /riscv_mram_tb/MRAM0/memory_bank
#mem load -startaddress 0 -i ${MEMORY_FILE}.upper -format hex /riscv_mram_tb/MRAM1/memory_bank

do wave_mram.do 
add log /* -recursive

-- Run the Simulation
run ${RUN_TIME}


#-- Save memory for checking (if needed)
#mem save -outfile dmemory.dat -wordsperline 1 /riscv_tb/dut/dmem/RAM
#mem save -outfile imemory.dat -wordsperline 1 /riscv_tb/dut/imem/RAM
#mem save -outfile rf.dat -wordsperline 1 /riscv_tb/dut/riscv/dp/rf/rf

add schematic -full sim:/riscv_mram_tb/dut/riscv
