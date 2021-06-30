module mux8 #(parameter WIDTH = 8)
   (input  logic [WIDTH-1:0] d0, d1, d2, d3, d4, d5, d6, d7,
    input  logic [2:0]       s, 
    output logic [WIDTH-1:0] y);

   logic 		     y0;
   logic 		     y1;
   
   assign y0 = s[1] ? (s[0] ? d3 : d2) : (s[0] ? d1 : d0);
   assign y1 = s[1] ? (s[0] ? d7 : d6) : (s[0] ? d5 : d4);
   assign y = s[2] ? y1 : y0;

endmodule // mux4
