`timescale 1ns/1ns
module riscv_mram_tb();

   parameter PRELOAD_EN = 1;
   parameter MRAM0_PRELOAD = "MRAM0.hex";
   parameter MRAM1_PRELOAD = "MRAM1.hex";
   parameter SPI_FILE = "spi_preload.txt";

   logic        clk;
   logic        areset;
   logic 	spi_en;
   logic 	suspend;
   
   wire  [31:0] mdata;
   logic [15:0] maddr;

   logic 	sclk;
   logic 	mosi;
   logic 	miso;
   logic 	ss;

   logic 	gbar;
   logic 	wbar;
   logic 	program_done;
   
   
   // instantiate device to be tested
   top_mram dut (.clk(clk),
		 .areset(areset),
		 .suspend(suspend),
		 .PROGRAM(spi_en),
		 // programmer interface (SPI)
		 .sclk(sclk),
		 .mosi(mosi),
		 .miso(miso),
		 .ss(ss),
		 // MRAM interface
		 .maddr(maddr),
		 .mdata(mdata),
		 .webar(wbar),
		 .rebar(gbar));


   // instantiate memory
   
   MR0A16A #(.PRELOAD_FILE(MRAM0_PRELOAD),
	     .PRELOAD_EN(PRELOAD_EN))
   MRAM0(.gbar(gbar),
	 .a(maddr),
	 .ebar(1'b0),
	 .wbar(wbar),
	 .ubbar(1'b0),
	 .lbbar(1'b0),
	 .dq(mdata[15:0]));
   
   MR0A16A #(.PRELOAD_FILE(MRAM1_PRELOAD),
	     .PRELOAD_EN(PRELOAD_EN))
   MRAM1(.gbar(gbar),
	 .a(maddr),
	 .ebar(1'b0),
	 .wbar(wbar),
	 .ubbar(1'b0),
	 .lbbar(1'b0),
	 .dq(mdata[31:16]));

   spi_dongle #(.PRELOAD_FILE(SPI_FILE))
   spi0 (.ENABLE(spi_en),
	 .CPOL(1'b0),
	 .CPHA(1'b0),
	 .RESET(areset),
	 .SCLK(sclk),
	 .MOSI(mosi),
	 .MISO(miso),
	 .SS(ss),
	 .PROGRAM_DONE(program_done));
   
   
   // initialize test
   initial
     begin
	areset <= 1;
	spi_en <= ~PRELOAD_EN;
	# 500; 
	areset <= 0;

	wait (program_done == 1) #1000 spi_en <= 0;
	areset <= 1;
	# 500;
	areset <= 0;

     end
   
   // generate clock to sequence tests
   always
     begin
	clk <= 1; # 40; clk <= 0; # 40;
     end

   // check results
   always @(negedge clk)
     begin
	if(suspend) begin
           $display("Simulation succeeded");
           $stop;
	end
     end
   
   
endmodule // riscv_mram_tb
