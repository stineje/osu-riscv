onerror {resume}
quietly virtual function -install /riscv_mram_tb/spi0 -env /riscv_mram_tb/spi0 { &{/riscv_mram_tb/spi0/count[4], /riscv_mram_tb/spi0/count[3], /riscv_mram_tb/spi0/count[2], /riscv_mram_tb/spi0/count[1], /riscv_mram_tb/spi0/count[0] }} wordindex
quietly virtual function -install /riscv_mram_tb/spi0 -env /riscv_mram_tb/spi0 { &{/riscv_mram_tb/spi0/count[20], /riscv_mram_tb/spi0/count[19], /riscv_mram_tb/spi0/count[18], /riscv_mram_tb/spi0/count[17], /riscv_mram_tb/spi0/count[16], /riscv_mram_tb/spi0/count[15], /riscv_mram_tb/spi0/count[14], /riscv_mram_tb/spi0/count[13], /riscv_mram_tb/spi0/count[12], /riscv_mram_tb/spi0/count[11], /riscv_mram_tb/spi0/count[10], /riscv_mram_tb/spi0/count[9], /riscv_mram_tb/spi0/count[8], /riscv_mram_tb/spi0/count[7], /riscv_mram_tb/spi0/count[6], /riscv_mram_tb/spi0/count[5] }} address
quietly virtual function -install /riscv_mram_tb -env /riscv_mram_tb/dut/memory_controller { &{/riscv_mram_tb/dut/reset, /riscv_mram_tb/dut/memory_controller/mrd, /riscv_mram_tb/dut/memory_controller/gpioen, /riscv_mram_tb/dut/memory_controller/dataadr, /riscv_mram_tb/dut/memory_controller/readdata, /riscv_mram_tb/dut/memory_controller/mrd, /riscv_mram_tb/spi0/ENABLE, /riscv_mram_tb/spi0/MISO, /riscv_mram_tb/spi0/MOSI, /riscv_mram_tb/spi0/PROGRAM_DONE, /riscv_mram_tb/spi0/SCLK, /riscv_mram_tb/spi0/SS, /riscv_mram_tb/spi0/RESET }} stuff
quietly WaveActivateNextPane {} 0
add wave -noupdate /riscv_mram_tb/dut/clk
add wave -noupdate -group {clock gen} /riscv_mram_tb/dut/clk_gen/clk
add wave -noupdate -group {clock gen} /riscv_mram_tb/dut/clk_gen/reset
add wave -noupdate -group {clock gen} /riscv_mram_tb/dut/clk_gen/ph0
add wave -noupdate -group {clock gen} /riscv_mram_tb/dut/clk_gen/ph1
add wave -noupdate -group {clock gen} /riscv_mram_tb/dut/clk_gen/ph2
add wave -noupdate -group {clock gen} /riscv_mram_tb/dut/clk_gen/clk0
add wave -noupdate -expand -group {cpu top} /riscv_mram_tb/dut/riscv/clk
add wave -noupdate -expand -group {cpu top} /riscv_mram_tb/dut/riscv/reset
add wave -noupdate -expand -group {cpu top} -color {Orange Red} /riscv_mram_tb/dut/riscv/pc
add wave -noupdate -expand -group {cpu top} -color Orange /riscv_mram_tb/dut/riscv/instr
add wave -noupdate -expand -group {cpu top} /riscv_mram_tb/dut/riscv/readdata
add wave -noupdate -expand -group {cpu top} /riscv_mram_tb/dut/riscv/pcnext
add wave -noupdate -expand -group {cpu top} /riscv_mram_tb/dut/riscv/memwrite
add wave -noupdate -expand -group {cpu top} /riscv_mram_tb/dut/riscv/aluout
add wave -noupdate -expand -group {cpu top} /riscv_mram_tb/dut/riscv/writedata
add wave -noupdate -expand -group {cpu top} /riscv_mram_tb/dut/riscv/suspend
add wave -noupdate -expand -group datapath /riscv_mram_tb/dut/riscv/dp/signimm2
add wave -noupdate -expand -group datapath /riscv_mram_tb/dut/riscv/dp/srcb
add wave -noupdate -expand -group datapath -group alu /riscv_mram_tb/dut/riscv/dp/alu/a
add wave -noupdate -expand -group datapath -group alu /riscv_mram_tb/dut/riscv/dp/alu/b
add wave -noupdate -expand -group datapath -group alu /riscv_mram_tb/dut/riscv/dp/alu/result
add wave -noupdate -expand -group datapath -expand -group shifter /riscv_mram_tb/dut/riscv/dp/shift/a
add wave -noupdate -expand -group datapath -expand -group shifter /riscv_mram_tb/dut/riscv/dp/shift/shamt
add wave -noupdate -expand -group datapath -expand -group shifter /riscv_mram_tb/dut/riscv/dp/shift/shtype
add wave -noupdate -expand -group datapath -expand -group shifter /riscv_mram_tb/dut/riscv/dp/shift/y
add wave -noupdate -expand -group datapath -expand -group {reg file} /riscv_mram_tb/dut/riscv/dp/rf/clk
add wave -noupdate -expand -group datapath -expand -group {reg file} -radix unsigned /riscv_mram_tb/dut/riscv/dp/rf/ra1
add wave -noupdate -expand -group datapath -expand -group {reg file} -radix unsigned /riscv_mram_tb/dut/riscv/dp/rf/ra2
add wave -noupdate -expand -group datapath -expand -group {reg file} /riscv_mram_tb/dut/riscv/dp/rf/rd1
add wave -noupdate -expand -group datapath -expand -group {reg file} /riscv_mram_tb/dut/riscv/dp/rf/rd2
add wave -noupdate -expand -group datapath -expand -group {reg file} /riscv_mram_tb/dut/riscv/dp/rf/rf
add wave -noupdate -expand -group datapath -expand -group {reg file} /riscv_mram_tb/dut/riscv/dp/rf/we3
add wave -noupdate -expand -group datapath -expand -group {reg file} -radix unsigned /riscv_mram_tb/dut/riscv/dp/rf/wa3
add wave -noupdate -expand -group datapath -expand -group {reg file} /riscv_mram_tb/dut/riscv/dp/rf/wd3
add wave -noupdate -group control /riscv_mram_tb/dut/riscv/c/memtoreg
add wave -noupdate -group control /riscv_mram_tb/dut/riscv/c/memwrite
add wave -noupdate -group control /riscv_mram_tb/dut/riscv/c/pcsrc
add wave -noupdate -group control /riscv_mram_tb/dut/riscv/c/alusrc
add wave -noupdate -group control /riscv_mram_tb/dut/riscv/c/regwrite
add wave -noupdate -group control /riscv_mram_tb/dut/riscv/c/branch
add wave -noupdate -group control /riscv_mram_tb/dut/riscv/c/imm
add wave -noupdate -group control /riscv_mram_tb/dut/riscv/c/alucontrol
add wave -noupdate -group control /riscv_mram_tb/dut/riscv/c/shtype
add wave -noupdate -group control /riscv_mram_tb/dut/riscv/c/alu2src
add wave -noupdate -group {memory i/o} /riscv_mram_tb/dut/maddr
add wave -noupdate -group {memory i/o} /riscv_mram_tb/dut/rebar
add wave -noupdate -group {memory i/o} /riscv_mram_tb/dut/webar
add wave -noupdate -group {memory i/o} /riscv_mram_tb/dut/mdata
add wave -noupdate -group NVMIF /riscv_mram_tb/dut/memory_controller/ph0
add wave -noupdate -group NVMIF /riscv_mram_tb/dut/memory_controller/ph1
add wave -noupdate -group NVMIF /riscv_mram_tb/dut/memory_controller/ph2
add wave -noupdate -group NVMIF /riscv_mram_tb/dut/memory_controller/pcnext
add wave -noupdate -group NVMIF /riscv_mram_tb/dut/memory_controller/dataadr
add wave -noupdate -group NVMIF /riscv_mram_tb/dut/memory_controller/memwrite
add wave -noupdate -group NVMIF /riscv_mram_tb/dut/memory_controller/writedata
add wave -noupdate -group NVMIF /riscv_mram_tb/dut/memory_controller/mrd
add wave -noupdate -group NVMIF /riscv_mram_tb/dut/memory_controller/mwd_d
add wave -noupdate -group NVMIF /riscv_mram_tb/dut/memory_controller/mwd
add wave -noupdate -group NVMIF /riscv_mram_tb/dut/memory_controller/maddr_d
add wave -noupdate -group NVMIF /riscv_mram_tb/dut/memory_controller/maddr
add wave -noupdate -group NVMIF /riscv_mram_tb/dut/memory_controller/we_d
add wave -noupdate -group NVMIF /riscv_mram_tb/dut/memory_controller/re_d
add wave -noupdate -group MRAM0 /riscv_mram_tb/MRAM0/gbar
add wave -noupdate -group MRAM0 /riscv_mram_tb/MRAM0/a
add wave -noupdate -group MRAM0 /riscv_mram_tb/MRAM0/wbar
add wave -noupdate -group MRAM0 /riscv_mram_tb/MRAM0/dq
add wave -noupdate -group MRAM0 /riscv_mram_tb/MRAM0/memory_bank
add wave -noupdate -group MRAM1 /riscv_mram_tb/MRAM1/gbar
add wave -noupdate -group MRAM1 /riscv_mram_tb/MRAM1/a
add wave -noupdate -group MRAM1 /riscv_mram_tb/MRAM1/wbar
add wave -noupdate -group MRAM1 /riscv_mram_tb/MRAM1/dq
add wave -noupdate -group MRAM1 /riscv_mram_tb/MRAM1/memory_bank
add wave -noupdate -expand -group I/O /riscv_mram_tb/dut/gclk
add wave -noupdate -expand -group I/O /riscv_mram_tb/dut/gpo
add wave -noupdate -expand -group I/O /riscv_mram_tb/dut/gpi
add wave -noupdate -group {SPI controller} /riscv_mram_tb/dut/spi_controller/pwe_pulse_q
add wave -noupdate -group {SPI controller} /riscv_mram_tb/dut/spi_controller/paddr
add wave -noupdate -group {SPI controller} /riscv_mram_tb/dut/spi_controller/pdata
add wave -noupdate -group {SPI controller} /riscv_mram_tb/dut/spi_controller/clk
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {40942081150 ps} 0} {{Cursor 2} {2284300 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 250
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {53915778 ns}
