# view list
# view wave
# view schematic

add wave -noupdate -group {top level} /riscv_tb/dut/areset
add wave -noupdate -group {top level} /riscv_tb/dut/reset
add wave -noupdate -group {top level} /riscv_tb/dut/suspend
add wave -noupdate -expand -group {Instructions} /riscv_tb/dut/riscv/reset
add wave -noupdate -expand -group {Instructions} -color {Orange Red} /riscv_tb/dut/riscv/pc
add wave -noupdate -expand -group {Instructions} -color Orange /riscv_tb/dut/riscv/instr
add wave -noupdate -expand -group {Instructions} -color Orange -radix Instructions /riscv_tb/dut/riscv/instr

-- display input and output signals as hexidecimal values
# Diplays All Signals recursively
# add wave -hex -r /dut/*
add wave -noupdate -divider -height 32 "Datapath"
add wave -color gold /riscv_tb/dut/clk
add wave -hex /riscv_tb/dut/riscv/dp/*
add wave -noupdate -divider -height 32 "Shifter"
add wave -hex /riscv_tb/dut/riscv/dp/shift/*
add wave -noupdate -divider -height 32 "Comparator"
add wave -hex /riscv_tb/dut/riscv/dp/compare/*
add wave -noupdate -divider -height 32 "Control"
add wave -color gold /riscv_tb/dut/clk
add wave -hex /riscv_tb/dut/riscv/c/*
add wave -noupdate -divider -height 32 "ALU Decoder"
add wave -hex /riscv_tb/dut/riscv/c/ad/*
add wave -noupdate -divider -height 32 "ALU"
add wave -hex /riscv_tb/dut/riscv/dp/alu/*
add wave -noupdate -divider -height 32 "Data Memory"
add wave -color gold /riscv_tb/dut/clk
add wave -hex /riscv_tb/dut/dmem/*
add wave -noupdate -divider -height 32 "Instruction Memory"
add wave -color gold /riscv_tb/dut/clk
add wave -hex /riscv_tb/dut/imem/*
add wave -noupdate -divider -height 32 "Register File"
add wave -color gold /riscv_tb/dut/clk
add wave -hex /riscv_tb/dut/riscv/dp/rf/*
add wave -hex /riscv_tb/dut/riscv/dp/rf/rf

# Schematic
# add schematic -full /riscv_tb/dut/riscv

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
