module controller (input logic [6:0]  op, funct7,
		   input logic [2:0]  funct3D,
                   output logic       memtoregE, memtoregM, memtoregW, memwriteM,
		   output logic [1:0] mem_sizeM,
                   output logic       alusrcE, 
                   output logic       regwriteE, regwriteM, regwriteW,
		   output logic       branchD,
		   output logic       auipc_cntrlE,
		   output logic       jrE,
		   output logic       storepcW,
		   output logic       pcaddD,
		   output logic       pcextD,
		   output logic       unsignD,
		   output logic [2:0] immD,
                   output logic [3:0] alucontrolE,
		   output logic [1:0] shtypeE,
		   output logic       alu2srcE,
		   input logic 	      gtD, ltD, eqD,
		   output logic       suspendW, suspendE,
		   output logic       sltunsignedE,
		   output logic       memreadM,
		   input logic 	      reset,
		   input logic 	      clk,
		   input logic 	      flushE,
		   output logic       pcsrcD,
		   output logic       jumpW, jrD,
		   output logic       regdstE,
		   output logic       lhM, lbM, lhuM, lbuM);

   logic 			      memtoregD;   
   logic [2:0] 			      aluopD;
   logic 			      alu2src_fakeD;
   logic [3:0] 			      alucontrol_fakeD;
   logic 			      regwriteD;
   logic 			      memwriteD;
   logic 			      sltunsignedD;
   logic [3:0] 			      alucontrolD;
   logic 			      alu2srcD;
   logic 			      suspendD, suspendM;
   logic 			      auipc_cntrlD;   
   logic 			      storepc_localD;
   logic 			      regdstD;
   logic 			      storepcD, storepcE, storepcM;
   logic [1:0] 			      shtypeD;
   logic 			      jumpD, jumpE, jumpM;
   logic 			      lhD, lhE;
   logic 			      lbD, lbE;
   logic 			      lhuD, lhuE;
   logic 			      lbuD, lbuE;
   logic [2:0] 			      funct3E, funct3M;
   
      
   maindec md (.op(op), .memtoreg(memtoregD),  .memwrite(memwriteD),
               .branch(branchD), .alusrc(alusrcD), .regwrite(regwriteD),
	       .pcext(pcextD), .pcadd(pcaddD), .storepc(storepc_localD), 
	       .imm(immD), .aluop(aluopD), .auipc_cntrl(auipc_cntrlD),
	       .suspend(suspendD), .memread(memreadM), 
	       .jr(jrD), .jump(jumpD), .regdst(regdstD));
   aludec  ad (.funct7b(funct7[5]), .funct3(funct3D),
               .aluop(aluopD), .alucontrol(alucontrol_fakeD),
	       .alu2src(alu2src_fakeD), .shtype(shtypeD),
	       .sltunsigned(sltunsignedD), 
	       .lh(lhD), .lb(lbD), .lhu(lhuD), .lbu(lbuD));

   mux2 #(1) mx1(.d0(alu2src_fakeD),.d1(1'b0),.s(immD[2]),.y(alu2srcD));
   mux2 #(4) mx2(.d0(alucontrol_fakeD),.d1(4'b0010),.s(immD[2] | branchD),.y(alucontrolD));

   // Move compare decision into ID stage
   assign pcsrcD = (branchD & ~funct3D[2] & ~funct3D[1] & ~funct3D[0] & eqD) | 
		   (branchD & funct3D[2] & ~funct3D[1] & funct3D[0] & ~ltD) | 
		   (branchD & funct3D[2] & ~funct3D[1] & ~funct3D[0] & ltD) | 
		   (branchD & ~funct3D[2] & ~funct3D[1] & funct3D[0] & ~eqD) |
		   (branchD & funct3D[2] & funct3D[1] & ~funct3D[0] & ltD) |
		   (branchD & funct3D[2] & funct3D[1] & funct3D[0] & 
		    (gtD | eqD)) | (storepc_localD);
   assign unsignD = branchD & funct3D[1];
   assign storepcD = storepc_localD | auipc_cntrlD;

   // pipeline registers for control signals
   // (1 + 1 + 1 + 1) + 1 + 2 + (1 + 1 + 1 + 1) + (1 + 1 + 1 + 1 + 1) + 4 = 20
   floprc #(20) regE (clk, reset, flushE,
                      {lbuD, lhuD, lbD, lhD, jumpD, shtypeD, storepcD, regdstD, suspendD, sltunsignedD, memtoregD, memwriteD, alusrcD, alu2srcD, regwriteD, alucontrolD}, 
                      {lbuE, lhuE, lbE, lhE, jumpE, shtypeE, storepcE, regdstE, suspendE, sltunsignedE, memtoregE, memwriteE, alusrcE, alu2srcE, regwriteE, alucontrolE});
   flopr #(10) regM (clk, reset, 
                    {lbuE, lhuE, lbE, lhE, jumpE, storepcE, suspendE, memtoregE, memwriteE, regwriteE},
                    {lbuM, lhuM, lbM, lhM, jumpM, storepcM, suspendM, memtoregM, memwriteM, regwriteM});
   flopr #(5) regW (clk, reset, 
                    {jumpM, storepcM, suspendM, memtoregM, regwriteM},
                    {jumpW, storepcW, suspendW, memtoregW, regwriteW});

   flopr #(1) jrE_reg(.clk(clk),
		      .reset(reset),
		      .d(jrD),
		      .q(jrE));

   flopr #(1) auipc_cntrlE_reg(.clk(clk),
			       .reset(reset),
			       .d(auipc_cntrlD),
			       .q(auipc_cntrlE));

   flopr #(3) funct3E_reg(.clk(clk),
			  .reset(reset),
			  .d(funct3D),
			  .q(funct3E));

   flopr #(3) funct3M_reg(.clk(clk),
			  .reset(reset),
			  .d(funct3E),
			  .q(funct3M));

   assign mem_sizeM = funct3M[1:0];

   
endmodule // controller
