// Ross Thompson
// September 20, 2019
// Oklahoma State University

module top_mram (input         clk, 
		 input 	       areset,
		 output        suspend,
		 input 	       PROGRAM,
		 // programmer interface (SPI)
		 input 	       sclk,
		 input 	       mosi,
		 output        miso,
		 input 	       ss,
		 // MRAM interface
		 output [15:0] maddr,
		 inout [31:0]  mdata,
		 output        webar,
		 output        rebar,
		 output        gclk,
		 output        [3:0] gpo,
		 input 	       [3:0] gpi);

   logic 		reset;

   wire [31:0] 		  pc;
   wire [31:0] 		  instr;
   wire [31:0] 		  readdata;
   wire [31:0] 		  writedata;
   wire [31:0] 		  dataadr;

   wire [15:0] paddr;
   wire [31:0] pdata;
   wire        pwe;
   wire        memwrite;
   wire        cpu_reset;
   wire [31:0] mrd;
   wire [31:0] mwd;
   logic       we;
   logic       re;
   logic [31:0] pcnext;
   logic 	ph0, ph1, ph2;
   logic 	clk0;
   logic 	program_sync;
   logic 	program_reset;

   logic 	clk_chip;
   logic 	areset_chip;
   logic 	suspend_chip;
   logic 	PROGRAM_chip;
   logic 	sclk_chip;
   logic 	mosi_chip;
   logic 	miso_chip;
   logic 	ss_chip;
   logic [15:0] maddr_chip;
   logic [31:0] mwd_chip;
   logic [31:0] mrd_chip;
   logic 	mdata_oe_chip;
   logic 	webar_chip;
   logic 	rebar_chip;
   logic [3:0] 	gpo_chip;
   logic [3:0] 	gpi_chip;
   logic 	gclk_chip;
   logic 	memread;
   
   
   
   // drivers

   drivers drivers(// pad side
		   .clk(clk),
 		   .areset(areset),
 		   .suspend(suspend),
 		   .PROGRAM(PROGRAM),
 		   .sclk(sclk),
 		   .mosi(mosi),
 		   .miso(miso),
 		   .ss(ss),
		   .maddr(maddr),
		   .mdata(mdata),
 		   .webar(webar),
 		   .rebar(rebar),
 		   .gclk(gclk),
		   .gpo(gpo),
		   .gpi(gpi),

		   // chip side
 		   .clk_chip(clk_chip),
 		   .areset_chip(areset_chip),
 		   .suspend_chip(suspend_chip),
 		   .PROGRAM_chip(PROGRAM_chip),
 		   .sclk_chip(sclk_chip),
 		   .mosi_chip(mosi_chip),
 		   .miso_chip(miso_chip),
 		   .ss_chip(ss_chip),
		   .maddr_chip(maddr_chip),
		   .mwd_chip(mwd_chip),
		   .mrd_chip(mrd_chip),
		   .mdata_oe_chip(mdata_oe_chip),
 		   .webar_chip(webar_chip),
 		   .rebar_chip(rebar_chip),
 		   .gclk_chip(gclk_chip),
		   .gpo_chip(gpo_chip),
		   .gpi_chip(gpi_chip));
   



   // reset synchronizer
   arrs reset_sync(.reset_out(reset),
		   .areset(areset_chip),
		   .clk(clk_chip));

   arrs prog_sync(.reset_out(program_sync),
		     .areset(PROGRAM_chip),
		     .clk(clk_chip));

   reset_fsm reset_fsm(.clk(clk_chip),
		       .reset(reset),
		       .PROGRAM(program_sync),
		       .cpu_reset(cpu_reset),
		       .program_reset(program_reset));
   

   clk_phase clk_gen(.clk(clk_chip),
		     .reset(cpu_reset),
		     .ph0(ph0),
		     .ph1(ph1),
		     .ph2(ph2),
		     .clk0(clk0));

  // instantiate processor
 
   riscv riscv (.clk(clk0),
		.reset(cpu_reset),
                .pc(pc),
		.pcnext(pcnext),
		.instr(instr),
                .memwrite(memwrite),
                .aluout(dataadr),
                .writedata(writedata),
                .readdata(readdata), 
		.suspend(suspend_chip),
		.memread(memread));

   logic [31:0] mwd_byte_swap;
   logic [31:0] mrd_byte_swap;

   // instantiate memory interface
   nvmif memory_controller(.clk(clk_chip),
			   .reset(reset),
			   .cpu_reset(cpu_reset),
			   .ph0(ph0),
			   .ph1(ph1),
			   .ph2(ph2),
			   .pcnext(pcnext),
			   .instr(instr),
			   .memwrite(memwrite),
			   .memread(memread),			   
			   .dataadr(dataadr),
			   .writedata(writedata),
			   .readdata(readdata),
			   .maddr(maddr_chip),
			   .mwd(mwd),
			   .mrd(mrd),
			   .we(we),
			   .re(re),
			   .gclk(gclk_chip),
			   .gpo(gpo_chip),
			   .gpi(gpi_chip),
			   .paddr(paddr),
			   .pdata(pdata),
			   .pwe(pwe));

   assign webar_chip = ~we;
   assign rebar_chip = ~re;
   assign mdata_oe_chip = we;

   assign mwd_byte_swap = {mwd[7:0], mwd[15:8], mwd[23:16], mwd[31:24]};
   assign mwd_chip = mwd_byte_swap;
   
   assign mrd_byte_swap = mrd_chip;
   assign mrd = {mrd_byte_swap[7:0], mrd_byte_swap[15:8], mrd_byte_swap[23:16], mrd_byte_swap[31:24]};
   
   // programming interface
   programmer spi_controller(.clk(clk_chip),
			     .areset(areset_chip),
			     .PROGRAM(program_sync),
			     .sclk(sclk_chip),
			     .mosi(mosi_chip),
			     .miso(miso_chip),
			     .ss(ss_chip),
			     .pwe_pulse_q(pwe),
			     .paddr(paddr),
			     .pdata(pdata));
   
endmodule // top_mram
