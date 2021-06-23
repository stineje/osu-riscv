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

set FUNCTION_FILE ${HDL_HOME}/../programs/${test_folder}/${test_name}/${test_name}_funct.addr
set FUNCTION_WAVE ${HDL_HOME}/../programs/${test_folder}/${test_name}/${test_name}_funct.do

echo $FUNCTION_FILE

switch -glob -- ${test_name} {
    default {set RUN_TIME -all}
}


# start and generate dataflow and run simulation
vsim -debugdb -voptargs=+acc  \
     -L tbs_lib \
     -L prims_lib \
     -L control_lib \
     -L datapath_lib \
     -L cpu_top_lib \
     -L top_lib \
     -l transcript_riscv_pipelined.txt \
    -wlf riscv_pipelined.wlf \
    -gPRELOAD_FILE=$MEMORY_FILE \
    -gPRELOAD_EN=$PRELOAD_EN \
    -gFUNCTION_FILE=$FUNCTION_FILE \
     tbs_lib.riscv_tb


do instr_aid.do
do wave.do
do $FUNCTION_WAVE

add log /* -recursive

-- Run the Simulation
run ${RUN_TIME}


#add schematic -full sim:/riscv_tb/dut/riscv
