//////////////////////////////////////////////////////////////////////////////////
 `timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:    22:50:32 02/20/09
// Design Name:    
// Module Name:    round_ro...bin_req
// Project Name:   
// Target Device:  
// Tool versions:  
// Description:
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
module round_robin_req(reset, rd_clk, all_vc_not_busy, 

		 					  req_1, req_2, req_3, req_4, req_5, req_6, req_7, req_8, 
		 					  req_9, req_10, req_11, req_12, req_13, req_14, req_15, req_16,

		 					  g1, g2, g3, g4, g5, g6, g7, g8, g9, g10, g11, g12, g13, g14, g15, g16, 
							  
		 					  tailer1, tailer2, tailer3, tailer4, tailer5, tailer6, tailer7, tailer8, 
		 					  tailer9, tailer10, tailer11, tailer12, tailer13, tailer14, tailer15, tailer16,g_b1, g_b2, g_b3, g_b4,gnt1, gnt2, gnt3, gnt4, gnt5, gnt6, gnt7, gnt8, gnt9, gnt10, 
                                                    gnt11, gnt12, gnt13, gnt14, gnt15, gnt16
                             ,req1, req2,req3, req4, req5, req6, req7, req8, req9, req10, req11, 
                                                                         req12, req13, req14, req15, req16   
                             ,g1_latched, g2_latched, g3_latched, g4_latched, g5_latched, g6_latched, 
                                                                                              g7_latched, g8_latched, g9_latched, g10_latched, g11_latched, g12_latched, 
                                                                                               g13_latched, g14_latched, g15_latched, g16_latched
                             ,g1_int, g2_int, g3_int, g4_int, g5_int, g6_int, g7_int, g8_int, 
                                                                                                                    g9_int, g10_int, g11_int, g12_int, g13_int, g14_int, g15_int, g16_int   
                                                                                                                    
                         , t1,t2,t3,t4  
                         ,req_b1, req_b2, req_b3, req_b4 
                         ,nreq_1, nreq_2, nreq_3, nreq_4, nreq_5, nreq_6, nreq_7, nreq_8, nreq_9, nreq_10, nreq_11, nreq_12, nreq_13, nreq_14, nreq_15, nreq_16 
                         //,g_b1, g_b2, g_b3, g_b4
                                                                                                                                                                                                                                               
		               );

				input reset, rd_clk;
				input all_vc_not_busy;
				input req_1, req_2, req_3, req_4, req_5, req_6, req_7, req_8, req_9, req_10, req_11, req_12, req_13, req_14, req_15, req_16;
				input tailer1, tailer2, tailer3, tailer4, tailer5, tailer6, tailer7, tailer8, tailer9, tailer10, tailer11, tailer12, tailer13, tailer14, tailer15, tailer16;
				output  g1, g2, g3, g4, g5, g6, g7, g8,	g9, g10, g11, g12, g13, g14, g15, g16;
				
				supply1 vdd;
				
				output reg req_b1, req_b2, req_b3, req_b4;
				output  nreq_1, nreq_2, nreq_3, nreq_4, nreq_5, nreq_6, nreq_7, nreq_8, nreq_9, nreq_10, nreq_11, nreq_12, nreq_13, nreq_14, nreq_15, nreq_16;

				output  req1, req2,req3, req4, req5, req6, req7, req8, req9, req10, req11, 
				     req12, req13, req14, req15, req16;

				output gnt1, gnt2, gnt3, gnt4, gnt5, gnt6, gnt7, gnt8, gnt9, gnt10, 
				     gnt11, gnt12, gnt13, gnt14, gnt15, gnt16;
  
				output g1_latched, g2_latched, g3_latched, g4_latched, g5_latched, g6_latched, 
				     g7_latched, g8_latched, g9_latched, g10_latched, g11_latched, g12_latched, 
					  g13_latched, g14_latched, g15_latched, g16_latched; 	

				output g1_int, g2_int, g3_int, g4_int, g5_int, g6_int, g7_int, g8_int, 
				     g9_int, g10_int, g11_int, g12_int, g13_int, g14_int, g15_int, g16_int;
				
                output g_b1, g_b2, g_b3, g_b4;		
                
                output t1,t2,t3,t4;
               
             /*  always@(posedge rd_clk)
               begin
               req3 = req_3 & !g3_latched;
               g3 = gnt3 & g_b1;
               end*/
                ///// correct	
                
                
              /*  	
				assign req1 = req_1 & !g1_latched;
				assign req2 = req_2 & !g2_latched;
				assign req3 = req_3 & !g3_latched;
				assign req4 = req_4 & !g4_latched;
				assign req5 = req_5 & !g5_latched;
				//assign req5 = 1;
				assign req6 = req_6 & !g6_latched;
				assign req7 = req_7 & !g7_latched;
				assign req8 = req_8 & !g8_latched;
				assign req9 = req_9 & !g9_latched;
				assign req10 = req_10 & !g10_latched;
				assign req11 = req_11 & !g11_latched;
				assign req12 = req_12 & !g12_latched;
				assign req13 = req_13 & !g13_latched;
				assign req14 = req_14 & !g14_latched;
				assign req15 = req_15 & !g15_latched;
				assign req16 = req_16 & !g16_latched;
				///// correct
*/

assign nreq_1=(!req_1);
		assign nreq_2=(!req_2);
		assign nreq_3=(!req_3);
		assign nreq_4=(!req_4);
		assign nreq_5=(!req_5);
		assign nreq_6=(!req_6);
		assign nreq_7=(!req_7);
		assign nreq_8=(!req_8);
		assign nreq_9=(!req_9);
		assign nreq_10=(!req_10);
		assign nreq_11=(!req_11);
		assign nreq_12=(!req_12);
		assign nreq_13=(!req_13);
		assign nreq_14=(!req_14);
		assign nreq_15=(!req_15);
		assign nreq_16=(!req_16);
/*
always@(req_1,req_2,req_3,req_4,req_5,req_6,req_7,req_8,req_9,req_10,req_11,req_12,req_13,req_14,req_15,req_16)
begin
nreq_1=(!req_1);
		nreq_2=(!req_2);
		nreq_3=(!req_3);
		nreq_4=(!req_4);
		nreq_5=(!req_5);
		nreq_6=(!req_6);
		nreq_7=(!req_7);
		nreq_8=(!req_8);
		nreq_9=(!req_9);
		nreq_10=(!req_10);
		nreq_11=(!req_11);
		nreq_12=(!req_12);
		nreq_13=(!req_13);
		nreq_14=(!req_14);
		nreq_15=(!req_15);
		nreq_16=(!req_16);
end
*/
assign req1 = req_1 & !g1_latched;
                           assign req2 = req_2 & !g2_latched;
                           assign req3 = req_3 & !g3_latched;
                           assign req4 = req_4 & !g4_latched;
                           assign req5 = req_5 & !g5_latched;
                          // req5 = 1;
                           assign req6 = req_6 & !g6_latched;
                           assign req7 = req_7 & !g7_latched;
                           assign req8 = req_8 & !g8_latched;
                           assign req9 = req_9 & !g9_latched;
                           assign req10 = req_10 & !g10_latched;
                           assign req11 = req_11 & !g11_latched;
                           assign req12 = req_12 & !g12_latched;
                           assign req13 = req_13 & !g13_latched;
                           assign req14 = req_14 & !g14_latched;
                           assign req15 = req_15 & !g15_latched;
                           assign req16 = req_16 & !g16_latched;
                           
/*
          always@(req_1,req_2,req_3,req_4,req_5,req_6,req_7,req_8,req_9,req_10,req_11,req_12,req_13,req_14,req_15,req_16,g1_latched,g2_latched,g3_latched,g4_latched,g5_latched,g6_latched,g7_latched,g8_latched,g9_latched,g10_latched,g11_latched,g12_latched,g13_latched,g14_latched,g15_latched,g16_latched,all_vc_not_busy)
          begin
           req1 = req_1 & !g1_latched;
                           req2 = req_2 & !g2_latched;
                           req3 = req_3 & !g3_latched;
                           req4 = req_4 & !g4_latched;
                           req5 = req_5 & !g5_latched;
                          // req5 = 1;
                           req6 = req_6 & !g6_latched;
                           req7 = req_7 & !g7_latched;
                           req8 = req_8 & !g8_latched;
                           req9 = req_9 & !g9_latched;
                           req10 = req_10 & !g10_latched;
                           req11 = req_11 & !g11_latched;
                           req12 = req_12 & !g12_latched;
                           req13 = req_13 & !g13_latched;
                           req14 = req_14 & !g14_latched;
                           req15 = req_15 & !g15_latched;
                           req16 = req_16 & !g16_latched;
          end
	*/	
		/*
		assign req_b1 = (req1 | req2 | req3 | req4);
				assign req_b2 = (req5 | req6 | req7 | req8);
				assign req_b3 = (req9 | req10 | req11 | req12);
				assign req_b4 = (req13 | req14 | req15 | req16);
				
				
		*/
		
		always@(req1,req2,req3,req4,req5,req6,req7,req8,req9,req10,req11,req12,req13,req14,req15,req16)
		begin
		 req_b1 = (req1 | req2 | req3 | req4);
                         req_b2 = (req5 | req6 | req7 | req8);
                         req_b3 = (req9 | req10 | req11 | req12);
                         req_b4 = (req13 | req14 | req15 | req16);
		
		end
		
		/*		
		///// correct		
		assign t1=(all_vc_not_busy & req_b1);
        assign t2=(all_vc_not_busy & req_b2);
        assign t3=(all_vc_not_busy & req_b3);
        assign t4=(all_vc_not_busy & req_b4);		
		///// correct	
		*/
		
		//always@(all_vc_not_busy,req_b1,req_b2,req_b3,req_b4)
		//begin
		 assign t1=(all_vc_not_busy & req_b1);
                assign  t2=(all_vc_not_busy & req_b2);
                 assign t3=(all_vc_not_busy & req_b3);
                 assign t4=(all_vc_not_busy & req_b4);    
		//end
		
			
		assign g1 = gnt1 & g_b1;
					assign g2 = gnt2 & g_b1;
					assign g3 = gnt3 & g_b1;
					assign g4 = gnt4 & g_b1;

					assign g5 = gnt5 & g_b2;
					//assign g5 =1;
					assign g6 = gnt6 & g_b2;
					assign g7 = gnt7 & g_b2;
					assign g8 = gnt8 & g_b2;

					assign g9 = gnt9 & g_b3;
					assign g10 = gnt10 & g_b3;
					assign g11 = gnt11 & g_b3;
					assign g12 = gnt12 & g_b3;

					assign g13 = gnt13 & g_b4;
					assign g14 = gnt14 & g_b4;
					assign g15 = gnt15 & g_b4;
					assign g16 = gnt16 & g_b4;
		/*
		
		always@(g_b1,g_b2,g_b3,g_b4,gnt1,gnt2,gnt3,gnt4,gnt5,gnt6,gnt7,gnt8,gnt9,gnt10,gnt11,gnt12,gnt13,gnt14,gnt15,gnt16)
		begin
		 g1 = gnt1 & g_b1;
                             g2 = gnt2 & g_b1;
                             g3 = gnt3 & g_b1;
                             g4 = gnt4 & g_b1;
        
                             g5 = gnt5 & g_b2;
                            // g5 =1;
                             g6 = gnt6 & g_b2;
                             g7 = gnt7 & g_b2;
                             g8 = gnt8 & g_b2;
        
                             g9 = gnt9 & g_b3;
                             g10 = gnt10 & g_b3;
                             g11 = gnt11 & g_b3;
                             g12 = gnt12 & g_b3;
        
                             g13 = gnt13 & g_b4;
                             g14 = gnt14 & g_b4;
                             g15 = gnt15 & g_b4;
                             g16 = gnt16 & g_b4;
		end			
		*/
			
		dff_asynch_clr dff_rq1(.d(vdd), .clk(g1_int), .clr(nreq_1), .q(g1_latched));
		dff_asynch_clr dff_rq2(.d(vdd), .clk(g2_int), .clr(nreq_2), .q(g2_latched));
		dff_asynch_clr dff_rq3(.d(vdd), .clk(g3_int), .clr(nreq_3), .q(g3_latched));
		dff_asynch_clr dff_rq4(.d(vdd), .clk(g4_int), .clr(nreq_4), .q(g4_latched));
		dff_asynch_clr dff_rq5(.d(vdd), .clk(g5_int), .clr(nreq_5), .q(g5_latched));
		dff_asynch_clr dff_rq6(.d(vdd), .clk(g6_int), .clr(nreq_6), .q(g6_latched));
		dff_asynch_clr dff_rq7(.d(vdd), .clk(g7_int), .clr(nreq_7), .q(g7_latched));
		dff_asynch_clr dff_rq8(.d(vdd), .clk(g8_int), .clr(nreq_8), .q(g8_latched));
		dff_asynch_clr dff_rq9(.d(vdd), .clk(g9_int), .clr(nreq_9), .q(g9_latched));
		dff_asynch_clr dff_rq10(.d(vdd), .clk(g10_int), .clr(nreq_10), .q(g10_latched));
		dff_asynch_clr dff_rq11(.d(vdd), .clk(g11_int), .clr(nreq_11), .q(g11_latched));
		dff_asynch_clr dff_rq12(.d(vdd), .clk(g12_int), .clr(nreq_12), .q(g12_latched));
		dff_asynch_clr dff_rq13(.d(vdd), .clk(g13_int), .clr(nreq_13), .q(g13_latched));
		dff_asynch_clr dff_rq14(.d(vdd), .clk(g14_int), .clr(nreq_14), .q(g14_latched));
		dff_asynch_clr dff_rq15(.d(vdd), .clk(g15_int), .clr(nreq_15), .q(g15_latched));
		dff_asynch_clr dff_rq16(.d(vdd), .clk(g16_int), .clr(nreq_16), .q(g16_latched));
		rr_arbiter rr_b1 (.reset(reset), .clk(rd_clk), .req1(req1), .req2(req2), .req3(req3), .req4(req4), 
            .gnt1(gnt1), .gnt2(gnt2), .gnt3(gnt3), .gnt4(gnt4) );
		rr_arbiter rr_b2 (.reset(reset), .clk(rd_clk), .req1(req5), .req2(req6), .req3(req7), .req4(req8), 
            .gnt1(gnt5), .gnt2(gnt6), .gnt3(gnt7), .gnt4(gnt8) );
		rr_arbiter rr_b3 (.reset(reset), .clk(rd_clk), .req1(req9), .req2(req10), .req3(req11), .req4(req12), 
            .gnt1(gnt9), .gnt2(gnt10), .gnt3(gnt11), .gnt4(gnt12) );
		rr_arbiter rr_b4 (.reset(reset), .clk(rd_clk), .req1(req13), .req2(req14), .req3(req15), .req4(req16), 
            .gnt1(gnt13), .gnt2(gnt14), .gnt3(gnt15), .gnt4(gnt16) );
		rr_arbiter rr_b5 (.reset(reset), .clk(rd_clk), .req1(t1), .req2(t2), .req3(t3), .req4(t4), 
            .gnt1(g_b1), .gnt2(g_b2), .gnt3(g_b3), .gnt4(g_b4) );
		dff_synch_reset dff_synch1 ( .d(g1), .clk(rd_clk), .reset(reset), .q(g1_int) );
		dff_synch_reset dff_synch2 ( .d(g2), .clk(rd_clk), .reset(reset), .q(g2_int) );
		dff_synch_reset dff_synch3 ( .d(g3), .clk(rd_clk), .reset(reset), .q(g3_int) );
		dff_synch_reset dff_synch4 ( .d(g4), .clk(rd_clk), .reset(reset), .q(g4_int) );
		dff_synch_reset dff_synch5 ( .d(g5), .clk(rd_clk), .reset(reset), .q(g5_int) );
		dff_synch_reset dff_synch6 ( .d(g6), .clk(rd_clk), .reset(reset), .q(g6_int) );
		dff_synch_reset dff_synch7 ( .d(g7), .clk(rd_clk), .reset(reset), .q(g7_int) );
		dff_synch_reset dff_synch8 ( .d(g8), .clk(rd_clk), .reset(reset), .q(g8_int) );
		dff_synch_reset dff_synch9 ( .d(g9), .clk(rd_clk), .reset(reset), .q(g9_int) );
		dff_synch_reset dff_synch10( .d(g10), .clk(rd_clk), .reset(reset), .q(g10_int) );
		dff_synch_reset dff_synch11 ( .d(g11), .clk(rd_clk), .reset(reset), .q(g11_int) );
		dff_synch_reset dff_synch12 ( .d(g12), .clk(rd_clk), .reset(reset), .q(g12_int) );
		dff_synch_reset dff_synch13 ( .d(g13), .clk(rd_clk), .reset(reset), .q(g13_int) );
		dff_synch_reset dff_synch14( .d(g14), .clk(rd_clk), .reset(reset), .q(g14_int) );
		dff_synch_reset dff_synch15 ( .d(g15), .clk(rd_clk), .reset(reset), .q(g15_int) );
		dff_synch_reset dff_synch16 ( .d(g16), .clk(rd_clk), .reset(reset), .q(g16_int) );
		
endmodule

		
