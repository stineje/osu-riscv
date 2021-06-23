//------------------------------------------------
// imem.v
// James E. Stine
// February 1, 2018
// Oklahoma State University
// ECEN 4243
// Harvard Architecture Instr Memory (Little Endian)
//------------------------------------------------

module imem (mem_addr, mem_out);

   output [31:0] mem_out;
   input [31:0]  mem_addr;

   // Choose smaller memory to speed simulation
   //   through smaller AddrSize (only used to
   //   allocate memory size -- processor sees
   //   32-bits)
   parameter AddrSize = 16;
   parameter WordSize = 32;

   reg [WordSize-1:0] RAM[((1<<AddrSize)-1):0];
   wire [7:0] 	 byte1, byte2, byte3, byte4;      

   assign byte1 = RAM[mem_addr][7:0];
   assign byte2 = RAM[mem_addr][15:8];
   assign byte3 = RAM[mem_addr][23:16];
   assign byte4 = RAM[mem_addr][31:24];

   // Read Instruction memory
   //   byte addressed, but appears as 32b to processor
   assign mem_out = {byte1, byte2, byte3, byte4};

endmodule // imem


