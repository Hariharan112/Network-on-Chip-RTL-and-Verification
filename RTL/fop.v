`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/21/2018 03:28:24 PM
// Design Name: 
// Module Name: fop
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


module final_op_data(data_in, vc_id, gnt_or, data_out);

input [31:0] data_in;
input [1:0] vc_id;
input gnt_or;
output [31:0] data_out;


assign data_out[31] = data_in[31];
assign data_out[30]  =  data_in[30] | !gnt_or;
assign data_out[29]  =  data_in[29] | !gnt_or;
assign data_out[28:27]  =  vc_id;	

assign data_out[26]  =  data_in[26] & gnt_or; 
assign data_out[25]  =  data_in[25] & gnt_or;
assign data_out[24]  =  data_in[24] & gnt_or;
assign data_out[23]  =  data_in[23] & gnt_or;
assign data_out[22]  =  data_in[22] & gnt_or;
assign data_out[21]  =  data_in[21] & gnt_or;
assign data_out[20]  =  data_in[20] & gnt_or;
assign data_out[19]  =  data_in[19] & gnt_or;
assign data_out[18]  =  data_in[18] & gnt_or;
assign data_out[17]  =  data_in[17] & gnt_or;
assign data_out[16]  =  data_in[16] & gnt_or;
assign data_out[15]  =  data_in[15] & gnt_or;
assign data_out[14]  =  data_in[14] & gnt_or;
assign data_out[13]  =  data_in[13] & gnt_or;
assign data_out[12]  =  data_in[12] & gnt_or;
assign data_out[11]  =  data_in[11] & gnt_or;
assign data_out[10]  =  data_in[10] & gnt_or;
assign data_out[9]  =  data_in[9] & gnt_or;
assign data_out[8]  =  data_in[8] & gnt_or;
assign data_out[7]  =  data_in[7] & gnt_or;
assign data_out[6]  =  data_in[6] & gnt_or;
assign data_out[5]  =  data_in[5] & gnt_or;
assign data_out[4]  =  data_in[4] & gnt_or;
assign data_out[3]  =  data_in[3] & gnt_or;
assign data_out[2]  =  data_in[2] & gnt_or;
assign data_out[1]  =  data_in[1] & gnt_or;
assign data_out[0]  =  data_in[0] & gnt_or;

endmodule



