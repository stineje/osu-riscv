module riscv (input logic         clk, reset,
              output logic [31:0] pcF,
              input logic [31:0]  instrF,
              output logic 	  memwriteM,
	      output logic [1:0]  mem_sizeM,
              output logic [31:0] aluoutM, writedataM,
              input logic [31:0]  readdataM,
	      output logic 	  memreadM,
	      output logic 	  suspendW);

   logic 			  memtoregE, memtoregM, memtoregW;
   logic 			  alusrcE;
   logic 			  regwriteE, regwriteM, regwriteW;
   logic 			  branchD, storepcD;
   logic 			  pcaddD, pcextD, unsignE,
				  alu2srcE, sltunsignedE;
   
   logic [3:0] 			  alucontrolE;
   logic [2:0] 			  immD;
   logic 			  ltD, gtD, eqD;
   logic [1:0] 			  shtypeE;
   logic 			  flushE;   

   logic [31:0] 		  instrD;   
   logic [31:0] 		  ISR;
   logic 			  ISRsel; 
   logic 			  suspendE;
   logic 			  pcsrcD;
   logic 			  jrD, jrW;  
   logic 			  regdstE;
   logic 			  lhM, lbM, lhuM, lbuM;
   logic 			  auipc_cntrlE;

   assign ISRsel = 1'b0;
   assign ISR = 32'b0;

   controller c (.op(instrD[6:0]  ), .funct7(instrD[31:25]),
                 .funct3D(instrD[14:12]), 
                 .memtoregE(memtoregE), .memtoregM(memtoregM),
		 .memtoregW(memtoregW), .memwriteM(memwriteM), .mem_sizeM(mem_sizeM),
                 .alusrcE(alusrcE), .regwriteE(regwriteE), 
		 .regwriteM(regwriteM),
		 .regwriteW(regwriteW), .branchD(branchD), 
                 .storepcW(storepcW), .pcaddD(pcaddD),
		 .pcextD(pcextD), .unsignD(unsignD), .immD(immD),
                 .alucontrolE(alucontrolE),
		 .shtypeE(shtypeE), .alu2srcE(alu2srcE),
		 .gtD(gtD), .ltD(ltD), .eqD(eqD),
		 .suspendW(suspendW), .suspendE(suspendE),
		 .auipc_cntrlE(auipc_cntrlE),
		 .sltunsignedE(sltunsignedE),
		 .memreadM(memreadM), .reset(reset),
		 .clk(clk), .flushE(flushE), .pcsrcD(pcsrcD), 
		 .jrD(jrD), .jrE(jrE), .jumpW(jumpW), .regdstE(regdstE), 
		 .lhM(lhM), .lbM(lbM), .lhuM(lhuM), .lbuM(lbuM));
   datapath dp (.clk(clk), .reset(reset), .instrF(instrF),
		.instrD(instrD), .immD(immD), .pcF(pcF), 
		.pcaddD(pcaddD), .pcextD(pcextD),
		.ISR(ISR), .ISRselF(ISRsel),
		.unsignD(unsignD), .gtD(gtD), .ltD(ltD), .eqD(eqD),
                .alucontrolE(alucontrolE),
		.alusrcE(alusrcE), .storepcW(storepcW),
		.auipc_cntrlE(auipc_cntrlE),
		.sltunsignedE(sltunsignedE),
		.shtypeE(shtypeE), .alu2srcE(alu2srcE),
		.memtoregE(memtoregE), .memtoregM(memtoregM),
		.memtoregW(memtoregW), .regwriteE(regwriteE),
		.regwriteM(regwriteM), .regwriteW(regwriteW),
		.aluoutM(aluoutM), .writedataM4(writedataM),
		.readdataM(readdataM), 
		.suspendW(suspendW), .suspendE(suspendE),
		.branchD(branchD), .flushE(flushE), .pcsrcD(pcsrcD), 
		.jrD(jrD), .jrE(jrE), .jumpW(jumpW), .regdstE(regdstE), 
		.lhM(lhM), .lbM(lbM), .lhuM(lhuM), .lbuM(lbuM),
		.memwriteM(memwriteM));

endmodule // riscv
