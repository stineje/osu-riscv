`timescale 1ns/1ns
module hazard(input logic [4:0]  rs1D, rs2D, rs1E, rs2E, rdD, rdE, rdM, rdW,
              input logic 	 regwriteE, regwriteM, regwriteW,
              input logic 	 memtoregE, memtoregM, branchD,
              output logic 	 forwardaD, forwardbD,
              output logic [1:0] forwardaE, forwardbE,
              output logic 	 stallF, stallD, flushE, flushD,
	      input logic 	 pcsrcD,
	      input logic 	 jumpW, jrD, jrE,
	      output logic 	 forwardcF);

   logic 			 lwstallD, branchstallD;

   // anytime we get a jrE we need to flush the decode stage.
   assign flushD = jrE;
   
   // forwarding sources to F stage (jr instruction)
   assign forwardcF = jrD & (rdM == rs1D);
   
   // forwarding sources to D stage (branch equality)
   assign forwardaD = (rs1D !=0 & (rs1D == rdM) & regwriteM);
   assign forwardbD = (rs2D !=0 & (rs2D == rdM) & regwriteM);

  // forwarding sources to E stage (ALU)
  always_comb
    begin
       forwardaE = 2'b00; forwardbE = 2'b00;
       if (rs1E != 0)
         if ((rs1E == rdM) & regwriteM & ~jumpW) forwardaE = 2'b10;
         else if ((rs1E == rdW) & ~jumpW & regwriteW) forwardaE = 2'b01;
         else if ((rs1E == rdW) & jumpW & (rdW == 2'b01) & regwriteW) forwardaE = 2'b11;
       if (rs2E != 0)
         if ((rs2E == rdM) & regwriteM & ~jumpW) forwardbE = 2'b10;
         else if ((rs2E == rdW) & ~jumpW & regwriteW) forwardbE = 2'b01;
         else if ((rs2E == rdW) & jumpW & (rdW == 2'b01) & regwriteW) forwardbE = 2'b11;
    end

   // stalls
   assign #1 lwstallD = memtoregE & (rdE == rs1D | rdE == rs2D);
   assign #1 branchstallD = (branchD & regwriteE & (rdE == rs1D | rdE == rs2D)) |
			    (branchD & memtoregM & (rdM == rs1D | rdM == rs2D));
      
   assign #1 stallD = lwstallD | branchstallD;
   assign #1 stallF = stallD; // stalling D stalls all previous stages
   assign #1 flushE = stallD; // stalling D flushes next stage

   // *** not necessary to stall D stage on store if source comes from load;
   // *** instead, another bypass network could be added from W to M

endmodule // hazard

