
`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////

module register_1bit(din, reset, clk, clr, ce, dout);
    input din ;
    input clk ;
    input clr ;
    input ce ;
    input reset;
    output reg dout ;

	 //reg dout ;
    
	 /*always @(clk,clr)
	 begin
	 		if(clr | reset)
			dout <= 1'b0;

			else
			begin
					if ( ce )
						dout <=@(posedge clk) din ;
			end
	 end*/
	/* 
	 always @(negedge clr)
	 begin
	   if (clr==0 & !reset)
	     dout=din;
	  end   
*/



always @(posedge clk,posedge reset,posedge clr)
	 begin
	 		if(clr | reset)
			dout <= 1'b0;
			
			else if ( ce )
                                       dout <= din ;

	 end
/*	 
always@(posedge clk)
   begin
   if ( ce )
                           dout <= din ;
   end	 
	*/ 
endmodule

