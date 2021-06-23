// Ross Thompson
// September 30, 2019
// Oklahoma State University

// reset controller

module reset_fsm(input clk,
		 input reset,
		 input PROGRAM,
		 output cpu_reset,
		 output program_reset);


   logic [1:0] 		currstate, nextstate;

   flopenr #(2) state(.clk(clk),
		      .reset(reset),
		      .en(1'b1),
		      .d(nextstate),
		      .q(currstate));

   // next state logic
   assign nextstate = (currstate == 2'b00 & PROGRAM == 1'b0) ? 2'b01 
     : (currstate == 2'b00 & PROGRAM == 1'b1) ? 2'b10 
       : currstate == 2'b01 ? 2'b01 
		    : 2'b10;

   assign cpu_reset = currstate == 2'b01 ? 1'b0 : 1'b1;
   assign program_reset = currstate == 2'b10 ? 1'b0 : 1'b1;

endmodule // reset_fsm

   
       
