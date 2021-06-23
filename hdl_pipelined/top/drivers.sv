// Ross Thompson
// October 01, 2019
// Oklahoma State University

// drivers file
// contains the I/O drivers for each port.

module drivers(
	       // pad side	       
	       input 	     clk, 
	       input 	     areset,
	       output 	     suspend,
	       input 	     PROGRAM,
	       // programmer interface (SPI)
	       input 	     sclk,
	       input 	     mosi,
	       output 	     miso,
	       input 	     ss,
	       // MRAM interface
	       output [15:0] maddr,
	       inout [31:0]  mdata,
	       output 	     webar,
	       output 	     rebar,
	       output 	     gclk,
	       output [3:0]  gpo,
	       input [3:0]   gpi,
	       
	       // chip side	       
	       output 	     clk_chip,
	       output 	     areset_chip,
	       input 	     suspend_chip,
	       output 	     PROGRAM_chip,
	       // programmer interface (SPI)
	       output 	     sclk_chip,
	       output 	     mosi_chip,
	       input 	     miso_chip,
	       output 	     ss_chip,
	       // MRAM interface
	       input [15:0]  maddr_chip,
	       input [31:0]  mwd_chip,
	       output [31:0] mrd_chip,
	       input        mdata_oe_chip,
	       input 	     webar_chip,
	       input 	     rebar_chip,
	       input 	     gclk_chip,
	       input [3:0]   gpo_chip,
	       output [3:0]  gpi_chip);
   
   PADINC clk_driver(.YPAD(clk), .DI(clk_chip));
   PADINC areset_driver(.YPAD(areset), .DI(areset_chip));
   PADOUT suspend_driver(.YPAD(suspend), .DO(suspend_chip));
   PADINC PROGRAM_driver(.YPAD(PROGRAM), .DI(PROGRAM_chip));
   PADINC sclk_driver(.YPAD(sclk), .DI(sclk_chip));
   PADINC mosi_driver(.YPAD(mosi), .DI(mosi_chip));
   PADOUT miso_driver(.YPAD(miso), .DO(miso_chip));
   PADINC ss_driver(.YPAD(ss), .DI(ss_chip));

   genvar 		     index;
   generate
      for(index = 0; index < 16; index=index+1) begin : maddr_bit
	 PADOUT maddr_driver(.YPAD(maddr[index]), .DO(maddr_chip[index]));
      end
   endgenerate
   
   generate
      for(index = 0; index < 32; index=index+1) begin : mdata_bit
	 PADINOUT   mdata_driver(.YPAD(mdata[index]), .DO(mwd_chip[index]),
				 .OEN(mdata_oe_chip), .DI(mrd_chip[index]));
      end
   endgenerate
   
   PADOUT webar_driver(.YPAD(webar), .DO(webar_chip));
   PADOUT rebar_driver(.YPAD(rebar), .DO(rebar_chip));
   PADOUT gclk_driver(.YPAD(gclk), .DO(gclk_chip));

   generate
      for(index = 0; index < 4; index=index+1) begin : gpo_bit
	 PADOUT   gpo_driver(.YPAD(gpo[index]), .DO(gpo_chip[index]));
	 PADINC gpi_driver(.YPAD(gpi[index]), .DI(gpi_chip[index]));
      end
   endgenerate
   
endmodule // drivers

