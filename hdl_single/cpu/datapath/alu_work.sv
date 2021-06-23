// alu_cntrl
// 0: add
// 8: sub
// 1: sll
// 2: slt
// 3: stlu
// 4: xor
// 5: srl
// A: sra
// 6: or
// 7: and

module alu (input  [31:0] a, b, 
            input [3:0]   alu_cntrl,
	    input [2:0]   shift_cntrl,
            output [31:0] alu_out,
	    output [2:0] br_flags);

   logic [31:0] 	      b_inv;
   logic [31:0] 	      sum;
   logic 		      cout;
   logic [31:0] 	      a_xor_b;
   logic [31:0] 	      a_or_b;
   logic [31:0] 	      a_and_b;
   logic [31:0] 	      shift_out;
   logic 		      eq;
   logic 		      lt;
   logic [31:0] 	      set_lt;
   logic 		      ltu;
   logic [31:0] 	      set_ltu;
   logic 		      subtract;

   // mux outputs
   logic [31:0] 	      mux_out_l0_i0;
   logic [31:0] 	      mux_out_l0_i1;
   logic [31:0] 	      mux_out_l0_i2;
   logic [31:0] 	      mux_out_l0_i3;
   logic [31:0] 	      mux_out_l1_i0;
   logic [31:0] 	      mux_out_l1_i1;

   
   // xor b with alu_cntrl[3] (sign operation)
   assign subtract = alu_cntrl[3] | (alu_cntrl[1] & ~ alu_cntrl[2]);
   assign b_inv = subtract ? ~b : b;
   
   // 32 bit 2's complement adder with carry out
   assign {cout, sum} = a + b_inv + subtract;

   // xor A and B
   assign a_xor_b = a ^ b;
   // or A and B
   assign a_or_b = a | b;
   // and A and B
   assign a_and_b = a & b;

   // equality is just the nor of the xor of the inputs
   // xnor will be 1 for each bit if the inputs are equal.
   // then we can and reduce them to check all bits.
   assign eq = ~| a_xor_b;
   // to check for less than signed, we can tell the adder to
   // subtract B from A.  if B barrows from A we know that B is
   // larger, but only if A and B both have the same sign.  If we
   // xor the inverted carry out with the xor of A and B then we can
   // correct this issue.
   assign lt = ~cout ^ a_xor_b[31];
   // to check for less than unsigned, we can tell the adder to
   // subtract B from A.  If B barrows from A we know that B is
   // larger.  This means A is smaller.
   assign ltu =~ cout;
   assign set_lt = {31'b0, lt};
   assign set_ltu = {31'b0, ltu};

   assign br_flags = {ltu, lt, eq};

   // shfit control is not ideal. Need to simplify.
   shifter shifter(.a(a),
		   .shamt(b[4:0]),
		   .shift_cntrl(shift_cntrl),
		   .y(shift_out));
   
   // now mux the outputs together.
   mux8 #(32) mux_8_1(.d0(sum),
		      .d1(shift_out),
		      .d2(set_lt),
		      .d3(set_ltu),
		      .d4(a_xor_b),
		      .d5(shift_out),
		      .d6(a_or_b),
		      .d7(a_and_b),
		      .s(alu_cntrl[2:0]),
		      .y(alu_out));

endmodule // alu
