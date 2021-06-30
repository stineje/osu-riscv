module datapath(input  logic	    clk, reset,
		input logic [31:0]  instrF,
		output logic [31:0] instrD,
		input logic [2:0]   immD,
		output logic [31:0] pcF,
		input logic 	    pcaddD, pcextD,
		input logic 	    ISRselF,
		input logic [31:0]  ISR,
		input logic 	    unsignD,
		output logic 	    gtD, ltD, eqD,
		input logic [3:0]   alucontrolE,
		input logic 	    alusrcE, storepcW, sltunsignedE,
		input logic 	    auipc_cntrlE,
		input logic [1:0]   shtypeE,
		input logic 	    alu2srcE,
		input logic 	    memtoregE, memtoregM, memtoregW,
		input logic 	    regwriteE, regwriteM, regwriteW,
		output logic [31:0] aluoutM, writedataM4,
		input logic [31:0]  readdataM,
		input logic 	    suspendW, suspendE,
		input logic 	    branchD,
		output logic 	    flushE,
		input logic 	    pcsrcD,
		input logic 	    jrD, jrE, jumpW,
		input logic 	    regdstE,
		input logic 	    lhM, lbM, lhuM, lbuM,
		input logic 	    memwriteM);

   logic [31:0] 		    pcjalrD;
   logic [31:0] 		    pcnextF, pcnext2F;
   logic [31:0] 		    pctoregD, pctoregE, pctoregM, pctoregW;   
   logic [31:0] 		    srca2D, srca3D, srcaE, srca2E, srcbE, srca3E;
   logic [31:0] 		    resultW, resultRFin;
   logic [31:0] 		    shoutputE;
   logic 			    compA, compB;
   logic [31:0] 		    pcISRin, pcext_immD, pcext_immE;
   logic [31:0] 		    SEPC;
   
   logic [31:0] 		    signimmD;
   logic [31:0] 		    pcplus4F, pcplus4D;   
   logic 			    forwardaD, forwardbD;
   logic [1:0] 			    forwardaE, forwardbE;
   logic 			    forwardcF;   
   logic 			    stallF, stallD;
   logic [4:0] 			    rs1D, rs1E;
   logic [4:0] 			    rs2D, rs2E;   
   logic [4:0] 			    rdD, rdE, rdM, rdW;
   logic [31:0] 		    aluoutW;
   logic [31:0] 		    aluout2E, aluout3E;
   logic [31:0] 		    writedataD, writedata2D, writedataE, writedata2E;
   logic [31:0] 		    readdataW;   
   logic [31:0] 		    pcD;
   logic [31:0] 		    pcE;
   logic [31:0] 		    instrE;   
   logic [4:0] 			    rs1;
   logic 			    zero;
   logic [31:0] 		    pcimm_sumD;
   logic [31:0] 		    readdataM2, readdataM3, readdataM4;   
   logic [31:0] 		    writedataM, writedataM2, writedataM3;
   logic [31:0] 		    pcnext2F_temp;
   logic 			    real_flushD;
   

   // HDU (can probably go in riscv.sv (cpu_top) to improve readability)
   hazard    h(.rs1D(rs1D), .rs2D(rs2D), .rs1E(rs1E), .rs2E(rs2E), 
	       .rdD(rdD), .rdE(rdE), .rdM(rdM), .rdW(rdW), 
               .regwriteE(regwriteE), .regwriteM(regwriteM), 
	       .regwriteW(regwriteW), .memtoregE(memtoregE), 
	       .memtoregM(memtoregM), .branchD(branchD), 
	       .forwardaD(forwardaD), .forwardbD(forwardbD), 
	       .forwardaE(forwardaE), .forwardbE(forwardbE),
               .stallF(stallF), .stallD(stallD), .flushE(flushE), .flushD(real_flushD),
	       .pcsrcD(pcsrcD), .jumpW(jumpW), .jrD(jrD), .jrE(jrE),
	       .forwardcF(forwardcF));

   // PC Next Adder PC+4
   adder pcadder(.a(pcF), .b(32'b100), .y(pcplus4F));
   // Branch Mux   
   mux2 #(32) pcmux(.d0(pcplus4F), .d1(pcimm_sumD), .s(pcsrcD), .y(pcISRin));   
   // ISR mux
   mux2 #(32) ISRmux(.d0(pcISRin), .d1(ISR), .s(ISRselF), .y(pcnextF));

   // Fetch forwarding for branch change due to jr (FIXME)
   mux2 #(32)  forwardcfmux(.d0(pcnextF), .d1(pctoregM), .s(forwardcF), .y(pcnext2F_temp));

   // when executing a jalr or jr instruction.  The nextpc will be the sum of imm and
   // a register from the register file.  The alu already computes this sum so all we
   // need to do is change the next pc to be this value.
   mux2 #(32) jalr_pc_mux(.d0(pcnext2F_temp), .d1(aluout2E), .s(jrE), .y(pcnext2F));
   
   // IF stage
   flopenr #(32) pcreg(.clk(clk), .reset(reset), .en(~stallF), .d(pcnext2F), .q(pcF));
   
   // Flush ID instrF if branch or jump (control hazard)
   assign flushD = pcsrcD | real_flushD;
   // ID stage
   flopenrc #(32) r1D(.clk(clk), .reset(reset), .en(~stallD), .clear(flushD), 
		      .d(instrF), .q(instrD));
   flopenrc #(32) r2D(.clk(clk), .reset(reset), .en(~stallD), .clear(flushD), 
		      .d(pcF),  .q(pcD));
   flopenrc #(32) r3D(.clk(clk), .reset(reset), .en(~stallD), .clear(flushD),  
		      .d(pcplus4F), .q(pcplus4D));

   // need to read a zero on rs1 for lui to work.
   mux2 #(5) rs1mux(.d0(instrD[19:15]), .d1(5'b00000), .s(immD[2]), .y(rs1));
   mux2 #(32) pcmux2(.d0(pcimm_sumD), .d1(pcplus4D), .s(pcsrcD), .y(pctoregD));
   mux2 #(32) storepcmux(.d0(resultW), .d1(pctoregW), .s(storepcW), .y(resultRFin)); 

   // register (RF) logic
   regfile rf (.clk(clk), .we3(regwriteW), .ra1(rs1), .ra2(instrD[24:20]), 
	       .wa3(rdW), .wd3(resultRFin), .rd1(srca2D), .rd2(writedataD));

   // Sign Extension (Immediate)
   signext se(.a(instrD[31:0]), .sel(immD), .y(signimmD));
   // Forwarding for Decode
   mux2 #(32)  forwardadmux(.d0(srca2D), .d1(aluoutM), .s(forwardaD), .y(srca3D));
   mux2 #(32)  forwardbdmux(.d0(writedataD), .d1(aluoutM), .s(forwardbD), .y(writedata2D));

   // FIXME: May move comparator to EX later if too slow
   assign compA = srca3D[31] ^ ~unsignD;
   assign compB = writedata2D[31] ^ ~unsignD; 
   // Comparator (for beq, bge, blt, beq)
   magcompare32 compare (.GT(gtD), .LT(ltD), .EQ(eqD), .A({compA, srca3D[30:0]}), 
			 .B({compB, writedata2D[30:0]}));

   // Shifting immediate for PC (move to ID to compute earlier)
   mux2 #(32) pcextmux(.d0(signimmD), .d1({signimmD[30:0], 1'b0}),
                       .s(pcextD), .y(pcext_immD));   
   // ALU PC/imm mux
   mux2 #(32) pcsrcmux(.d0(srca2D), .d1(pcD), .s(pcaddD), .y(pcjalrD));
   // PC imm Adder PC + imm
   adder pcimm(.a(pcjalrD), .b(pcext_immD), .y(pcimm_sumD));   

   // HDU (to know what is being allocated)
   assign rs1D = rs1;
   assign rs2D = instrD[24:20];
   assign rdD = instrD[11:7];

   // EX stage (probably not all signals need to be flushed)
   floprc #(32) r1E(.clk(clk), .reset(reset), .clear(flushE), .d(srca2D), .q(srcaE));
   floprc #(32) r2E(.clk(clk), .reset(reset), .clear(flushE), .d(writedataD), .q(writedataE));   
   floprc #(32) r3E(.clk(clk), .reset(reset), .clear(flushE), .d(pcext_immD), .q(pcext_immE));
   flopenrc #(32) r4E(.clk(clk), .reset(reset), .en(suspendE), .clear(flushE), .d(pcD), .q(SEPC));
   floprc #(5)  r5E(.clk(clk), .reset(reset), .clear(flushE), .d(rs1D), .q(rs1E));
   floprc #(5)  r6E(.clk(clk), .reset(reset), .clear(flushE), .d(rs2D), .q(rs2E));
   floprc #(5)  r7E(.clk(clk), .reset(reset), .clear(flushE), .d(rdD), .q(rdE));
   floprc #(32) r8E(.clk(clk), .reset(reset), .clear(flushE), .d(pctoregD), .q(pctoregE));

   floprc #(32) pcE_reg(.clk(clk),
			.reset(reset),
			.clear(1'b0),
			.d(pcD),
			.q(pcE));

   floprc #(32) instrE_reg(.clk(clk),
			   .reset(reset),
			   .clear(flushE),
			   .d(instrD),
			   .q(instrE));
   

   // Forwarding for Execute
   mux4 #(32)  forwardaemux(.d0(srcaE), .d1(resultW), .d2(aluoutM), .d3(pctoregW), .s(forwardaE), .y(srca2E));
   mux4 #(32)  forwardbemux(.d0(writedataE), .d1(resultW), .d2(aluoutM), .d3(pctoregW), .s(forwardbE), .y(writedata2E));

   // auipc
   // need to set the a input of the alu to pcE.
   mux2 #(32) auipc_mux(.d0(srca2E), .d1(pcE), .s(auipc_cntrlE), .y(srca3E));

   // ALU mem/imm mux
   mux2 #(32) memsrcmux(.d0(writedata2E), .d1(pcext_immE), .s(alusrcE), .y(srcbE));   
   // ALU
   alu alu (.a(srca3E), .b(srcbE), .alucont(alucontrolE), .sltunsigned(sltunsignedE),
            .result(aluout2E), .zero(zero));
   // Shifter
   shifter shift (.a(srca3E), .shamt(srcbE[4:0]), .shtype(shtypeE), .y(shoutputE));
   // Choose ALU or Shifter output
   mux2 #(32) srccmux(.d0(aluout2E), .d1(shoutputE), .s(alu2srcE), .y(aluout3E));   
   
   // MEM stage (data comes from top in memory)
   flopr #(32) r1M(.clk(clk), .reset(reset), .d(writedata2E), .q(writedataM));
   flopr #(32) r2M(.clk(clk), .reset(reset), .d(aluout3E), .q(aluoutM));
   flopr #(5)  r3M(.clk(clk), .reset(reset), .d(rdE), .q(rdM));
   flopr #(32) r4M(.clk(clk), .reset(reset), .d(pctoregE), .q(pctoregM));

   // lw/lh/lb
   mux3 #(32) halfbytemux1(.d0(readdataM), 
			   .d1({{16{readdataM[15]&~lhuM}}, readdataM[15:0]}), 
			   .d2({{24{readdataM[7]&~lbuM}}, readdataM[7:0]}), 
			   .s({lbM, lhM} & {2{~memwriteM}}), .y(readdataM4));
   // sw/sh/sb
   mux3 #(32) halfbytemux2(.d0(writedataM), 
			   .d1({16'h0, writedataM[15:0]}), 
			   .d2({24'h0, writedataM[7:0]}), 
			   .s({lbM, lhM} & {2{memwriteM}}), .y(writedataM4)); 
   // WB stage
   flopr #(32) r1W(.clk(clk), .reset(reset), .d(aluoutM), .q(aluoutW));
   flopr #(32) r2W(.clk(clk), .reset(reset), .d(readdataM4), .q(readdataW));
   flopr #(5)  r3W(.clk(clk), .reset(reset), .d(rdM), .q(rdW));
   flopr #(32) r4W(.clk(clk), .reset(reset), .d(pctoregM), .q(pctoregW));

   // Memory Output (ALU/Shifter or memory) for WB
   mux2 #(32) resmux(.d0(aluoutW), .d1(readdataW), .s(memtoregW), .y(resultW));
   
endmodule // datapath
