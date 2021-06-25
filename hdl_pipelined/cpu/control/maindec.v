module maindec (input  [6:0] op,
		output 	     memtoreg, memwrite,
		output 	     branch, alusrc,
		output 	     regwrite,
		output 	     storepc,
		output 	     pcadd,
		output 	     pcext,
		output [2:0] imm,
		output [2:0] aluop,
		output 	     auipc_cntrl,
		output 	     memread,
		output 	     suspend,
		output 	     jump, jr,
		output 	     regdst);
   
   reg [19:0] 		     controls;

   assign {memread, auipc_cntrl, pcadd, pcext, suspend, regwrite, alusrc,
           branch, memwrite,
           memtoreg, storepc, aluop, imm, jump, regdst, jr} = controls;

   always @(*)
     case(op)
       7'b011_0011: controls <= 20'b00000100_000_010_000_010; // R
       7'b000_0011: controls <= 20'b10000110_010_100_000_010; // LW/LH
       7'b010_0011: controls <= 20'b00000010_100_100_001_000; // SW/SH
       7'b110_0011: controls <= 20'b00110011_000_000_010_000; // BXX
       7'b110_1111: controls <= 20'b00110110_001_000_011_100; // JAL/J
       7'b001_0011: controls <= 20'b00000110_000_000_000_010; // ADDI
       7'b011_0111: controls <= 20'b00000110_000_000_100_010; // LUI
       7'b111_0011: controls <= 20'b00001000_000_000_000_000; // ecall/ebreak
       7'b110_0111: controls <= 20'b00000110_001_000_000_101; // JALR/JR
       7'b001_0111: controls <= 20'b01100110_000_000_100_010; // AUIPC
       default:     controls <= 20'b00000000_000_000_000_000; // default
     endcase // case (op)
   
endmodule // maindec
