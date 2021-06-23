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

if {[info exists env(TEST_ARGS)]} {
    lassign [split $env(TEST_ARGS)] test_folder test_name
} else {
# Default fall-through if manual execution
    lassign {OSU fib} test_folder test_name
}

if {[info exists env(HDL_HOME)]} {
    set HDL_HOME $env(HDL_HOME)
} else {
# Default fall-through if manual execution
    set HDL_HOME ../../
}

set results ""

foreach x [glob -directory ${HDL_HOME}/../programs/${test_folder} -type d *] {

    set test_name [file tail $x]

    if {[lsearch {lw sw} ${test_name}]!=-1} {
        break
    }

    switch -glob -- ${test_name} {
        default {set MEMORY_FILE ${HDL_HOME}/../programs/${test_folder}/${test_name}/${test_name}.hex}
    }

    switch -glob -- ${test_name} {
        default {set RUN_TIME -all}
    }

    puts $test_name

    # start and generate dataflow and run simulation
    vsim -debugdb -voptargs=+acc  \
            -quiet \
         -L tbs_lib \
         -L prims_lib \
         -L control_lib \
         -L datapath_lib \
         -L cpu_top_lib \
         -L top_lib \
         -wlf riscv_single.wlf \
         tbs_lib.riscv_tb

    # initialize memory (start of user memory is 0x0=0)
    mem load -startaddress 0 -i ${MEMORY_FILE} -format hex /riscv_tb/dut/imem/RAM

    run ${RUN_TIME}

    if {[assertion count -fails -r /]==0} {
        puts "${test_name} passed!"
        append results "${test_name} passed!\n"
    } else {
        puts "${test_name} failed!"
        append results "${test_name} failed!\n"
    }
}

puts $results

exit
