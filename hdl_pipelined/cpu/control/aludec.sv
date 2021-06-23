module aludec (input logic        funct7b,
	       input logic [2:0]  funct3,
               input logic [2:0]  aluop,
               output logic [3:0] alucontrol,
	       output logic [1:0] shtype,
	       output logic 	  alu2src,
	       output logic 	  sltunsigned,
	       output logic 	  lh, lb, lhu, lbu);
   
   always_comb
     case(aluop)
       3'b000:
         begin
            casex({funct7b, funct3})
              // slli
              4'b0001: 
		begin
		   alucontrol <= 4'b0010; 
		   shtype <= 2'b00;
		   alu2src <= 1'b1;
		   sltunsigned <= 1'b0;
		   lh <= 1'b0;
		   lb <= 1'b0;
		   lhu <= 1'b0;
		   lbu <= 1'b0;
		end
              // srli
              4'b0101:
		begin
		   alucontrol <= 4'b0010; 
		   shtype <= 2'b01;
		   alu2src <= 1'b1;
		   sltunsigned <= 1'b0;
		   lh <= 1'b0;
		   lb <= 1'b0;		   		   
		   lhu <= 1'b0;
		   lbu <= 1'b0;
		end
            // andi
              4'b?111:
		begin
                   alucontrol <= 4'b0000;
                   shtype <= 2'b00;
                   alu2src <= 1'b0;
		   sltunsigned <= 1'b0;
		   lh <= 1'b0;
		   lb <= 1'b0;		   		   
		   lhu <= 1'b0;
		   lbu <= 1'b0;		   		   		   
		end
              // xori
              4'b?100:
		begin
                   alucontrol <= 4'b1000;
                   shtype <= 2'b00;
                   alu2src <= 1'b0;
		   sltunsigned <= 1'b0;
		   lh <= 1'b0;
		   lb <= 1'b0;		   		   
		   lhu <= 1'b0;
		   lbu <= 1'b0;		   		   		   
		end	      
              // ori
              4'b?110:
		begin
                   alucontrol <= 4'b0001;
                   shtype <= 2'b00;
                   alu2src <= 1'b0;
		   sltunsigned <= 1'b0;
		   lh <= 1'b0;
		   lb <= 1'b0;		   		   
		   lhu <= 1'b0;
		   lbu <= 1'b0;		   		   		   
		end
              //slti
              4'b?010:
		begin
                   alucontrol <= 4'b0111;
                   alu2src <= 1'b0;
                   shtype <= 2'b00;
                   sltunsigned <= 1'b0;
		   lh <= 1'b0;
		   lb <= 1'b0;
		   lhu <= 1'b0;
		   lbu <= 1'b0;		   		   		   
		end
              // srai
              4'b1101:
		begin
                   alucontrol <= 4'b0010;
                   shtype <= 2'b10;
                   alu2src <= 1'b1;
		   sltunsigned <= 1'b0;
		   lh <= 1'b0;
		   lb <= 1'b0;
		   lhu <= 1'b0;
		   lbu <= 1'b0;		   		   		   
		end
              // sltiu
              4'b?011:
		begin
                   alucontrol <= 4'b0111;
                   alu2src <= 1'b0;
                   shtype <= 2'b00;
                   sltunsigned <= 1'b1;
		   lh <= 1'b0;
		   lb <= 1'b0;
		   lhu <= 1'b0;
		   lbu <= 1'b0;		   		   		   
		end
	      // Handle other immediates
              default: 
		begin
		   alucontrol <= 4'b0010; 
		   shtype <= 2'b00;
		   alu2src <= 1'b0;
		   sltunsigned <= 1'b0;
		   lh <= 1'b0;
		   lb <= 1'b0;
		   lhu <= 1'b0;
		   lbu <= 1'b0;		   		   		   
		end	      
            endcase // casex ({funct7b, funct3})	    
         end // case: 3'b000
       // lw/sw ; lh/sh ; lb/sb
       3'b100:
	 case(funct3)
	   // lb/sb
	   3'b000:
	     begin
		alucontrol <= 4'b0010; 
		shtype <= 2'b00;
		alu2src <= 1'b0;
		sltunsigned <= 1'b0;
		lh <= 1'b0;
		lb <= 1'b1;
		lhu <= 1'b0;
		lbu <= 1'b0;		   		   		
	     end	   
	   // lh/sh
	   3'b001:
	     begin
		alucontrol <= 4'b0010; 
		shtype <= 2'b00;
		alu2src <= 1'b0;
		sltunsigned <= 1'b0;
		lh <= 1'b1;
		lb <= 1'b0;
		lhu <= 1'b0;
		lbu <= 1'b0;		   		   		
	     end
	   // lw/sw
	   3'b010:		
	     begin
		alucontrol <= 4'b0010; 
		shtype <= 2'b00;
		alu2src <= 1'b0;
		sltunsigned <= 1'b0;
		lh <= 1'b0;
		lb <= 1'b0;	
		lhu <= 1'b0;
		lbu <= 1'b0;		   		   		
	     end 
	   // lbu/sbu
	   3'b100:
	     begin
		alucontrol <= 4'b0010; 
		shtype <= 2'b00;
		alu2src <= 1'b0;
		sltunsigned <= 1'b0;
		lh <= 1'b0;
		lb <= 1'b1;
		lhu <= 1'b0;
		lbu <= 1'b1;		
	     end	   	   
	   // lhu/swu
	   3'b101:		
	     begin
		alucontrol <= 4'b0010; 
		shtype <= 2'b00;
		alu2src <= 1'b0;
		sltunsigned <= 1'b0;
		lh <= 1'b1;
		lb <= 1'b0;
		lhu <= 1'b1;
		lbu <= 1'b0;		   		   				
	     end	   
	   default:
	     begin
		alucontrol <= 4'b0000;     
		alu2src <= 1'b0;
		shtype <= 2'b00;
		sltunsigned <= 1'b0;
		lh <= 1'b0;
		lb <= 1'b0;
		lhu <= 1'b0;
		lbu <= 1'b0;		   		   						
	     end       	     
	 endcase
       // R-type       
       3'b010:
	 case({funct7b, funct3})
	   // add
	   4'b0000: 
	     begin
	        alucontrol <= 4'b0010;     
	        alu2src <= 1'b0;
  		shtype <= 2'b00;
		sltunsigned <= 1'b0;
		lh <= 1'b0;
		lb <= 1'b0;
		lhu <= 1'b0;
		lbu <= 1'b0;		   		   						
	     end
	   // sll
	   4'b0001: 
	     begin
	        alucontrol <= 4'b0010;     
		alu2src <= 1'b1;
  	        shtype <= 2'b00;
		sltunsigned <= 1'b0;
		lh <= 1'b0;
		lb <= 1'b0;
		lhu <= 1'b0;
		lbu <= 1'b0;		   		   						
	     end
	   // xor
	   4'b0100: 
	     begin
	        alucontrol <= 4'b1000;     
	        alu2src <= 1'b0;
  		shtype <= 2'b00;
		sltunsigned <= 1'b0;
		lh <= 1'b0;
		lb <= 1'b0;
		lhu <= 1'b0;
		lbu <= 1'b0;		   		   						
	     end	   
	   // srl
	   4'b0101: 
	     begin
	        alucontrol <= 4'b0010;     
	        alu2src <= 1'b1;
  	        shtype <= 2'b01;
		sltunsigned <= 1'b0;
		lh <= 1'b0;
		lb <= 1'b0;
		lhu <= 1'b0;
		lbu <= 1'b0;		   		   						
	     end
	   // sra
	   4'b1101: 
	     begin
	        alucontrol <= 4'b0010;     
	        alu2src <= 1'b1;
  	        shtype <= 2'b10;
		sltunsigned <= 1'b0;
		lh <= 1'b0;
		lb <= 1'b0;
		lhu <= 1'b0;
		lbu <= 1'b0;		   		   						
	     end
	   // sub
	   4'b1000:
	     begin
	        alucontrol <= 4'b0110;     
	        alu2src <= 1'b0;
  		shtype <= 2'b00;	       
		sltunsigned <= 1'b0;
		lh <= 1'b0;
		lb <= 1'b0;
		lhu <= 1'b0;
		lbu <= 1'b0;		   		   						
	     end
	   // and
	   4'b0111:
	     begin
	        alucontrol <= 4'b0000;     
	        alu2src <= 1'b0;
  	        shtype <= 2'b00;	       
		sltunsigned <= 1'b0;
		lh <= 1'b0;
		lb <= 1'b0;
		lhu <= 1'b0;
		lbu <= 1'b0;		   		   						
	     end
	   // or
	   4'b0110: 
	     begin
	        alucontrol <= 4'b0001;     
	        alu2src <= 1'b0;
  	        shtype <= 2'b00;	       
		sltunsigned <= 1'b0;
		lh <= 1'b0;
		lb <= 1'b0;
		lhu <= 1'b0;
		lbu <= 1'b0;		   		   						
	     end
	   // slt
	   4'b0010:
	     begin
	        alucontrol <= 4'b0111;     
	        alu2src <= 1'b0;
  	        shtype <= 2'b00;	       
		sltunsigned <= 1'b0;
		lh <= 1'b0;
		lb <= 1'b0;
		lhu <= 1'b0;
		lbu <= 1'b0;		   		   						
	     end
	   // sltu
	   4'b0011:
	     begin
	        alucontrol <= 4'b0111;     
	        alu2src <= 1'b0;
  	        shtype <= 2'b00;	       
		sltunsigned <= 1'b1;
		lh <= 1'b0;
		lb <= 1'b0;
		lhu <= 1'b0;
		lbu <= 1'b0;		   		   						
	     end
	   // ???
	   default:
	     begin
	        alucontrol <= 4'b0000;     
	        alu2src <= 1'b0;
	        shtype <= 2'b00;
		sltunsigned <= 1'b0;
		lh <= 1'b0;
		lb <= 1'b0;
		lhu <= 1'b0;
		lbu <= 1'b0;		   		   						
	     end
	 endcase // case ({funct7b, funct3})
       // ???
       default:
	 begin
	    alucontrol <= 4'b0000;     
	    alu2src <= 1'b0;
	    shtype <= 2'b00;
	    sltunsigned <= 1'b0;
	    lh <= 1'b0;
	    lb <= 1'b0;
	    lhu <= 1'b0;
	    lbu <= 1'b0;		   		   					    
	 end       
     endcase // case (aluop)

endmodule // aludec
