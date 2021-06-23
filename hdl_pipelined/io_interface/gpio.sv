// Ross Thompson
// September 26, 2019
// Oklahoma State University

// GPI/O hardware module.
// memory map 1 address to an I/O register which can transmit and receive 4 
// bits of data.
// A write to this address will drive the 4 gpo bits with the lower 4 bits of
// the stores data.  The gclk pin will pulse 1 cycle.
// A read to this address will sample the gpi pins on the falling edge of clk.
// Data will be returned to the CPU as 28'b0, gpi[4:0].  gclk will be pulsed
// one time.

module GPIO (input  clk,
	     input 	  reset,
	     input 	  enable,
	     input [31:0]  wd,
	     output [31:0] rd,
	     output [3:0] gpo,
	     input [3:0]  gpi,
	     input 	  memwrite,
	     output 	  gclk);

   logic 		  we;
   logic 		  re;
   logic [3:0] 		  gpi_q;
   logic 		  en_q;
   
   // we want to register the GPO once to reduce the critical path length
   // register on the rising edge as enable is registered on the falling edge.

   assign we = enable & memwrite;
   flopenr #(4) gpo_reg(.clk(clk),
			.reset(reset),
			.en(we),
			.d(wd[3:0]),
			.q(gpo));
   
   // We want to register the gpi pins on read this ensures they are on the 
   // system clock.  Note to simplify the operations the sender will have to 
   // keep gpi stable before and after the sampling.  The protocol will be
   // CPU transmits on gpo a message to tell the sender it has taken the
   // data.  We might want to improve this interface as this will be very
   // slow.

   assign re = enable & ~memwrite;
   flopenr #(4) gpi_reg(.clk(clk),
			.reset(reset),
			.en(re),
			.d(gpi),
			.q(gpi_q));
   assign rd = {28'b0, gpi_q};
   
   // clock gater to send out the gclk pulse during enable.
/* -----\/----- EXCLUDED -----\/-----
   flopenr #(1) clk_gater_reg(.clk(~clk),
			      .reset(reset),
			      .en(1'b1),
			      .d(enable),
			      .q(en_q));
   assign gclk = clk & en_q;
 -----/\----- EXCLUDED -----/\----- */

   clockgater clk_gater_reg(.clk(clk),
			    .en1(reset),
			    .en2(enable),
			    .gclk(gclk));
   

endmodule // GPIO


