//------------------------------------------------
// memory.sv
// James E. Stine
// February 1, 2018
// Oklahoma State University
//
// Princeton Architecture Memory
// modified - Ross Thompson 3/30/20
// Added support for preload and converted to SV
//
// port 0 is r/w when r_w_0 is high 
// port 1 is read only
//------------------------------------------------

// the write data (mem_in0) is formatted little endian, but the memory and the 
// preload are big endian.
// Similarly mem_out0 and mem_out1 are little endian.

module memory (mem_out0, mem_out1, r_w_0, mem_size0, clk, mem_addr0, mem_addr1, mem_in0);

   parameter PRELOAD_FILE = "preload.txt";
   parameter PRELOAD_EN = 1;

   output logic [31:0] mem_out0;
   output logic [31:0] mem_out1;   
   input logic 	       r_w_0;
   input logic [1:0]   mem_size0;
   input logic 	       clk;   
   input logic [31:0]  mem_addr0;
   input logic [31:0]  mem_addr1;   
   input logic [31:0]  mem_in0;

   parameter AddrSize = 16;
   parameter WordSize = 32;
   logic [WordSize-1:0] RAM[((1<<AddrSize)-1):0];
/* -----\/----- EXCLUDED -----\/-----
   
   logic [63:0] 	mem_read0;
   logic [63:0] 	mem_read0_rev;

   logic [63:0] 	mem_read1;
   logic [63:0] 	mem_read1_rev;   

   logic [31:0] 	mem_out0_rev;
   logic [31:0] 	mem_out1_rev;

   logic [63:0] 	final_write_data;
   logic [63:0] 	final_write_data_rev;
   logic [31:0] 	mem_in0_rev;
 -----/\----- EXCLUDED -----/\----- */
   logic 		offset0, offset1, offset2, offset3;
   logic 		size4, size2, size1, size4_or2;
   logic 		s0_sel;
   logic [1:0] 		s1_sel, s2_sel;
   logic [2:0] 		s3_sel;
   logic [1:0] 		s4_sel, s5_sel;
   logic 		s6_sel;
   
   logic [7:0] 		mem_read0_byte0;
   logic [7:0] 		mem_read0_byte1;
   logic [7:0] 		mem_read0_byte2;
   logic [7:0] 		mem_read0_byte3;
   logic [7:0] 		mem_read0_byte4;
   logic [7:0] 		mem_read0_byte5;
   logic [7:0] 		mem_read0_byte6;
   logic [7:0] 		mem_read0_byte7;


   logic [7:0] 		mem_read1_byte0;
   logic [7:0] 		mem_read1_byte1;
   logic [7:0] 		mem_read1_byte2;
   logic [7:0] 		mem_read1_byte3;
   logic [7:0] 		mem_read1_byte4;
   logic [7:0] 		mem_read1_byte5;
   logic [7:0] 		mem_read1_byte6;
   logic [7:0] 		mem_read1_byte7;
   
   logic [7:0] 		mem_write0_byte0;
   logic [7:0] 		mem_write0_byte1;
   logic [7:0] 		mem_write0_byte2;
   logic [7:0] 		mem_write0_byte3;

   logic [7:0] 		final_write_byte0;
   logic [7:0] 		final_write_byte1;
   logic [7:0] 		final_write_byte2;
   logic [7:0] 		final_write_byte3;
   logic [7:0] 		final_write_byte4;
   logic [7:0] 		final_write_byte5;
   logic [7:0] 		final_write_byte6;
   logic [7:0] 		final_write_byte7;

   // preload
   initial begin
      if (PRELOAD_EN == 1) begin
	 $readmemh(PRELOAD_FILE, RAM);
      end
   end   

   // Read memory : our internal memory is word addressed, 
   // but we can have byte aligned memory access.
   // to make this work we will read the desired address 
   // and desired addres + 1.
   // Then using a mux we can select slices of the two reads.

   // Because we can read unaligned we have to read two words.
   // The data is stored big endian.
   assign {mem_read0_byte0, mem_read0_byte1, mem_read0_byte2, mem_read0_byte3} = RAM[mem_addr0[31:2]];
   assign {mem_read0_byte4, mem_read0_byte5, mem_read0_byte6, mem_read0_byte7} = RAM[mem_addr0[31:2]+1];

   // The bus back to the cpu is little endian.
   mux4 #(32) mem_read0_mux(.d0({mem_read0_byte3, mem_read0_byte2, mem_read0_byte1, mem_read0_byte0}),
			    .d1({mem_read0_byte4, mem_read0_byte3, mem_read0_byte2, mem_read0_byte1}),
			    .d2({mem_read0_byte5, mem_read0_byte4, mem_read0_byte3, mem_read0_byte2}),
			    .d3({mem_read0_byte6, mem_read0_byte5, mem_read0_byte4, mem_read0_byte3}),
			    .s(mem_addr0[1:0]),
			    .y(mem_out0));


   assign {mem_read1_byte0, mem_read1_byte1, mem_read1_byte2, mem_read1_byte3} = RAM[mem_addr1[31:2]];
   assign {mem_read1_byte4, mem_read1_byte5, mem_read1_byte6, mem_read1_byte7} = RAM[mem_addr1[31:2]+1];

   // The bus back to the cpu is little endian.
   mux4 #(32) mem_read1_mux(.d0({mem_read1_byte3, mem_read1_byte2, mem_read1_byte1, mem_read1_byte0}),
			    .d1({mem_read1_byte4, mem_read1_byte3, mem_read1_byte2, mem_read1_byte1}),
			    .d2({mem_read1_byte5, mem_read1_byte4, mem_read1_byte3, mem_read1_byte2}),
			    .d3({mem_read1_byte6, mem_read1_byte5, mem_read1_byte4, mem_read1_byte3}),
			    .s(mem_addr1[1:0]),
			    .y(mem_out1));
   
   
/* -----\/----- EXCLUDED -----\/-----
   assign mem_out0 = {mem_out0_rev[0*8+7:0*8], 
		      mem_out0_rev[1*8+7:1*8], 
		      mem_out0_rev[2*8+7:2*8], 
		      mem_out0_rev[3*8+7:3*8]};
 -----/\----- EXCLUDED -----/\----- */
   
/* -----\/----- EXCLUDED -----\/-----
   assign mem_out1 = {mem_out1_rev[0*8+7:0*8], 
		      mem_out1_rev[1*8+7:1*8], mem_out1_rev[2*8+7:2*8], 
		      mem_out1_rev[3*8+7:3*8]};    
 -----/\----- EXCLUDED -----/\----- */

   // Write memory
   // step 1 we need to read the data first, which we already did.
   // step 2 merge together the write data with the read data.
   // step 3 write the new values to memory.

   // split the write data into its bytes
   assign mem_write0_byte0 = mem_in0[0*8+7:0*8];
   assign mem_write0_byte1 = mem_in0[1*8+7:1*8];
   assign mem_write0_byte2 = mem_in0[2*8+7:2*8];
   assign mem_write0_byte3 = mem_in0[3*8+7:3*8];
   

   // break apart the busses by byte.
   // intermediate signals
   assign offset0 = ~mem_addr0[0] & ~mem_addr0[1];
   assign offset1 = mem_addr0[0] & ~mem_addr0[1];
   assign offset2 = ~mem_addr0[0] & mem_addr0[1];      
   assign offset3 = mem_addr0[0] & mem_addr0[1];
   assign size4 = ~mem_size0[0] & mem_size0[1];
   assign size2 = mem_size0[0] & ~mem_size0[1];
   assign size1 = ~mem_size0[0] & ~mem_size0[1];
   
   assign s0_sel = offset0;
   assign s1_sel[0] = offset1;
   assign s1_sel[1] = offset0 & (size4 | size2);
   assign s2_sel[0] = offset2 | (size4 & offset0);
   assign s2_sel[1] = (offset1 & size2) | (offset0 & size4) | (offset1 & size4);

   assign s3_sel[0] = offset3 | (offset1 & size4);
   assign s3_sel[1] = (offset2 & size2) | (offset1 & size4) | (offset2 & size4);
   assign s3_sel[2] = offset0 & size4;

   assign s4_sel[0] = (size2 & offset3) | (size4 & offset1) | (size4 & offset3);
   assign s4_sel[1] = (size4 & offset1) | (size4 & offset2);

   assign s5_sel[0] = (size4 & offset3);
   assign s5_sel[1] = (size4 & offset2);
   assign s6_sel = size4 & offset3;

   // *** IMPORTANT
   // when we write into the memory it is big endian.
   
   // byte0 can get r0 when mem_addr0[1:0] == 00 else w0

   mux2 #(8) write_data0_mux(.d0(mem_read0_byte0),
			     .d1(mem_write0_byte0),
			     .s(s0_sel),
			     .y(final_write_byte0));

   // byte1 = w0 if offset == 1 (select 01),
   //         w1 if offset == 0 & size == 4 or 2 (select 10),
   //    else r1 (select 00)
   
   mux3 #(8) write_data1_mux(.d0(mem_read0_byte1),
			     .d1(mem_write0_byte0),
			     .d2(mem_write0_byte1),
			     .s(s1_sel),
			     .y(final_write_byte1));
   

   // byte2 = w0 if offset == 2 (select 01),
   //         w1 if offset == 1 & size == 4 or 2 (select 10),
   //         w2 if offset == 0 ^ size == 4 (select 11),
   //    else r2 (select 00)
   
   mux4 #(8) write_data2_mux(.d0(mem_read0_byte2),
			     .d1(mem_write0_byte0),
			     .d2(mem_write0_byte1),
			     .d3(mem_write0_byte2),
			     .s(s2_sel),
			     .y(final_write_byte2));

   // byte3 = w0 if offset == 3 (select 001),
   //         w1 if offset == 2 & size == 4 or 2 (select 010),
   //         w2 if offset == 1 ^ size == 4 (select 011),
   //         w3 if offset == 0 ^ size == 4 (select 100),   
   //    else r3 (select 000)
   
   mux5 #(8) write_data3_mux(.d0(mem_read0_byte3),
			     .d1(mem_write0_byte0),
			     .d2(mem_write0_byte1),
			     .d3(mem_write0_byte2),
			     .d4(mem_write0_byte3),
			     .s(s3_sel),
			     .y(final_write_byte3));

   // byte4 = w1 if offset == 3 & size == 4 or 2 (select 01),
   //         w2 if offset == 2 & size == 4 (select 10),
   //         w3 if offset == 1 & size == 4 (select 11),
   //    else r4 (select 00)

   mux4 #(8) write_data4_mux(.d0(mem_read0_byte4),
			     .d1(mem_write0_byte1),
			     .d2(mem_write0_byte2),
			     .d3(mem_write0_byte3),
			     .s(s4_sel),
			     .y(final_write_byte4));

   // byte5 = w2 if offset == 3 & size == 4 (select 01),
   //         w3 if offset == 2 & size == 4 (select 10),
   //    else r5 (select 00)
   
   mux3 #(8) write_data5_mux(.d0(mem_read0_byte5),
			     .d1(mem_write0_byte2),
			     .d2(mem_write0_byte3),
			     .s(s5_sel),
			     .y(final_write_byte5));
   
   // byte6 = w3 if offset == 3 & size == 4 (select 1),
   //    else r6 (select 00)
   
   mux2 #(8) write_data6_mux(.d0(mem_read0_byte6),
			     .d1(mem_write0_byte3),
			     .s(s6_sel),
			     .y(final_write_byte6));

   // byte7 = r7
   assign final_write_byte7 = mem_read0_byte7;

/* -----\/----- EXCLUDED -----\/-----
   mux4 #(64) write_data_mux(.d0({mem_read0_p1, mem_in0_rev}),
			     .d1({mem_read0_p1[3*8+7:1*8], mem_in0_rev, mem_read0[0*8+7:0*8]}),
			     .d2({mem_read0_p1[3*8+7:2*8], mem_in0_rev, mem_read0[1*8+7:0*8]}),
			     .d3({mem_read0_p1[3*8+7:3*8], mem_in0_rev, mem_read0[2*8+7:0*8]}),
			     .s(mem_addr0[1:0]),
			     .y({final_write_data_p1, final_write_data}));
 -----/\----- EXCLUDED -----/\----- */

   // this is big endian

   always @(posedge clk) 
   begin
     if (r_w_0) begin
	RAM[mem_addr0[31:2]] <= {final_write_byte0, final_write_byte1, final_write_byte2, final_write_byte3};
	RAM[mem_addr0[31:2]+1] <= {final_write_byte4, final_write_byte5, final_write_byte6, final_write_byte7};
     end
   end

endmodule // memory
