onerror {resume}
radix define Instructions {
    "32'b?????????????????????????0110111" "LUI",
    "32'b?????????????????????????0010111" "AUIPC",
    "32'b????????????????????000001101111" "J",
    "32'b?????????????????????????1101111" "JAL",
    "32'b?????????????????000?????1100111" "JALR",
    "32'b?????????????????000?????1100011" "BEQ",
    "32'b?????????????????001?????1100011" "BNE",
    "32'b?????????????????100?????1100011" "BLT",
    "32'b?????????????????101?????1100011" "BGE",
    "32'b?????????????????110?????1100011" "BLTU",
    "32'b?????????????????111?????1100011" "BGEU",
    "32'b?????????????????000?????0000011" "LB",
    "32'b?????????????????001?????0000011" "LH",
    "32'b?????????????????010?????0000011" "LW",
    "32'b?????????????????100?????0000011" "LBU",
    "32'b?????????????????101?????0000011" "LHU",
    "32'b?????????????????000?????0100011" "SB",
    "32'b?????????????????001?????0100011" "SH",
    "32'b?????????????????010?????0100011" "SW",
    "32'b?????????????????000?????0010011" "ADDI",
    "32'b?????????????????010?????0010011" "SLTI",
    "32'b?????????????????011?????0010011" "SLTIU",
    "32'b?????????????????100?????0010011" "XORI",
    "32'b?????????????????110?????0010011" "ORI",
    "32'b?????????????????111?????0010011" "ANDI",
    "32'b0000000??????????001?????0010011" "SLLI",
    "32'b0000000??????????101?????0010011" "SRLI",
    "32'b0100000??????????101?????0010011" "SRAI",
    "32'b0000000??????????000?????0110011" "ADD",
    "32'b0100000??????????000?????0110011" "SUB",
    "32'b0000000??????????001?????0110011" "SLL",
    "32'b0000000??????????010?????0110011" "SLT",
    "32'b0000000??????????011?????0110011" "SLTU",
    "32'b0000000??????????100?????0110011" "XOR",
    "32'b0000000??????????101?????0110011" "SRL",
    "32'b0100000??????????101?????0110011" "SRA",
    "32'b0000000??????????110?????0110011" "OR",
    "32'b0000000??????????111?????0110011" "AND",
    "32'b0000000??????????000?????0001111" "FENCE",
    "32'b00000000000000000000000001110011" "ECALL",
    "32'b00000000000100000000000001110011" "EBREAK",
    "32'b?????????????????001?????1110011" "CSRRW",
    "32'b?????????????????010?????1110011" "CSRRS",
    "32'b?????????????????011?????1110011" "CSRRC",
    "32'b?????????????????101?????1110011" "CSRRWI",
    "32'b?????????????????110?????1110011" "CSRRSI",
    "32'b?????????????????111?????1110011" "CSRRCI",
    "32'b00000000001000000000000001110011" "URET",
    "32'b00010000001000000000000001110011" "SRET",
    "32'b00110000001000000000000001110011" "MRET",
    "32'b00010000010100000000000001110011" "WFI",
    "32'b0001001??????????000000001110011" "SFENCE.VMA",
    "32'b0010001??????????000000001110011" "HFENCE.BVMA",
    "32'b1010001??????????000000001110011" "HFENCE.GVMA",
    -default hexadecimal
}
radix define Functions {
    "16#00000000#" "_start" -color "SpringGreen",
    "16#00000090#" "_start_end" -color "SpringGreen",
    "16#000005AC#" "__addi" -color "SpringGreen",
    "16#00000840#" "__and" -color "SpringGreen",
    "16#00000D34#" "__andi" -color "SpringGreen",
    "16#00000F00#" "__beq" -color "SpringGreen",
    "16#000011A0#" "__bge" -color "SpringGreen",
    "16#000014A0#" "__bgeu" -color "SpringGreen",
    "16#000017D4#" "__blt" -color "SpringGreen",
    "16#00001A74#" "__bltu" -color "SpringGreen",
    "16#00001D48#" "__bne" -color "SpringGreen",
    "16#00001FEC#" "fail" -color "Goldenrod",
    "16#00002008#" "pass" -color "Goldenrod",
    "16#00002034#" "write_gpo" -color "Goldenrod",
    "16#0000203C#" "fib" -color "MediumSpringGreen",
    "16#00002120#" "zero" -color "MediumSpringGreen",
    "16#00002178#" "fib_helper" -color "MediumSpringGreen",
    "16#0000228C#" "__jal" -color "SpringGreen",
    "16#000022BC#" "__jalr" -color "SpringGreen",
    "16#00002368#" "__lui" -color "SpringGreen",
    "16#000023D4#" "__lw" -color "SpringGreen",
    "16#0000264C#" "main" -color "MediumSpringGreen",
    "16#000026E4#" "check" -color "MediumSpringGreen",
    "16#00002714#" "__or" -color "SpringGreen",
    "16#00002C14#" "__ori" -color "SpringGreen",
    "16#00002DFC#" "__sll" -color "SpringGreen",
    "16#00003388#" "__slli" -color "SpringGreen",
    "16#00003618#" "__slt" -color "SpringGreen",
    "16#00003B1C#" "__slti" -color "SpringGreen",
    "16#00003D9C#" "__sltiu" -color "SpringGreen",
    "16#0000401C#" "__sltu" -color "SpringGreen",
    "16#00004520#" "__sra" -color "SpringGreen",
    "16#00004AF8#" "__srai" -color "SpringGreen",
    "16#00004DBC#" "__srl" -color "SpringGreen",
    "16#0000537C#" "__srli" -color "SpringGreen",
    "16#00005628#" "__sub" -color "SpringGreen",
    "16#00005B24#" "__sw" -color "SpringGreen",
    "16#00005F58#" "__test_csr" -color "Goldenrod",
    "16#00005F7C#" "test_fib" -color "MediumSpringGreen",
    "16#00005FF8#" "highestBit" -color "MediumSpringGreen",
    "16#0000608C#" "test_josephus" -color "MediumSpringGreen",
    "16#00006110#" "test_store" -color "MediumSpringGreen",
    "16#000065A4#" "_halt" -color "green",
    -default hexadecimal
}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group {top level} /riscv_tb/dut/areset
add wave -noupdate -group {top level} /riscv_tb/dut/reset
add wave -noupdate -group {top level} /riscv_tb/dut/suspend
add wave -noupdate -expand -group Instructions /riscv_tb/dut/riscv/reset
add wave -noupdate -expand -group Instructions -color {Orange Red} /riscv_tb/dut/riscv/pcF
add wave -noupdate -expand -group Instructions -color Orange /riscv_tb/dut/riscv/instrF
add wave -noupdate -expand -group Instructions -color Orange -radix Instructions /riscv_tb/dut/riscv/instrF
add wave -noupdate -expand -group Instructions -color Orange /riscv_tb/dut/riscv/dp/instrD
add wave -noupdate -expand -group Instructions -color Orange -radix Instructions /riscv_tb/dut/riscv/dp/instrD
add wave -noupdate /riscv_tb/dut/riscv/dp/pcsrcD
add wave -noupdate -color gold -radix hexadecimal /riscv_tb/dut/clk
add wave -noupdate -expand -group {Where am I?} -radix hexadecimal /riscv_tb/function_radix/index
add wave -noupdate -expand -group {Where am I?} -radix Functions /riscv_tb/function_radix/index
add wave -noupdate -expand -group {Where am I?} -radix hexadecimal /riscv_tb/dut/riscv/dp/pcE
add wave -noupdate -expand -group {Where am I?} /riscv_tb/dut/riscv/dp/instrE
add wave -noupdate -expand -group {Where am I?} -radix Instructions /riscv_tb/dut/riscv/dp/instrE
add wave -noupdate -expand -group {Where am I?} /riscv_tb/dut/riscv/dp/flushE
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/clk
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/reset
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/instrF
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/instrD
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/immD
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/pcF
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/pcaddD
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/pcextD
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/ISRselF
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/ISR
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/unsignD
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/gtD
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/ltD
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/eqD
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/alucontrolE
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/alusrcE
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/storepcW
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/sltunsignedE
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/shtypeE
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/alu2srcE
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/memtoregE
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/memtoregM
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/memtoregW
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/regwriteE
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/regwriteM
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/regwriteW
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/aluoutM
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/writedataM4
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/readdataM
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/suspendW
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/suspendE
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/branchD
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/flushE
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/pcsrcD
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/jrD
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/jumpW
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/regdstE
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/lhM
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/lbM
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/lhuM
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/lbuM
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/memwriteM
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/pcjalrD
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/pcnextF
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/pcnext2F
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/pctoregD
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/pctoregE
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/pctoregM
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/pctoregW
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/srca2D
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/srca3D
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/srcaE
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/srca2E
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/srcbE
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/resultW
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/resultRFin
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/shoutputE
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/compA
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/compB
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/pcISRin
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/pcext_immD
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/pcext_immE
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/SEPC
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/signimmD
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/pcplus4F
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/pcplus4D
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/forwardaD
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/forwardbD
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/forwardaE
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/forwardbE
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/forwardcF
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/stallF
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/stallD
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/rs1D
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/rs1E
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/rs2D
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/rs2E
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/rdD
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/rdE
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/rdM
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/rdW
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/aluoutW
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/aluout2E
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/aluout3E
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/writedataD
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/writedata2D
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/writedataE
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/writedata2E
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/readdataW
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/pcD
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/rs1
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/zero
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/pcimm_sumD
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/readdataM2
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/readdataM3
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/readdataM4
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/writedataM
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/writedataM2
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/writedataM3
add wave -noupdate -group Datapath -radix hexadecimal /riscv_tb/dut/riscv/dp/flushD
add wave -noupdate -group Control -radix hexadecimal /riscv_tb/dut/riscv/c/op
add wave -noupdate -group Control -radix hexadecimal /riscv_tb/dut/riscv/c/funct7
add wave -noupdate -group Control -radix hexadecimal /riscv_tb/dut/riscv/c/funct3D
add wave -noupdate -group Control -radix hexadecimal /riscv_tb/dut/riscv/c/memtoregE
add wave -noupdate -group Control -radix hexadecimal /riscv_tb/dut/riscv/c/memtoregM
add wave -noupdate -group Control -radix hexadecimal /riscv_tb/dut/riscv/c/memtoregW
add wave -noupdate -group Control -radix hexadecimal /riscv_tb/dut/riscv/c/memwriteM
add wave -noupdate -group Control -radix hexadecimal /riscv_tb/dut/riscv/c/alusrcE
add wave -noupdate -group Control -radix hexadecimal /riscv_tb/dut/riscv/c/regwriteE
add wave -noupdate -group Control -radix hexadecimal /riscv_tb/dut/riscv/c/regwriteM
add wave -noupdate -group Control -radix hexadecimal /riscv_tb/dut/riscv/c/regwriteW
add wave -noupdate -group Control -radix hexadecimal /riscv_tb/dut/riscv/c/branchD
add wave -noupdate -group Control -radix hexadecimal /riscv_tb/dut/riscv/c/storepcW
add wave -noupdate -group Control -radix hexadecimal /riscv_tb/dut/riscv/c/pcaddD
add wave -noupdate -group Control -radix hexadecimal /riscv_tb/dut/riscv/c/pcextD
add wave -noupdate -group Control -radix hexadecimal /riscv_tb/dut/riscv/c/unsignD
add wave -noupdate -group Control -radix hexadecimal /riscv_tb/dut/riscv/c/immD
add wave -noupdate -group Control -radix hexadecimal /riscv_tb/dut/riscv/c/alucontrolE
add wave -noupdate -group Control -radix hexadecimal /riscv_tb/dut/riscv/c/shtypeE
add wave -noupdate -group Control -radix hexadecimal /riscv_tb/dut/riscv/c/alu2srcE
add wave -noupdate -group Control -radix hexadecimal /riscv_tb/dut/riscv/c/gtD
add wave -noupdate -group Control -radix hexadecimal /riscv_tb/dut/riscv/c/ltD
add wave -noupdate -group Control -radix hexadecimal /riscv_tb/dut/riscv/c/eqD
add wave -noupdate -group Control -radix hexadecimal /riscv_tb/dut/riscv/c/suspendW
add wave -noupdate -group Control -radix hexadecimal /riscv_tb/dut/riscv/c/suspendE
add wave -noupdate -group Control -radix hexadecimal /riscv_tb/dut/riscv/c/sltunsignedE
add wave -noupdate -group Control -radix hexadecimal /riscv_tb/dut/riscv/c/memreadM
add wave -noupdate -group Control -radix hexadecimal /riscv_tb/dut/riscv/c/reset
add wave -noupdate -group Control -radix hexadecimal /riscv_tb/dut/riscv/c/clk
add wave -noupdate -group Control -radix hexadecimal /riscv_tb/dut/riscv/c/flushE
add wave -noupdate -group Control -radix hexadecimal /riscv_tb/dut/riscv/c/pcsrcD
add wave -noupdate -group Control -radix hexadecimal /riscv_tb/dut/riscv/c/jumpW
add wave -noupdate -group Control -radix hexadecimal /riscv_tb/dut/riscv/c/jrD
add wave -noupdate -group Control -radix hexadecimal /riscv_tb/dut/riscv/c/regdstE
add wave -noupdate -group Control -radix hexadecimal /riscv_tb/dut/riscv/c/lhM
add wave -noupdate -group Control -radix hexadecimal /riscv_tb/dut/riscv/c/lbM
add wave -noupdate -group Control -radix hexadecimal /riscv_tb/dut/riscv/c/lhuM
add wave -noupdate -group Control -radix hexadecimal /riscv_tb/dut/riscv/c/lbuM
add wave -noupdate -group Control -radix hexadecimal /riscv_tb/dut/riscv/c/memtoregD
add wave -noupdate -group Control -radix hexadecimal /riscv_tb/dut/riscv/c/aluopD
add wave -noupdate -group Control -radix hexadecimal /riscv_tb/dut/riscv/c/alu2src_fakeD
add wave -noupdate -group Control -radix hexadecimal /riscv_tb/dut/riscv/c/alucontrol_fakeD
add wave -noupdate -group Control -radix hexadecimal /riscv_tb/dut/riscv/c/regwriteD
add wave -noupdate -group Control -radix hexadecimal /riscv_tb/dut/riscv/c/memwriteD
add wave -noupdate -group Control -radix hexadecimal /riscv_tb/dut/riscv/c/sltunsignedD
add wave -noupdate -group Control -radix hexadecimal /riscv_tb/dut/riscv/c/alucontrolD
add wave -noupdate -group Control -radix hexadecimal /riscv_tb/dut/riscv/c/alu2srcD
add wave -noupdate -group Control -radix hexadecimal /riscv_tb/dut/riscv/c/suspendD
add wave -noupdate -group Control -radix hexadecimal /riscv_tb/dut/riscv/c/suspendM
add wave -noupdate -group Control -radix hexadecimal /riscv_tb/dut/riscv/c/auipc_cntrlD
add wave -noupdate -group Control -radix hexadecimal /riscv_tb/dut/riscv/c/storepc_localD
add wave -noupdate -group Control -radix hexadecimal /riscv_tb/dut/riscv/c/regdstD
add wave -noupdate -group Control -radix hexadecimal /riscv_tb/dut/riscv/c/storepcD
add wave -noupdate -group Control -radix hexadecimal /riscv_tb/dut/riscv/c/storepcE
add wave -noupdate -group Control -radix hexadecimal /riscv_tb/dut/riscv/c/storepcM
add wave -noupdate -group Control -radix hexadecimal /riscv_tb/dut/riscv/c/shtypeD
add wave -noupdate -group Control -radix hexadecimal /riscv_tb/dut/riscv/c/jumpD
add wave -noupdate -group Control -radix hexadecimal /riscv_tb/dut/riscv/c/jumpE
add wave -noupdate -group Control -radix hexadecimal /riscv_tb/dut/riscv/c/jumpM
add wave -noupdate -group Control -radix hexadecimal /riscv_tb/dut/riscv/c/lhD
add wave -noupdate -group Control -radix hexadecimal /riscv_tb/dut/riscv/c/lhE
add wave -noupdate -group Control -radix hexadecimal /riscv_tb/dut/riscv/c/lbD
add wave -noupdate -group Control -radix hexadecimal /riscv_tb/dut/riscv/c/lbE
add wave -noupdate -group Control -radix hexadecimal /riscv_tb/dut/riscv/c/lhuD
add wave -noupdate -group Control -radix hexadecimal /riscv_tb/dut/riscv/c/lhuE
add wave -noupdate -group Control -radix hexadecimal /riscv_tb/dut/riscv/c/lbuD
add wave -noupdate -group Control -radix hexadecimal /riscv_tb/dut/riscv/c/lbuE
add wave -noupdate -group Control -radix hexadecimal /riscv_tb/dut/riscv/c/alusrcD
add wave -noupdate -group Control -radix hexadecimal /riscv_tb/dut/riscv/c/memwriteE
add wave -noupdate -group HDU -radix hexadecimal /riscv_tb/dut/riscv/dp/h/rs1D
add wave -noupdate -group HDU -radix hexadecimal /riscv_tb/dut/riscv/dp/h/rs2D
add wave -noupdate -group HDU -radix hexadecimal /riscv_tb/dut/riscv/dp/h/rs1E
add wave -noupdate -group HDU -radix hexadecimal /riscv_tb/dut/riscv/dp/h/rs2E
add wave -noupdate -group HDU -radix hexadecimal /riscv_tb/dut/riscv/dp/h/rdD
add wave -noupdate -group HDU -radix hexadecimal /riscv_tb/dut/riscv/dp/h/rdE
add wave -noupdate -group HDU -radix hexadecimal /riscv_tb/dut/riscv/dp/h/rdM
add wave -noupdate -group HDU -radix hexadecimal /riscv_tb/dut/riscv/dp/h/rdW
add wave -noupdate -group HDU -radix hexadecimal /riscv_tb/dut/riscv/dp/h/regwriteE
add wave -noupdate -group HDU -radix hexadecimal /riscv_tb/dut/riscv/dp/h/regwriteM
add wave -noupdate -group HDU -radix hexadecimal /riscv_tb/dut/riscv/dp/h/regwriteW
add wave -noupdate -group HDU -radix hexadecimal /riscv_tb/dut/riscv/dp/h/memtoregE
add wave -noupdate -group HDU -radix hexadecimal /riscv_tb/dut/riscv/dp/h/memtoregM
add wave -noupdate -group HDU -radix hexadecimal /riscv_tb/dut/riscv/dp/h/branchD
add wave -noupdate -group HDU -radix hexadecimal /riscv_tb/dut/riscv/dp/h/forwardaD
add wave -noupdate -group HDU -radix hexadecimal /riscv_tb/dut/riscv/dp/h/forwardbD
add wave -noupdate -group HDU -radix hexadecimal /riscv_tb/dut/riscv/dp/h/forwardaE
add wave -noupdate -group HDU -radix hexadecimal /riscv_tb/dut/riscv/dp/h/forwardbE
add wave -noupdate -group HDU -radix hexadecimal /riscv_tb/dut/riscv/dp/h/stallF
add wave -noupdate -group HDU -radix hexadecimal /riscv_tb/dut/riscv/dp/h/stallD
add wave -noupdate -group HDU -radix hexadecimal /riscv_tb/dut/riscv/dp/h/flushE
add wave -noupdate -group HDU -radix hexadecimal /riscv_tb/dut/riscv/dp/h/pcsrcD
add wave -noupdate -group HDU -radix hexadecimal /riscv_tb/dut/riscv/dp/h/jumpW
add wave -noupdate -group HDU -radix hexadecimal /riscv_tb/dut/riscv/dp/h/jrD
add wave -noupdate -group HDU -radix hexadecimal /riscv_tb/dut/riscv/dp/h/forwardcF
add wave -noupdate -group HDU -radix hexadecimal /riscv_tb/dut/riscv/dp/h/lwstallD
add wave -noupdate -group HDU -radix hexadecimal /riscv_tb/dut/riscv/dp/h/branchstallD
add wave -noupdate -group Shifter -radix hexadecimal /riscv_tb/dut/riscv/dp/shift/a
add wave -noupdate -group Shifter -radix hexadecimal /riscv_tb/dut/riscv/dp/shift/shamt
add wave -noupdate -group Shifter -radix hexadecimal /riscv_tb/dut/riscv/dp/shift/shtype
add wave -noupdate -group Shifter -radix hexadecimal /riscv_tb/dut/riscv/dp/shift/y
add wave -noupdate -group Comparator -radix hexadecimal /riscv_tb/dut/riscv/dp/compare/A
add wave -noupdate -group Comparator -radix hexadecimal /riscv_tb/dut/riscv/dp/compare/B
add wave -noupdate -group Comparator -radix hexadecimal /riscv_tb/dut/riscv/dp/compare/LT
add wave -noupdate -group Comparator -radix hexadecimal /riscv_tb/dut/riscv/dp/compare/EQ
add wave -noupdate -group Comparator -radix hexadecimal /riscv_tb/dut/riscv/dp/compare/GT
add wave -noupdate -group Comparator -radix hexadecimal /riscv_tb/dut/riscv/dp/compare/s
add wave -noupdate -group Comparator -radix hexadecimal /riscv_tb/dut/riscv/dp/compare/t
add wave -noupdate -group Comparator -radix hexadecimal /riscv_tb/dut/riscv/dp/compare/u
add wave -noupdate -group Comparator -radix hexadecimal /riscv_tb/dut/riscv/dp/compare/v
add wave -noupdate -group Comparator -radix hexadecimal /riscv_tb/dut/riscv/dp/compare/w
add wave -noupdate -group Comparator -radix hexadecimal /riscv_tb/dut/riscv/dp/compare/x
add wave -noupdate -group Comparator -radix hexadecimal /riscv_tb/dut/riscv/dp/compare/y
add wave -noupdate -group Comparator -radix hexadecimal /riscv_tb/dut/riscv/dp/compare/z
add wave -noupdate -group {ALU Decoder} -radix hexadecimal /riscv_tb/dut/riscv/c/ad/funct7b
add wave -noupdate -group {ALU Decoder} -radix hexadecimal /riscv_tb/dut/riscv/c/ad/funct3
add wave -noupdate -group {ALU Decoder} -radix hexadecimal /riscv_tb/dut/riscv/c/ad/aluop
add wave -noupdate -group {ALU Decoder} -radix hexadecimal /riscv_tb/dut/riscv/c/ad/alucontrol
add wave -noupdate -group {ALU Decoder} -radix hexadecimal /riscv_tb/dut/riscv/c/ad/shtype
add wave -noupdate -group {ALU Decoder} -radix hexadecimal /riscv_tb/dut/riscv/c/ad/alu2src
add wave -noupdate -group {ALU Decoder} -radix hexadecimal /riscv_tb/dut/riscv/c/ad/sltunsigned
add wave -noupdate -group {ALU Decoder} -radix hexadecimal /riscv_tb/dut/riscv/c/ad/lh
add wave -noupdate -group {ALU Decoder} -radix hexadecimal /riscv_tb/dut/riscv/c/ad/lb
add wave -noupdate -group {ALU Decoder} -radix hexadecimal /riscv_tb/dut/riscv/c/ad/lhu
add wave -noupdate -group {ALU Decoder} -radix hexadecimal /riscv_tb/dut/riscv/c/ad/lbu
add wave -noupdate -group ALU -radix hexadecimal /riscv_tb/dut/riscv/dp/alu/a
add wave -noupdate -group ALU -radix hexadecimal /riscv_tb/dut/riscv/dp/alu/b
add wave -noupdate -group ALU -radix hexadecimal /riscv_tb/dut/riscv/dp/alu/alucont
add wave -noupdate -group ALU -radix hexadecimal /riscv_tb/dut/riscv/dp/alu/sltunsigned
add wave -noupdate -group ALU -radix hexadecimal /riscv_tb/dut/riscv/dp/alu/result
add wave -noupdate -group ALU -radix hexadecimal /riscv_tb/dut/riscv/dp/alu/zero
add wave -noupdate -group ALU -radix hexadecimal /riscv_tb/dut/riscv/dp/alu/a2
add wave -noupdate -group ALU -radix hexadecimal /riscv_tb/dut/riscv/dp/alu/b2
add wave -noupdate -group ALU -radix hexadecimal /riscv_tb/dut/riscv/dp/alu/sum
add wave -noupdate -group ALU -radix hexadecimal /riscv_tb/dut/riscv/dp/alu/slt
add wave -noupdate -group ALU -radix hexadecimal /riscv_tb/dut/riscv/dp/alu/exor
add wave -noupdate -group ALU -radix hexadecimal /riscv_tb/dut/riscv/dp/alu/overflow
add wave -noupdate -group {Register File} -radix hexadecimal /riscv_tb/dut/riscv/dp/rf/clk
add wave -noupdate -group {Register File} -radix hexadecimal /riscv_tb/dut/riscv/dp/rf/we3
add wave -noupdate -group {Register File} -radix hexadecimal /riscv_tb/dut/riscv/dp/rf/ra1
add wave -noupdate -group {Register File} -radix hexadecimal /riscv_tb/dut/riscv/dp/rf/ra2
add wave -noupdate -group {Register File} -radix hexadecimal /riscv_tb/dut/riscv/dp/rf/wa3
add wave -noupdate -group {Register File} -radix hexadecimal /riscv_tb/dut/riscv/dp/rf/wd3
add wave -noupdate -group {Register File} -radix hexadecimal /riscv_tb/dut/riscv/dp/rf/rd1
add wave -noupdate -group {Register File} -radix hexadecimal /riscv_tb/dut/riscv/dp/rf/rd2
add wave -noupdate -group {Register File} -radix hexadecimal -childformat {{{/riscv_tb/dut/riscv/dp/rf/rf[31]} -radix hexadecimal} {{/riscv_tb/dut/riscv/dp/rf/rf[30]} -radix hexadecimal} {{/riscv_tb/dut/riscv/dp/rf/rf[29]} -radix hexadecimal} {{/riscv_tb/dut/riscv/dp/rf/rf[28]} -radix hexadecimal} {{/riscv_tb/dut/riscv/dp/rf/rf[27]} -radix hexadecimal} {{/riscv_tb/dut/riscv/dp/rf/rf[26]} -radix hexadecimal} {{/riscv_tb/dut/riscv/dp/rf/rf[25]} -radix hexadecimal} {{/riscv_tb/dut/riscv/dp/rf/rf[24]} -radix hexadecimal} {{/riscv_tb/dut/riscv/dp/rf/rf[23]} -radix hexadecimal} {{/riscv_tb/dut/riscv/dp/rf/rf[22]} -radix hexadecimal} {{/riscv_tb/dut/riscv/dp/rf/rf[21]} -radix hexadecimal} {{/riscv_tb/dut/riscv/dp/rf/rf[20]} -radix hexadecimal} {{/riscv_tb/dut/riscv/dp/rf/rf[19]} -radix hexadecimal} {{/riscv_tb/dut/riscv/dp/rf/rf[18]} -radix hexadecimal} {{/riscv_tb/dut/riscv/dp/rf/rf[17]} -radix hexadecimal} {{/riscv_tb/dut/riscv/dp/rf/rf[16]} -radix hexadecimal} {{/riscv_tb/dut/riscv/dp/rf/rf[15]} -radix hexadecimal} {{/riscv_tb/dut/riscv/dp/rf/rf[14]} -radix hexadecimal} {{/riscv_tb/dut/riscv/dp/rf/rf[13]} -radix hexadecimal} {{/riscv_tb/dut/riscv/dp/rf/rf[12]} -radix hexadecimal} {{/riscv_tb/dut/riscv/dp/rf/rf[11]} -radix hexadecimal} {{/riscv_tb/dut/riscv/dp/rf/rf[10]} -radix hexadecimal} {{/riscv_tb/dut/riscv/dp/rf/rf[9]} -radix hexadecimal} {{/riscv_tb/dut/riscv/dp/rf/rf[8]} -radix hexadecimal} {{/riscv_tb/dut/riscv/dp/rf/rf[7]} -radix hexadecimal} {{/riscv_tb/dut/riscv/dp/rf/rf[6]} -radix hexadecimal} {{/riscv_tb/dut/riscv/dp/rf/rf[5]} -radix hexadecimal} {{/riscv_tb/dut/riscv/dp/rf/rf[4]} -radix hexadecimal} {{/riscv_tb/dut/riscv/dp/rf/rf[3]} -radix hexadecimal} {{/riscv_tb/dut/riscv/dp/rf/rf[2]} -radix hexadecimal} {{/riscv_tb/dut/riscv/dp/rf/rf[1]} -radix hexadecimal} {{/riscv_tb/dut/riscv/dp/rf/rf[0]} -radix hexadecimal}} -subitemconfig {{/riscv_tb/dut/riscv/dp/rf/rf[31]} {-height 16 -radix hexadecimal} {/riscv_tb/dut/riscv/dp/rf/rf[30]} {-height 16 -radix hexadecimal} {/riscv_tb/dut/riscv/dp/rf/rf[29]} {-height 16 -radix hexadecimal} {/riscv_tb/dut/riscv/dp/rf/rf[28]} {-height 16 -radix hexadecimal} {/riscv_tb/dut/riscv/dp/rf/rf[27]} {-height 16 -radix hexadecimal} {/riscv_tb/dut/riscv/dp/rf/rf[26]} {-height 16 -radix hexadecimal} {/riscv_tb/dut/riscv/dp/rf/rf[25]} {-height 16 -radix hexadecimal} {/riscv_tb/dut/riscv/dp/rf/rf[24]} {-height 16 -radix hexadecimal} {/riscv_tb/dut/riscv/dp/rf/rf[23]} {-height 16 -radix hexadecimal} {/riscv_tb/dut/riscv/dp/rf/rf[22]} {-height 16 -radix hexadecimal} {/riscv_tb/dut/riscv/dp/rf/rf[21]} {-height 16 -radix hexadecimal} {/riscv_tb/dut/riscv/dp/rf/rf[20]} {-height 16 -radix hexadecimal} {/riscv_tb/dut/riscv/dp/rf/rf[19]} {-height 16 -radix hexadecimal} {/riscv_tb/dut/riscv/dp/rf/rf[18]} {-height 16 -radix hexadecimal} {/riscv_tb/dut/riscv/dp/rf/rf[17]} {-height 16 -radix hexadecimal} {/riscv_tb/dut/riscv/dp/rf/rf[16]} {-height 16 -radix hexadecimal} {/riscv_tb/dut/riscv/dp/rf/rf[15]} {-height 16 -radix hexadecimal} {/riscv_tb/dut/riscv/dp/rf/rf[14]} {-height 16 -radix hexadecimal} {/riscv_tb/dut/riscv/dp/rf/rf[13]} {-height 16 -radix hexadecimal} {/riscv_tb/dut/riscv/dp/rf/rf[12]} {-height 16 -radix hexadecimal} {/riscv_tb/dut/riscv/dp/rf/rf[11]} {-height 16 -radix hexadecimal} {/riscv_tb/dut/riscv/dp/rf/rf[10]} {-height 16 -radix hexadecimal} {/riscv_tb/dut/riscv/dp/rf/rf[9]} {-height 16 -radix hexadecimal} {/riscv_tb/dut/riscv/dp/rf/rf[8]} {-height 16 -radix hexadecimal} {/riscv_tb/dut/riscv/dp/rf/rf[7]} {-height 16 -radix hexadecimal} {/riscv_tb/dut/riscv/dp/rf/rf[6]} {-height 16 -radix hexadecimal} {/riscv_tb/dut/riscv/dp/rf/rf[5]} {-height 16 -radix hexadecimal} {/riscv_tb/dut/riscv/dp/rf/rf[4]} {-height 16 -radix hexadecimal} {/riscv_tb/dut/riscv/dp/rf/rf[3]} {-height 16 -radix hexadecimal} {/riscv_tb/dut/riscv/dp/rf/rf[2]} {-height 16 -radix hexadecimal} {/riscv_tb/dut/riscv/dp/rf/rf[1]} {-height 16 -radix hexadecimal} {/riscv_tb/dut/riscv/dp/rf/rf[0]} {-height 16 -radix hexadecimal}} /riscv_tb/dut/riscv/dp/rf/rf
add wave -noupdate -expand -group main_memory /riscv_tb/dut/main_mem/r_w_0
add wave -noupdate -expand -group main_memory /riscv_tb/dut/main_mem/clk
add wave -noupdate -expand -group main_memory -radix hexadecimal /riscv_tb/dut/main_mem/mem_addr0
add wave -noupdate -expand -group main_memory /riscv_tb/dut/main_mem/mem_addr1
add wave -noupdate -expand -group main_memory /riscv_tb/dut/main_mem/mem_in0
add wave -noupdate -expand -group main_memory /riscv_tb/dut/main_mem/PRELOAD_FILE
add wave -noupdate -expand -group main_memory /riscv_tb/dut/main_mem/PRELOAD_EN
add wave -noupdate -expand -group main_memory /riscv_tb/dut/main_mem/AddrSize
add wave -noupdate -expand -group main_memory /riscv_tb/dut/main_mem/WordSize
add wave -noupdate -expand -group main_memory /riscv_tb/dut/main_mem/RAM
add wave -noupdate -expand -group main_memory /riscv_tb/dut/main_mem/mem_out0
add wave -noupdate -expand -group main_memory /riscv_tb/dut/main_mem/mem_out1
add wave -noupdate -expand -group {memory details} /riscv_tb/dut/main_mem/RAM
add wave -noupdate -expand -group {memory details} /riscv_tb/dut/main_mem/offset0
add wave -noupdate -expand -group {memory details} /riscv_tb/dut/main_mem/offset1
add wave -noupdate -expand -group {memory details} /riscv_tb/dut/main_mem/offset2
add wave -noupdate -expand -group {memory details} /riscv_tb/dut/main_mem/offset3
add wave -noupdate -expand -group {memory details} /riscv_tb/dut/main_mem/size4_or2
add wave -noupdate -expand -group {memory details} /riscv_tb/dut/main_mem/size4
add wave -noupdate -expand -group {memory details} /riscv_tb/dut/main_mem/size2
add wave -noupdate -expand -group {memory details} /riscv_tb/dut/main_mem/size1
add wave -noupdate /riscv_tb/dut/main_mem/s0_sel
add wave -noupdate /riscv_tb/dut/main_mem/s1_sel
add wave -noupdate /riscv_tb/dut/main_mem/s2_sel
add wave -noupdate /riscv_tb/dut/main_mem/s3_sel
add wave -noupdate /riscv_tb/dut/main_mem/s4_sel
add wave -noupdate /riscv_tb/dut/main_mem/s5_sel
add wave -noupdate /riscv_tb/dut/main_mem/s6_sel
add wave -noupdate /riscv_tb/dut/main_mem/mem_read1_byte0
add wave -noupdate /riscv_tb/dut/main_mem/mem_read1_byte1
add wave -noupdate /riscv_tb/dut/main_mem/mem_read1_byte2
add wave -noupdate /riscv_tb/dut/main_mem/mem_read1_byte3
add wave -noupdate /riscv_tb/dut/main_mem/mem_read1_byte4
add wave -noupdate /riscv_tb/dut/main_mem/mem_read1_byte5
add wave -noupdate /riscv_tb/dut/main_mem/mem_read1_byte6
add wave -noupdate /riscv_tb/dut/main_mem/mem_read1_byte7
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {416974446 ps} 0} {{Cursor 3} {35249 ps} 0}
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
configure wave -timelineunits ps
update
WaveRestoreZoom {416872950 ps} {417087050 ps}
