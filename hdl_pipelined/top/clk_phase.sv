// Ross Thompson
// September 30, 2019
// Oklahoma State University

module clk_phase(input clk,
		 input 	reset,
		 output ph0,
		 output ph1,
		 output ph2,
		 output clk0);

   logic 		ph0_q;

   flopenr #(1) ph0_reg(.clk(clk),
			.reset(reset),
			.en(1'b1),
			.d(ph2),
			.q(ph0));
   
   flopens #(1) ph1_reg(.clk(clk),
			.set(reset),
			.en(1'b1),
			.d(ph0),
			.q(ph1));

   flopenr #(1) ph2_reg(.clk(clk),
			.reset(reset),
			.en(1'b1),
			.d(ph1),
			.q(ph2));

   // clock gater 
   clockgater clk_gater_ph0(.clk(clk),
			    .en1(ph0),
			    .en2(1'b0),
			    .gclk(clk0));

endmodule // clk_phase


