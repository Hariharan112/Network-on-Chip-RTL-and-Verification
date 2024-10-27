`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2018 04:00:56 PM
// Design Name: 
// Module Name: falling_edge_pulse_generator
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module falling_edge_pulse_generator(reset,gnt,clk,q0);

input reset,gnt;
input clk;
output q0;
	
	wire q1;
	wire  high;
reg not_gnt;
reg d0_reset;
	
/*		
always@(negedge gnt)
begin	
//d0_reset=(reset|q1);
not_gnt=(!gnt);
end
*/
always@(*)
begin	
d0_reset=(reset|q1);
not_gnt=(!gnt);
end


//assign not_gnt=(!gnt);
//assign d0_reset=(reset|q1);

            
                    dff_asynch_clr d00 (.d(1'b1),
                    .clr(d0_reset),
                    .clk(not_gnt),
                    .q(q0));
                    
                    dff_asynch_clr d11(.d(q0),
                    .clr(reset),
                    .clk(clk),
                    .q(q1));
                                	
	
	
endmodule
