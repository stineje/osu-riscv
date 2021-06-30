`timescale 1ns/1ns
module flopenrc #(parameter WIDTH = 8)
   (input  logic             clk, reset, en, clear,
    input logic [WIDTH-1:0]  d, 
    output logic [WIDTH-1:0] q);
   
   always_ff @(posedge clk, posedge reset)
     if (reset)   q <= #1 0;
     else if (en) 
       if (clear) q <= #1 0;
       else       q <= #1 d;

endmodule // flopenrc
