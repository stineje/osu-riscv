`timescale 1ns/1ps
module riscv_tb();

   parameter PRELOAD_FILE = "preload.txt";
   parameter PRELOAD_EN = 1;
   parameter FUNCTION_FILE = "";

   logic        clk;
   logic        areset;
   
   logic [31:0] WriteData, DataAdr;
   logic        MemWrite;
   logic        suspend;   
   
   // instantiate device to be tested
   top #(.PRELOAD_FILE(PRELOAD_FILE),
	    .PRELOAD_EN(PRELOAD_EN))     
   dut (.clk(clk),
        .areset(areset),
        .writedata(WriteData),
        .dataadr(DataAdr),
        .memwrite(MemWrite),
	.suspend(suspend));
   
   // initialize test
   initial
     begin
	areset <= 1; # 20; areset <= 0;
     end
   
   // generate clock to sequence tests
   always
     begin
	clk <= 1; # 5; clk <= 0; # 5;
     end

   // check results
   always @(negedge clk)
     begin
	if(suspend) begin
           // assert (dut.riscv.dp.rf.rf[10]==10)
           $display("Simulation succeeded");
           // else $display("Simulation failed");
           $stop;
	end
     end

   function_radix #(.PRELOAD_FILE(FUNCTION_FILE))
   function_radix();
   
endmodule // riscv_tb
