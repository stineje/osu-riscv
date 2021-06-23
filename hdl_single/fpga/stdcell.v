module PADINC (YPAD, DI);
input  YPAD ;
output DI ;

   buf (DI, YPAD);

endmodule

module PADINOUT (DO, OEN, DI, YPAD);
input  DO ;
input  OEN ;
output DI ;
inout  YPAD ;

   bufif1 (YPAD, DO, OEN);
   buf (DI, YPAD);

endmodule

module PADOUT (DO, YPAD);
input  DO ;
output YPAD ;

   buf (YPAD, DO);
endmodule
