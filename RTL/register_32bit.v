
`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////

module register_32bit(din, clk, clr, ce, dout);
    input [31:0] din ;
    input clk ;
    input clr ;
    input ce ;
    output [31:0] dout ;

	 reg [31:0] dout ;
    
	 always @(clr,ce,din)
	 begin
	 		   if(clr)
                                    dout <= 32'b01100000000000000000000000000000 ;	
                                    
               else if (ce)
                                  dout <= din ;                     	
	 end

endmodule
