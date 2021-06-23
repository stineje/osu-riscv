module top (input logic         clk, areset, 
            output logic [31:0] writedata, dataadr, 
            output logic 	memwrite, 
	    output logic 	suspend);

   parameter PRELOAD_FILE = "preload.txt";
   parameter PRELOAD_EN = 1;

   logic [31:0] 		pc, instr, readdata;
   logic 			reset;
   logic [31:0] 		pcnext;
   logic 			memread;
   logic [1:0] 			mem_size;
      
   // reset synchronizer
   arrs reset_sync(.reset_out(reset),
		   .areset(areset),
		   .clk(clk));

   // instantiate processor and memories
   riscv riscv (.clk(clk), .reset(reset),
                .pcF(pc),  .instrF(instr),
                .memwriteM(memwrite),
		.mem_sizeM(mem_size),
                .aluoutM(dataadr),
                .writedataM(writedata),
                .readdataM(readdata),
		.memreadM(memread),
		.suspendW(suspend));

   // memory
   // Phase 1 of memory hierarchy implementation
   // Use a two port memory to merge together the instructions and data.

   memory #(.PRELOAD_FILE(PRELOAD_FILE),
	    .PRELOAD_EN(PRELOAD_EN))     
   main_mem(.clk(clk),
	    .mem_addr0(dataadr),
	    .mem_out0(readdata),
	    .mem_in0(writedata),
	    .r_w_0(memwrite),
	    .mem_size0(mem_size),
	    .mem_addr1({pc[31:2], 2'b00}),
	    .mem_out1(instr));

endmodule // top
