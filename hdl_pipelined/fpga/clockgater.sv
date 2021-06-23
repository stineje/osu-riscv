// Ross Thompson
// October 10, 2019
// Oklahoma State University

// clock gater

// want this to be a fpga model, but i cannot seem to find this.
module clockgater(input clk,
		  output gclk,
		  input en1,
		  input  en2);

   logic 		 en;
   logic 		 enq;

   assign en = en1 | en2;
   
   // latch   
   always @(*) begin
      if(~clk) begin
	 enq <= en;
      end
   end
   assign gclk = clk & enq;

endmodule

