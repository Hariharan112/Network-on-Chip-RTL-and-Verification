 `timescale 1ns / 1ps
module rr_comb_new(reset, clk, r1, r2, r3, r4, g1, g2, g3, g4,
	l1, l2, l3, l4, mux_out1, mux_out2, mux_out3, mux_out4, and_out1, and_out2, and_out3, and_out4, or_out,
	 b1, b0,b1_logic,b0_logic );
    input reset;
	 input clk;
    input r1;
    input r2;
    input r3;
    input r4;
   
	 output g1;
    output g2;
    output g3;
    output g4;

	 output l1, l2, l3, l4;
	 output mux_out1, mux_out2, mux_out3, mux_out4;
	 output and_out1, and_out2, and_out3, and_out4, or_out;
	 output b1, b0;    // to store currently 
	 output b1_logic,b0_logic;
	 
	 reg b1, b0;
	 wire gnt1, gnt2, gnt3, gnt4;
	 
	
	 
	 
	 
	 and a1(and_out1, g1, !g2, !g3, !g4);
	 and a2(and_out2, !g1, g2, !g3, !g4);
	 and a3(and_out3, !g1, !g2, g3, !g4);
	 and a4(and_out4, !g1, !g2, !g3, g4);
	 /*always@(clk,g1,g2,g3,g4)
	 begin
	         and_out1=g1 & (!g2) & (!g3) & (!g4);
             and_out2=(!g1) & g2 & (!g3) & (!g4);
             and_out3=(!g1) & (!g2) & g3 & (!g4);
             and_out4=(!g1) & (!g2) & (!g3) & g4;
	 end
	 */
	 
	 
	 assign mux_out1 = ( and_out1 )? r1 : l1;
	 assign mux_out2 = ( and_out2 )? r2 : l2;
	 assign mux_out3 = ( and_out3 )? r3 : l3;
	 assign mux_out4 = ( and_out4 )? r4 : l4;
	 /*always@(rd_clk,and_out1,and_out2,and_out3,and_out4,r1,r2,r3,r4,l1,l2,l3,l4)
	 begin
	      mux_out1 = ( and_out1 )? r1 : l1;
          mux_out2 = ( and_out2 )? r2 : l2;
          mux_out3 = ( and_out3 )? r3 : l3;
          mux_out4 = ( and_out4 )? r4 : l4;
	 end
	 */
	 
	 
	assign g1 = gnt1 & r1;
	assign g2 = gnt2 & r2;
	assign g3 = gnt3 & r3;
	assign g4 = gnt4 & r4;
	/*always@(rd_clk,gnt1,gnt2,gnt3,gnt4,r1,r2,r3,r4)
	begin
	    g1 = gnt1 & r1;
        g2 = gnt2 & r2;
        g3 = gnt3 & r3;
        g4 = gnt4 & r4;
	end
	*/
	
	
	
	assign or_out =  (g1 | g2 | g3 | g4); 
	/*always@(rd_clk,g1,g2,g3,g4)
	begin
	    or_out =  (g1 | g2 | g3 | g4);
	end
	*/
	
	
	always @ (g1,g2,g3,g4,or_out)
   	begin
				b1 <= ((g4 & !g3 & !g2 & !g1) | (!g4 & g3 & !g2 & !g1));
				b0 <= ((g4 & !g3 & !g2 & !g1) | (!g4 & !g3 & g2 & !g1));
		end
	
	
	
	
		
	 assign l1 = r1 & !g2 & !g3  & !g4 & ( ((!r3 & !r4) & ( b0 | (!b1 & !r2)) ) | (b1 & ( b0 | !r4))  );
	 assign l2 = r2 & !g1 & !g3  & !g4 & ((!b0 & !r1 & !r4) | (!r1 & !r3 & !r4) | (b1 & b0 & !r1)  | (!b1 & !b0) );
	 assign l3 = r3 & !g2 & !g1  & !g4 & ((!r1 & !r2 & !r4) | (b0 & !r1 & !r2)  | (!b1 & !r2) | (!b1 & b0) );
	 assign l4 = r4 & !g2 & !g3  & !g1 & ((!b1 & !r2 & !r3) | (!r1 & !r2 & !r3) | (!b1 & b0 & !r3) | (b1 & !b0));
	 /*always@(rd_clk,r1,r2,r3,r4,g1,g2,g3,g4,b0,b1)
	 begin
	         l1=(r1 & (!g2) & (!g3)  & (!g4) & ((((!r3) & (!r4)) & ( b0 | ((!b1) & (!r2))) ) | (b1 & ( b0 | !r4))));
             l2=(r2 & (!g1) & (!g3)  & (!g4) & (((!b0) & (!r1) & (!r4)) | ((!r1) & (!r3) & (!r4)) | (b1 & b0 & (!r1))  | ((!b1) & (!b0))));
             l3=(r3 & (!g2) & (!g1)  & (!g4) & (((!r1) & (!r2) & (!r4)) | (b0 & (!r1) & (!r2))  | ((!b1) & (!r2)) | ((!b1) & b0)));
             l4=(r4 & (!g2) & (!g3)  & (!g1) & (((!b1) & (!r2) & (!r3)) | ((!r1) & (!r2) & (!r3)) | ((!b1) & b0 & (!r3)) | (b1 & (!b0))));
	 end
	 */
	 
	 
	 
	 dff_synch_clr dff1(.clk(clk), .d(mux_out1), .clr(reset), .q(gnt1));
	 dff_synch_clr	dff2(.clk(clk), .d(mux_out2), .clr(reset), .q(gnt2));
	 dff_synch_clr dff3(.clk(clk), .d(mux_out3), .clr(reset), .q(gnt3));
	 dff_synch_clr	dff4(.clk(clk), .d(mux_out4), .clr(reset), .q(gnt4));
	 
	 endmodule
	 

