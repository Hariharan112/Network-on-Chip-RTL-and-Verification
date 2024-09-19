`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/30/2018 09:43:15 PM
// Design Name: 
// Module Name: priority_encoder
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


module priority_encoder(reset,en,in0,in1,in2,in3,out0,out1,out2,out3,clk);
input reset;
input en,in0,in1,in2,in3;
output reg out0,out1,out2,out3;
reg r0,r1,r2,r3;
input clk;

always@(posedge clk)
begin
 r0=in0 & !out1 & !out2 & !out3;
 r1=in1 & !out0 & !out2 & !out3;
 r2=in2 & !out0 & !out1 & !out3;
 r3=in3 & !out0 & !out1 & !out2;

 out0=en & r0;
 out1=en & (!r0) & r1;
 out2=en & (!r0) & (!r1) & r2;
 out3=en & (!r0) & (!r1) & (!r2) & r3;
end

endmodule
