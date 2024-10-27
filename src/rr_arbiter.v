`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/30/2018 09:42:18 PM
// Design Name: 
// Module Name: rr_arbiter
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


module rr_arbiter(req1,req2,req3,req4,reset,gnt1,gnt2,gnt3,gnt4,clk);

input req1,req2,req3,req4;
input reset;
output reg gnt1,gnt2,gnt3,gnt4;
input clk;
		
wire  en0, en1, en2, en3;		
reg en0_0;
	//outi_j=output i of priority encoder j
wire out0_0, out1_0, out2_0, out3_0;
wire out0_1, out1_1, out2_1, out3_1;
wire out0_2, out1_2, out2_2, out3_2;
wire out0_3, out1_3, out2_3, out3_3;
wire gnt1_pulse,gnt2_pulse,gnt3_pulse,gnt4_pulse;
	
wire high,low;
reg clr_en0_reset;
wire en0_reset;
reg clr_en0,clr_en1,clr_en2,clr_en3;


      always@(*)
      begin
         gnt1=((out0_0 | out3_1 | out2_2 | out1_3) & !reset);
		 gnt2=((out1_0|out0_1|out3_2|out2_3) & !reset);
		 gnt3=((out2_0|out1_1|out0_2|out3_3) & !reset);
		 gnt4=((out3_0|out2_1|out1_2|out0_3) & !reset);
		
		 clr_en0_reset=(reset|en0|en1|en2|en3);
		 en0_0=(en0_reset|en0);
		
			
		 clr_en1=(reset | gnt3_pulse | gnt2_pulse | gnt4_pulse);
		 clr_en2=(reset | gnt1_pulse | gnt3_pulse | gnt4_pulse);
		 clr_en3=(reset | gnt1_pulse | gnt2_pulse | gnt4_pulse);
		 clr_en0=(reset | gnt1_pulse | gnt2_pulse | gnt3_pulse);
      end

	priority_encoder m1(.reset(reset),
		.en(en0_0),
		.in0(req1),
		.in1(req2),
		.in2(req3),
		.in3(req4),
		.out0(out0_0),
		.out1(out1_0),
		.out2(out2_0),
		.out3(out3_0),
		.clk(clk));
	
		priority_encoder m2(.reset(reset),
		.en(en1),
		.in0(req2),
		.in1(req3),
		.in2(req4),
		.in3(req1),
		.out0(out0_1),
		.out1(out1_1),
		.out2(out2_1),
		.out3(out3_1),
		.clk(clk));			
			
		priority_encoder m3(.reset(reset),	
		.en(en2),
		.in0(req3),
		.in1(req4),
		.in2(req1),
		.in3(req2),
		.out0(out0_2),
		.out1(out1_2),
		.out2(out2_2),
		.out3(out3_2),
		.clk(clk));
		
		priority_encoder pe3(.reset(reset),
		.en(en3),
		.in0(req4),
		.in1(req1),
		.in2(req2),
		.in3(req3),
		.out0(out0_3),
		.out1(out1_3),
		.out2(out2_3),
		.out3(out3_3),
		.clk(clk));
		
		falling_edge_pulse_generator pg0(.reset(reset),
		.gnt(gnt1),
		.clk(clk),
		.q0(gnt1_pulse));
		
		falling_edge_pulse_generator pg1(.reset(reset),
		.gnt(gnt2),
		.clk(clk),
		.q0(gnt2_pulse));
		
		falling_edge_pulse_generator pg2(.reset(reset),
		.gnt(gnt3),
		.clk(clk),
		.q0(gnt3_pulse));

		falling_edge_pulse_generator pg3(.reset(reset),
		.gnt(gnt4),
		.clk(clk),
		.q0(gnt4_pulse));
		
		dff_asynch_clr d1(.d(1'b1),
		.clk(clk),
		.clr(clr_en0_reset),
		.q(en0_reset));

		dff_asynch_clr d2(.d(1'b1),
		.clk(gnt1_pulse),
		.clr(clr_en1),
		.q(en1));

		dff_asynch_clr d3(.d(1'b1),
		.clk(gnt2_pulse),
		.clr(clr_en2),
		.q(en2));

			
		dff_asynch_clr d4(.d(1'b1),
		.clk(gnt3_pulse),
		.clr(clr_en3),
		.q(en3));

		dff_asynch_clr d5(.d(1'b1),
		.clk(gnt4_pulse),
		.clr(clr_en0),
		.q(en0));

endmodule
