//
// File name : tb.v
// Title     : stimulus
// project   : ECEN3233
// Library   : test
// Author(s) : James E. Stine, Jr.
// Purpose   : definition of modules for testbench 
// notes :   
//
// Copyright Oklahoma State University
//

// Top level stimulus module

module stimulus;

   reg Clk;  // Always declared so can simulate based on clock

   // Declare variables for stimulating input
   reg [31:0] A;
   reg [31:0] B;

   wire       LT;
   wire       EQ;
   wire       GT;   
   
   integer    handle3;
   integer    desc3;   
   
   // Instantiate the design block counter
   magcompare32 dut (GT, LT, EQ, {~A[31], A[30:0]}, {~B[31], B[30:0]});

   // Setup the clock to toggle every 1 time units 
   initial 
     begin	
	Clk = 1'b1;
	forever #5 Clk = ~Clk;
     end

   initial
     begin
	// Gives output file name
	handle3 = $fopen("comp32.out");
	// Tells when to finish simulation
	#500 $finish;		
     end

   always 
     begin
	desc3 = handle3;
	#5 $fdisplay(desc3, "%h %d %h %d || %b %b %b %d", 
		     A, $signed(A), B, $signed(B), GT, LT, EQ, A < B);
     end

   // Stimulate the Input Signals
   initial
     begin
	// Add your test vectors here
	#10 A = 32'h0056eecd; 
	#0  B = 32'h0056eecd; 
	#10 A = 32'h0056eecd; 
	#0  B = 32'h582c6229;
	#10 A = 32'h74c8b8dc; 
	#0  B = 32'h23bebdfe;
	#10 A = 32'h46f63068; 
	#0  B = 32'hdade4fde;
	#10 A = 32'h017b4f20;
	#0  B = 32'hcc9232c6;
	#10 A = 32'h9036b64f; 
	#0  B = 32'h686761f4;
	#10 A = 32'hb0a5e017;
	#0  B = 32'h03be500a;
	#10 A = 32'h72e1fa77; 
	#0  B = 32'h7a9983a2;
	#10 A = 32'ha533024b; 
	#0  B = 32'h84b2319b;
	#10 A = 32'h1568f9c8; 
	#0  B = 32'hdf762617;
	#10 A = 32'h9b9e2aa1; 
	#0  B = 32'hece9165b;
	#10 A = 32'h2adf5298; 
	#0  B = 32'h692c81b2;
	#10 A = 32'h9f2beaa4; 
	#0  B = 32'h42d459bc;
	#10 A = 32'h251cd899; 
	#0  B = 32'hff46e602;
	#10 A = 32'h445b4d1b; 
	#0  B = 32'h87f46e13;
	#10 A = 32'h0358d819; 
	#0  B = 32'h02f20715;
	#10 A = 32'h9cd3e013; 
	#0  B = 32'hef820fb2;
	#10 A = 32'hc453d9d3;
	#0  B = 32'h61c2be36;
	#10 A = 32'h158085cc; 
	#0  B = 32'h0e861a88;
	#10 A = 32'he9c6872b; 
	#0  B = 32'h03c9f5b3;
	#10 A = 32'h3f93abcd;
	#0  B = 32'ha3f8201C;
	#10 A = 32'h13903038;
	#0  B = 32'h38393973;
	#10 A = 32'hF3930370;
	#0  B = 32'hA393039C;
	#10 A = 32'h12030308;
	#0  B = 32'h93038037;
	
     end

endmodule // stimulus
