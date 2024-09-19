`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/20/2018 04:55:25 AM
// Design Name: 
// Module Name: demux_16
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


module demux_16(ip, sel, op1, op2, op3, op4, op5, op6, op7, op8, op9, op10, op11, op12, op13, op14, op15, op16 );

	 input ip;
	 input [3:0] sel;
	 output op1, op2, op3, op4, op5, op6, op7, op8, op9, op10, op11, op12, op13, op14, op15, op16;

	 assign op1 = ip && !sel[3] && !sel[2] && !sel[1] && !sel[0];
	 assign op2 = ip && !sel[3] && !sel[2] && !sel[1] && sel[0];
	 assign op3 = ip && !sel[3] && !sel[2] && sel[1] && !sel[0];
	 assign op4 = ip && !sel[3] && !sel[2] && sel[1] && sel[0]; 

	 assign op5 = ip && !sel[3] && sel[2] && !sel[1] && !sel[0];
	 assign op6 = ip && !sel[3] && sel[2] && !sel[1] && sel[0];
	 assign op7 = ip && !sel[3] && sel[2] && sel[1] && !sel[0];
	 assign op8 = ip && !sel[3] && sel[2] && sel[1] && sel[0];

	 assign op9 = ip && sel[3] && !sel[2] && !sel[1] && !sel[0];
	 assign op10 = ip && sel[3] && !sel[2] && !sel[1] && sel[0];
	 assign op11 = ip && sel[3] && !sel[2] && sel[1] && !sel[0];
	 assign op12 = ip && sel[3] && !sel[2] && sel[1] && sel[0]; 

	 assign op13 = ip && sel[3] && sel[2] && !sel[1] && !sel[0];
	 assign op14 = ip && sel[3] && sel[2] && !sel[1] && sel[0];
	 assign op15 = ip && sel[3] && sel[2] && sel[1] && !sel[0];
	 assign op16 = ip && sel[3] && sel[2] && sel[1] && sel[0];


endmodule
