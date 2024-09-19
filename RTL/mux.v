`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/24/2018 06:57:42 PM
// Design Name: 
// Module Name: mux
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


module mux(t1,t2,t3,t4,t5,t6,t7,t8,t9,t10,t11,t12,t13,t14,t15,t16,sel,m_out,clk);
input t1,t2,t3,t4,t5,t6,t7,t8,t9,t10,t11,t12,t13,t14,t15,t16;
input [3:0] sel;
input clk;
output reg m_out;


   	always@(sel,t1,t2,t3,t4,t5,t6,t7,t8,t9,t10,t11,t12,t13,t14,t15,t16)
//	always@(posedge clk )
	begin
	
	case(sel)
	
    0:m_out<=t1;
    1:m_out<=t2;
    2:m_out<=t3;
    3:m_out<=t4;
    4:m_out<=t5;
    5:m_out<=t6;
    6:m_out<=t7;
    7:m_out<=t8;
    8:m_out<=t9;
    9:m_out<=t10;
    10:m_out<=t11;
    11:m_out<=t12;
    12:m_out<=t13;
    13:m_out<=t14;
    14:m_out<=t15;
    15:m_out<=t16;
	
     
     endcase
     
	end






endmodule
