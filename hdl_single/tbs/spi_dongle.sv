// Ross Thompson
// September 24, 2019
// Oklahoma State University

// spi_dongle.sv

`timescale 1ns/1ns
module spi_dongle (input ENABLE,
		   input CPOL,
		   input CPHA,
		   input RESET,
		   output SCLK,
		   output MOSI,
		   input MISO,
		   output SS,
		   output PROGRAM_DONE);

   parameter PRELOAD_FILE = "spi_preload.txt";
      
   reg [31:0] memory_bank [2**16-1:0];
   logic      clk;
   logic      ss_d, ss_q0, ss_q1;
   logic      mosi_d, mosi_q0, mosi_q1;
   logic [20:0] count;
   


   // generate clock to sequence tests
   always
     begin
	clk <= 1; # 100; clk <= 0; # 100;
     end

   // preload
   initial $readmemh(PRELOAD_FILE, memory_bank);
   // we need to count the number of lines in the file so we can set line_count.
   integer fp;
   integer line_count = 0;
   logic [31:0] line;
   initial begin
      fp = $fopen(PRELOAD_FILE, "r");
      // read line by line to count lines
      while (! $feof(fp)) begin
	 $fscanf(fp, "%h\n", line);
	 line_count = line_count + 1;
      end
   end

   logic [1:0] currstate;
   logic [1:0] nextstate;

   always @(posedge clk) begin
      if (RESET) begin
	 currstate <= 2'b00;
      end else begin
	 currstate <= nextstate;
      end
   end

   // next state logic
   always @(*) begin
      case (currstate)
	2'b00: if (ENABLE) begin
	   nextstate <= 2'b01;
	end else begin
	   nextstate <= 2'b00;
	end
	2'b01: if(count[4:0] == 31) begin
	   nextstate <= 2'b11;
	end else begin
	   nextstate <= 2'b01;
	end
	2'b11: if (~ENABLE) begin
	   nextstate <= 2'b11;
	end else if(count[20:5] == line_count) begin
	   nextstate <= 2'b10;
	end else begin
	   nextstate <= 2'b01;
	end
	2'b10: nextstate <= 2'b10;
	default: nextstate <= 2'b00;
      endcase // case (currstate)
   end

   assign cnt_en = currstate == 2'b01 ? 1'b1 : 1'b0;

   counter #(21) addr_counter(.clk(clk),
			      .areset(RESET),
			      .enable(cnt_en),
			      .load(1'b0),
			      .count_in(21'b0),
			      .count_out(count));

   assign mosi_d = memory_bank[count[20:5]][count[4:0]];

   flopr #(1) mosi_reg1 (.clk(clk),
			.reset(RESET),
			.d(mosi_d),
			.q(mosi_q1));

   flopr #(1) mosi_reg0 (.clk(~clk),
			.reset(RESET),
			.d(mosi_d),
			.q(mosi_q0));

   assign ss_d = cnt_en;

   flopr #(1) ss_reg1 (.clk(~clk),
			.reset(RESET),
			.d(ss_d),
			.q(ss_q1));

   flopr #(1) ss_reg0 (.clk(~clk),
			.reset(RESET),
			.d(ss_d),
			.q(ss_q0));
   

   assign SS = (CPHA ? ss_q1 : ss_q0) & ENABLE;
   assign MOSI = (CPHA ? mosi_q1 : mosi_q0) & ENABLE;
   
   assign SCLK = ((clk & SS) ^ CPOL) & ENABLE;
   assign PROGRAM_DONE = currstate == 2'b10 ? 1'b1 : 1'b0;
   
endmodule
