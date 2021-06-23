// Ross Thompson
// September 20, 2019
// Oklahoma State University

// Programmer.sv
// Connects a SPI interface to NV-memory (asynchronous SRAM like memory).
// PROGRAM pin acks like an enable for the programmer.  When high it enables
// the module and overrides the operation of the memory bus.
// This programmer only writes to the memory in 32 bit chunks and always
// starts at address 0.  Writes occur until no more data is sent.  The
// programmer supports upto 64K words but does not check for overflow.  Overflow
// will wrap around to the address 0.

// Data is synchronized to the system clock CLK every time 32 bits of data are
// shifted in.  At this time the master SPI must wait more than 600ns before 
// sending the next word.

// *****************************************************************************
// CLK must be running for the programmer to work!!!!!!
// *****************************************************************************

// Theory of operation.
// SPI shifts in 32 bits of data into a shift register.  Meanwhile a 22 bit 
// count tracks the number of bits sent. After 32 bits are transmitted,
// (ie. count[5:0] = 31) pwe is pulled high by a comparater.  pwd is 
// synchronized to CLK and a positive edge detector pulse pwe_pulse for one
// CLK period.  This is used to capture count[21:6] and the shift register 
// onto CLK.  Programmer.sv then outputs three signals; pdata (shift register),
// paddr (count[21:6]), and pwe_pulse.


module programmer(// system signals
		  input clk,
		  input areset,
		  input PROGRAM,
		  // SPI
		  input sclk,
		  input mosi,
		  output miso,
		  input ss,
		  // NV memory
		  output pwe_pulse_q,
		  output [15:0] paddr,
		  output [31:0] pdata);


   wire [32:0] 			shift_data;
   wire 			enable;
   wire [20:0] 			count;
   wire 			pwe;
   logic 			pwe_sclk;
   wire 			pwe_clkq;
   wire 			pwe_clkqq;
   wire 			pwe_clkqqq;
   logic 			pwe_pulse;
   logic [15:0] 		paddr_sclk;
   logic [31:0]			pdata_byte_swap;
   

   genvar 			data_index;
   
   assign enable = PROGRAM & ss;
   assign shift_data[32] = mosi;

   // shift register to hold SPI input
   flopenr #(32) data(.clk(sclk),
		      .reset(areset),
		      .en(enable),
		      .d(shift_data[32:1]),
		      .q(shift_data[31:0]));
   assign miso = shift_data[0];

   // sync data to clk
   flopenr #(32) data_out_reg(.clk(clk),
			      .reset(areset),
			      .en(pwe_pulse),
			      .d(shift_data[31:0]),
			      .q(pdata_byte_swap));

   assign pdata = {pdata_byte_swap[7:0], pdata_byte_swap[15:8], pdata_byte_swap[23:16], pdata_byte_swap[31:24]};

   // address and bit counter, 6 bits of the bit counter, and 16 bits for the
   // address.
   counter #(21) addr_counter(.clk(sclk),
			      .areset(areset),
			      .enable(enable),
			      .load(1'b0),
			      .count_in(21'b0),
			      .count_out(count));

   // When the lower 5 bits of counter are all 1 we have 32 new bits of data.
   assign pwe = count[4:0] == 5'b11111 ? 1'b1 : 1'b0;

   // capture counter address(20:5) on pwe
   flopenr #(16) addr_capture(.clk(sclk),
			      .reset(areset),
			      .en(pwe),
			      .d(count[20:5]),
			      .q(paddr_sclk));

   flopenr #(1) pwe_delay(.clk(sclk),
			  .reset(areset),
			  .en(1'b1),
			  .d(pwe),
			  .q(pwe_sclk));
      
   // synchronize pwe to clk
   flopenr #(1) pwe_sync1(.clk(clk),
			  .reset(areset),
			  .en(1'b1),
			  .d(pwe_sclk),
			  .q(pwe_clkq));

   flopenr #(1) pwe_sync2(.clk(clk),
			  .reset(areset),
			  .en(1'b1),
			  .d(pwe_clkq),
			  .q(pwe_clkqq));
   
   // generate 1 cycle pulse
   flopenr #(1) pwe_pulse_reg(.clk(clk),
			      .reset(areset),
			      .en(1'b1),
			      .d(pwe_clkqq),
			      .q(pwe_clkqqq));

   assign pwe_pulse = (~pwe_clkqqq) & pwe_clkqq;
   
      
   // sync address to clk
   flopenr #(16) addr_out_sync_reg(.clk(clk),
			      .reset(areset),
			      .en(pwe_pulse),
			      .d(paddr_sclk),
			      .q(paddr));

   // delay pwe_pulse 1 cycle to match the data and address
   flopenr #(1) pwe_pulse_delay_reg(.clk(clk),
				    .reset(areset),
				    .en(1'b1),
				    .d(pwe_pulse),
				    .q(pwe_pulse_q));

   // May need a time out to ensure that program is not pulled off during the last pwe_pulse_q.
   // There is a potential race condition between pwe_pulse_q and program being removed.  Realistically
   // this won't be an issue as program is a physical toggle switch on the board.
   
   
endmodule // programmer
   
   
		  
