// Ross Thompson
// September 20, 2019
// Oklahoma State University

// Nvmif.sv
// non-volatile memory interface.
// connects the CPU's Imem and Dmem busses to the external MRAM memory and
// the programming circuit.
// This module assumes a single cycle processor which preforms the Imem read
// during the positive half of the clock cycle and the Dmem access during the
// negative half.
// Muxes together the read and writes into a signle bidirectional data bus which
// requires the bidirectional driver.

// because we are weaving an instruction read with a data access we can never
// have two writes back to back.  This is good as it forces WE to toggle
// off after every write.  Because the programmer syncs the SPI input buffer to
// CLK and generates a pulse of pwe we can be sure that PWE does not remain
// high.

module nvmif(input clk,
	     input 	   reset,
	     input 	   cpu_reset, 
	     input 	   ph0, ph1, ph2,
	     // CPU side
	     input [31:0]  pcnext,
	     output [31:0] instr,
	     input 	   memwrite,
	     input 	   memread,
	     input [31:0]  dataadr,
	     input [31:0]  writedata,
	     output [31:0] readdata,
	     // memory side
	     output [15:0] maddr,
	     output [31:0] mwd,
	     input [31:0]  mrd,
	     output 	   we,
	     output 	   re,
	     // io interface
	     output 	   gclk,
	     output [3:0]  gpo,
	     output [3:0]  gpi,
	     // programmer
	     input [15:0]  paddr,
	     input [31:0]  pdata,
	     input 	   pwe);

   wire [15:0] 		   caddr;
   logic [15:0] 	   maddr_d;
   logic 		   gpioen;
   logic [31:0] 	   grd;
   logic [31:0] 	   mwd_d;   
   logic 		   maddr_en;
   logic 		   mwd_en;
   logic 		   we_d, re_d;

   assign re_d = ((ph2 & ~memwrite) | (ph2 & gpioen) | ~ph2) & ~pwe;
   assign we_d = ~re_d;
   
   flopenr #(1) we_reg(.clk(clk),
		       .reset(reset),
		       .en(1'b1),
		       .d(we_d),
		       .q(we));
   
   flopens #(1) re_reg(.clk(clk),
		       .set(reset),
		       .en(1'b1),
		       .d(re_d),
		       .q(re));
   
   // io memory address.
   assign gpioen = dataadr == 32'hFFFFFFFC & (memread | memwrite) ? 1'b1 : 1'b0;
   
   // address muxing
   mux2 #(16) caddr_mux(.d0(pcnext[17:2]),
			.d1(dataadr[17:2]),
			.s(ph2),
			.y(caddr));

   mux2 #(16) maddr_mux(.d0(caddr),
			.d1(paddr),
			.s(pwe),
			.y(maddr_d));

   flopenr #(16) maddr_reg(.clk(clk),
			   .reset(reset),
			   .en(maddr_en),
			   .d(maddr_d),
			   .q(maddr));
   assign maddr_en = ph0 | ph2 | pwe;
   

   // write data muxing
   mux2 #(32) mwd_mux(.d0(writedata),
		      .d1(pdata),
		      .s(pwe),
		      .y(mwd_d));

   flopenr #(32) mwd_reg(.clk(clk),
			 .reset(reset),
			 .en(mwd_en),
			 .d(mwd_d),
			 .q(mwd));
   assign mwd_en = ph2 | pwe;

   // read data muxing
   mux2 #(32) mrd_mux(.d0(mrd),
		      .d1(grd),
		      .s(gpioen),
		      .y(readdata));

   flopenr #(32) mrd_instr_save_reg(.clk(clk),
				    .reset(cpu_reset),
				    .en(ph1),
				    .d(mrd),
				    .q(instr));

   // memory mapped i/o
   GPIO gpio_controller (.clk(clk),
			 .reset(cpu_reset),
			 .enable(gpioen & ph2),
			 .wd(writedata),
			 .rd(grd),
			 .gpo(gpo),
			 .gpi(gpi),
			 .memwrite(memwrite),
			 .gclk(gclk));
   
   
endmodule // nvmif




