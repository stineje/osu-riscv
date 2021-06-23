//------------------------------------------------
// top.v
// David_Harris@hmc.edu 9 November 2005
// Top level system including MIPS and memories
//------------------------------------------------

module top(input         clk, reset, 
           output [31:0] writedata, dataadr, 
           output        memwrite);

  wire [31:0] pc, instr, readdata;
  
  // instantiate processor and memories
  mips mips(clk, reset, pc, instr, memwrite, dataadr, writedata, readdata);
  imem imem(pc[7:2], instr);
  dmem dmem(clk, memwrite, dataadr, writedata, readdata);

endmodule

module dmem(input         clk, we,
            input  [31:0] a, wd,
            output [31:0] rd);

  reg  [31:0] RAM[63:0];

  assign rd = RAM[a[31:2]]; // word aligned

  always @(posedge clk)
    if (we)
      RAM[a[31:2]] <= wd;
endmodule

// imem may be created with CoreGen for Xilinx synthesis
// or loaded from imem.v for simulation