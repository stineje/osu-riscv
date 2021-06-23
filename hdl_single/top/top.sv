module top (input         clk, areset, 
            output [31:0] writedata, dataadr, 
            output 	  memwrite, 
	    output 	  suspend);

   logic [31:0] 		  pc, instr, readdata;
   logic 			  reset;
   logic 			  memread;   
   
   // reset synchronizer
   arrs reset_sync(.reset_out(reset),
		   .areset(areset),
		   .clk(clk));

   // instantiate processor and memories
   riscv riscv (.clk(clk), .reset(reset),
                .pc(pc), .instr(instr),
                .memwrite(memwrite),
                .aluout(dataadr),
                .writedata(writedata),
                .readdata(readdata),
		.memread(memread),
		.suspend(suspend));
   imem imem (.mem_addr({2'h0, pc[31:2]}),   
              .mem_out(instr));
   dmem dmem (.clk(clk), .r_w(memwrite),
              .mem_addr(dataadr),
              .mem_data(writedata),
              .mem_out(readdata));

endmodule // top
