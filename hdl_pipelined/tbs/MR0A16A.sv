// Ross Thompson
// September 20, 2019
// Oklahoma State University

// Mram.sv
// model of physical device MR0A16A
// This is like an asynchronous SRAM, but non-volatile.
// Provides timing constraints to ensure device is modeled accurately.
// BUG does not yet support timing constraints. 


`timescale 1ns/1ns
module MR0A16A (input gbar,
		input [15:0] a,
		input ebar,
		input wbar,
		input ubbar,
		input lbbar,
		inout [15:0] dq);
   parameter PRELOAD_FILE = "mram_preload.txt";
   parameter PRELOAD_EN = 1;

   reg [15:0] 		     local_read_data;
   
   // ultimately this is just a memory
   //reg [15:0] memory_bank [logic[15:0]];
   reg [15:0] memory_bank [2**16-1:0];
   logic      wbar_delay;
   

   // preload
   initial begin
      if (PRELOAD_EN == 1) begin
	 $readmemh(PRELOAD_FILE, memory_bank);
      end
   end
   
   // write side.
   // writes occur when WBAR, EBAR and the byte enable are low.
   // to simplify things we are going to use WBAR as a clock even though this
   // is not how the chip actually works.
   // forced to use blocking assignment for write to memory array as modelsim
   // does not support this with associative arrays.

   // By delaying wbar 15ns we can sample the original wbar to see if the
   // signal was held long enough.
   assign #15 wbar_delay = wbar;
   
   always @(negedge wbar_delay) begin
      if(~ebar & ~wbar) begin
	 if(~lbbar) begin
	    memory_bank[a][7:0] = dq[7:0];
	 end
	 if(~ubbar) begin
	    memory_bank[a][15:0] = dq[15:0];
	 end
      end
   end

   // read side.
   always @(*) begin
      if((~gbar) & (~ebar) & wbar) begin
	 if(~lbbar) begin
	    local_read_data[7:0] <= #35 memory_bank[a][7:0];
	 end
	 if(~ubbar) begin
	    local_read_data[15:8] <= #35 memory_bank[a][15:8];
	 end
      end
   end

   assign dq[7:0] = (~ gbar) & (~ ebar) & (~ lbbar) ? local_read_data[7:0] : 8'bz;
   assign dq[15:8] = (~ gbar) & (~ ebar) & (~ lbbar) ? local_read_data[15:8] : 8'bz;
   

endmodule
