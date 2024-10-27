 `timescale 1ns / 1ps


module op_core (rd_clk, reset, 

		          req_link1_vc1, req_link1_vc2, req_link1_vc3, req_link1_vc4,
					 req_link2_vc1, req_link2_vc2, req_link2_vc3, req_link2_vc4,
					 req_link3_vc1, req_link3_vc2, req_link3_vc3, req_link3_vc4,
					 req_link4_vc1, req_link4_vc2, req_link4_vc3, req_link4_vc4,    
                rok_link1_vc1, rok_link1_vc2, rok_link1_vc3, rok_link1_vc4, 
	 				 rok_link2_vc1, rok_link2_vc2, rok_link2_vc3, rok_link2_vc4, 
	 				 rok_link3_vc1, rok_link3_vc2, rok_link3_vc3, rok_link3_vc4, 
	             rok_link4_vc1, rok_link4_vc2, rok_link4_vc3, rok_link4_vc4,
					  
					 tailer_link1_vc1, tailer_link1_vc2, tailer_link1_vc3, tailer_link1_vc4,
	 				 tailer_link2_vc1, tailer_link2_vc2, tailer_link2_vc3, tailer_link2_vc4, 
	 				 tailer_link3_vc1, tailer_link3_vc2, tailer_link3_vc3, tailer_link3_vc4, 
                tailer_link4_vc1, tailer_link4_vc2, tailer_link4_vc3, tailer_link4_vc4,

					 full_vc1, full_vc2, full_vc3, full_vc4, rd_en_vc1_link1_vc1, rd_en_vc1_link1_vc2, rd_en_vc1_link1_vc3, rd_en_vc1_link1_vc4, 
       rd_en_vc1_link2_vc1, rd_en_vc1_link2_vc2, rd_en_vc1_link2_vc3, rd_en_vc1_link2_vc4, 
       rd_en_vc1_link3_vc1, rd_en_vc1_link3_vc2, rd_en_vc1_link3_vc3, rd_en_vc1_link3_vc4, 
	    rd_en_vc1_link4_vc1, rd_en_vc1_link4_vc2, rd_en_vc1_link4_vc3, rd_en_vc1_link4_vc4, 

	    rd_en_vc2_link1_vc1, rd_en_vc2_link1_vc2, rd_en_vc2_link1_vc3, rd_en_vc2_link1_vc4, 
       rd_en_vc2_link2_vc1, rd_en_vc2_link2_vc2, rd_en_vc2_link2_vc3, rd_en_vc2_link2_vc4, 
       rd_en_vc2_link3_vc1, rd_en_vc2_link3_vc2, rd_en_vc2_link3_vc3, rd_en_vc2_link3_vc4, 
	    rd_en_vc2_link4_vc1, rd_en_vc2_link4_vc2, rd_en_vc2_link4_vc3, rd_en_vc2_link4_vc4,
	 
	    rd_en_vc3_link1_vc1, rd_en_vc3_link1_vc2, rd_en_vc3_link1_vc3, rd_en_vc3_link1_vc4, 
       rd_en_vc3_link2_vc1, rd_en_vc3_link2_vc2, rd_en_vc3_link2_vc3, rd_en_vc3_link2_vc4, 
       rd_en_vc3_link3_vc1, rd_en_vc3_link3_vc2, rd_en_vc3_link3_vc3, rd_en_vc3_link3_vc4, 
	    rd_en_vc3_link4_vc1, rd_en_vc3_link4_vc2, rd_en_vc3_link4_vc3, rd_en_vc3_link4_vc4,
	 
	    rd_en_vc4_link1_vc1, rd_en_vc4_link1_vc2, rd_en_vc4_link1_vc3, rd_en_vc4_link1_vc4, 
       rd_en_vc4_link2_vc1, rd_en_vc4_link2_vc2, rd_en_vc4_link2_vc3, rd_en_vc4_link2_vc4, 
       rd_en_vc4_link3_vc1, rd_en_vc4_link3_vc2, rd_en_vc4_link3_vc3, rd_en_vc4_link3_vc4, 
	    rd_en_vc4_link4_vc1, rd_en_vc4_link4_vc2, rd_en_vc4_link4_vc3, rd_en_vc4_link4_vc4,
	    
		 gnt_vc1, gnt_vc2, gnt_vc3, gnt_vc4, ip_link_vc);
input	  rd_clk, reset, 

		          req_link1_vc1, req_link1_vc2, req_link1_vc3, req_link1_vc4,
					 req_link2_vc1, req_link2_vc2, req_link2_vc3, req_link2_vc4,
					 req_link3_vc1, req_link3_vc2, req_link3_vc3, req_link3_vc4,
					 req_link4_vc1, req_link4_vc2, req_link4_vc3, req_link4_vc4,    
                rok_link1_vc1, rok_link1_vc2, rok_link1_vc3, rok_link1_vc4, 
	 				 rok_link2_vc1, rok_link2_vc2, rok_link2_vc3, rok_link2_vc4, 
	 				 rok_link3_vc1, rok_link3_vc2, rok_link3_vc3, rok_link3_vc4, 
	             rok_link4_vc1, rok_link4_vc2, rok_link4_vc3, rok_link4_vc4,
					  
					 tailer_link1_vc1, tailer_link1_vc2, tailer_link1_vc3, tailer_link1_vc4,
	 				 tailer_link2_vc1, tailer_link2_vc2, tailer_link2_vc3, tailer_link2_vc4, 
	 				 tailer_link3_vc1, tailer_link3_vc2, tailer_link3_vc3, tailer_link3_vc4, 
                tailer_link4_vc1, tailer_link4_vc2, tailer_link4_vc3, tailer_link4_vc4,

					 full_vc1, full_vc2, full_vc3, full_vc4; 
output rd_en_vc1_link1_vc1, rd_en_vc1_link1_vc2, rd_en_vc1_link1_vc3, rd_en_vc1_link1_vc4, 
       rd_en_vc1_link2_vc1, rd_en_vc1_link2_vc2, rd_en_vc1_link2_vc3, rd_en_vc1_link2_vc4, 
       rd_en_vc1_link3_vc1, rd_en_vc1_link3_vc2, rd_en_vc1_link3_vc3, rd_en_vc1_link3_vc4, 
	    rd_en_vc1_link4_vc1, rd_en_vc1_link4_vc2, rd_en_vc1_link4_vc3, rd_en_vc1_link4_vc4, 

	    rd_en_vc2_link1_vc1, rd_en_vc2_link1_vc2, rd_en_vc2_link1_vc3, rd_en_vc2_link1_vc4, 
       rd_en_vc2_link2_vc1, rd_en_vc2_link2_vc2, rd_en_vc2_link2_vc3, rd_en_vc2_link2_vc4, 
       rd_en_vc2_link3_vc1, rd_en_vc2_link3_vc2, rd_en_vc2_link3_vc3, rd_en_vc2_link3_vc4, 
	    rd_en_vc2_link4_vc1, rd_en_vc2_link4_vc2, rd_en_vc2_link4_vc3, rd_en_vc2_link4_vc4,
	 
	    rd_en_vc3_link1_vc1, rd_en_vc3_link1_vc2, rd_en_vc3_link1_vc3, rd_en_vc3_link1_vc4, 
       rd_en_vc3_link2_vc1, rd_en_vc3_link2_vc2, rd_en_vc3_link2_vc3, rd_en_vc3_link2_vc4, 
       rd_en_vc3_link3_vc1, rd_en_vc3_link3_vc2, rd_en_vc3_link3_vc3, rd_en_vc3_link3_vc4, 
	    rd_en_vc3_link4_vc1, rd_en_vc3_link4_vc2, rd_en_vc3_link4_vc3, rd_en_vc3_link4_vc4,
	 
	    rd_en_vc4_link1_vc1, rd_en_vc4_link1_vc2, rd_en_vc4_link1_vc3, rd_en_vc4_link1_vc4, 
       rd_en_vc4_link2_vc1, rd_en_vc4_link2_vc2, rd_en_vc4_link2_vc3, rd_en_vc4_link2_vc4, 
       rd_en_vc4_link3_vc1, rd_en_vc4_link3_vc2, rd_en_vc4_link3_vc3, rd_en_vc4_link3_vc4, 
	    rd_en_vc4_link4_vc1, rd_en_vc4_link4_vc2, rd_en_vc4_link4_vc3, rd_en_vc4_link4_vc4,
	    
		 gnt_vc1, gnt_vc2, gnt_vc3, gnt_vc4 ;
		 output [3:0] ip_link_vc;
wire gnt_or, ce_b1, ce_b2, ce_b3, ce_b4, clr_b1, clr_b2, clr_b3, clr_b4, b1, b2, b3, b4; 	

				wire [15:0] mux_in;	  // to store all rok signals into an array , to realise a MUX 16 x 1
				wire  mux_rok_out_vc1,  mux_rok_out_vc2,  mux_rok_out_vc3,  mux_rok_out_vc4;	// op of 4 MUX
				wire [3:0] sel_vc;		// to select which ip line to read; assigned to op port ip_link_vc
				wire [3:0] encoded_addr;	 // op of encoder
				wire ready_vc1, ready_vc2, ready_vc3, ready_vc4;	// vci is ready with valid data to send to op port
							// for   round_robin_req
				wire all_vc_not_busy;	// OR op of all bi
				wire g1, g2, g3, g4, g5, g6, g7, g8,	g9, g10, g11, g12, g13, g14, g15, g16;
				wire [1:0] link_1, vc_id_1, link_2, vc_id_2, link_3, vc_id_3, link_4, vc_id_4;  // reg to store the ip link no. & its vc_id with which vc of op port is connected 
				wire g1_latched, g2_latched, g3_latched, g4_latched, g5_latched, g6_latched, g7_latched, g8_latched, g9_latched, g10_latched, g11_latched, g12_latched, g13_latched, g14_latched, g15_latched, g16_latched;
/*Edits by Guru*/

				assign ready_vc1 = (mux_rok_out_vc1 & b1 &  !full_vc1);
				assign ready_vc2 = (mux_rok_out_vc2 & b2 &  !full_vc2);
				assign ready_vc3 = (mux_rok_out_vc3 & b3 &  !full_vc3);
				assign ready_vc4 = (mux_rok_out_vc4 & b4 &  !full_vc4);
				


assign all_vc_not_busy = !(b1 & b2 & b3 & b4);			
/*
                assign ready_vc1 = (mux_rok_out_vc1 & b1 &  ~full_vc1);
				assign ready_vc2 = (mux_rok_out_vc2 & b2 &  ~full_vc2);
				assign ready_vc3 = (mux_rok_out_vc3 & b3 &  ~full_vc3);
				assign ready_vc4 = (mux_rok_out_vc4 & b4 &  ~full_vc4);
*/
				
assign sel_vc[3] = (gnt_vc4 &  link_4[1])  | (gnt_vc3 & link_3[1])  | (gnt_vc2 & link_2[1])  | (gnt_vc1 & link_1[1]) ;
		 		assign sel_vc[2] = (gnt_vc4 &  link_4[0])  | (gnt_vc3 & link_3[0])  | (gnt_vc2 & link_2[0])  | (gnt_vc1 & link_1[0]) ;
		  		assign sel_vc[1] = (gnt_vc4 &  vc_id_4[1]) | (gnt_vc3 & vc_id_3[1]) | (gnt_vc2 & vc_id_2[1]) | (gnt_vc1 & vc_id_1[1]);
		  		assign sel_vc[0] = (gnt_vc4 &  vc_id_4[0]) | (gnt_vc3 & vc_id_3[0]) | (gnt_vc2 & vc_id_2[0]) | (gnt_vc1 & vc_id_1[0]);

assign ip_link_vc = sel_vc;

round_robin_req rrq1 ( .reset(reset), .rd_clk(rd_clk), .all_vc_not_busy(all_vc_not_busy), 
                       .req_1(req_link1_vc1), .req_2(req_link1_vc2), .req_3(req_link1_vc3), .req_4(req_link1_vc4), .req_5(req_link2_vc1), .req_6(req_link2_vc2), 
                       .req_7(req_link2_vc3), .req_8(req_link2_vc4), .req_9(req_link3_vc1), .req_10(req_link3_vc2), .req_11(req_link3_vc3), .req_12(req_link3_vc4), .req_13(req_link4_vc1), .req_14(req_link4_vc2), .req_15(req_link4_vc3), .req_16(req_link4_vc4),
			              .g1(g1), .g2(g2), .g3(g3), .g4(g4), .g5(g5), .g6(g6), .g7(g7), .g8(g8), .g9(g9), .g10(g10), .g11(g11), .g12(g12),	.g13(g13), .g14(g14), .g15(g15),	.g16(g16),
				           .tailer1( tailer_link1_vc1), .tailer2( tailer_link1_vc2), .tailer3( tailer_link1_vc3), .tailer4( tailer_link1_vc4),
				           .tailer5(tailer_link2_vc1), .tailer6(tailer_link2_vc2), .tailer7(tailer_link2_vc3), .tailer8(tailer_link2_vc4), .tailer9(tailer_link3_vc1), .tailer10(tailer_link3_vc2), .tailer11(tailer_link3_vc3), .tailer12(tailer_link3_vc4),
				           .tailer13(tailer_link4_vc1), .tailer14(tailer_link4_vc2),.tailer15(tailer_link4_vc3), .tailer16(tailer_link4_vc4) );
 encoder enc1(.g1(g1), .g2(g2), .g3(g3), .g4(g4), .g5(g5), .g6(g6), .g7(g7), .g8(g8), .g9(g9),
				 .g10(g10), .g11(g11), .g12(g12), .g13(g13), .g14(g14), .g15(g15), .g16(g16),
				 .encoded_addr(encoded_addr)
				);
				allot_vc alt_vc(.reset(reset), .rd_clk(rd_clk), .encoded_addr(encoded_addr), 
                
					 .g1(g1), .g2(g2), .g3(g3), .g4(g4), .g5(g5), .g6(g6), .g7(g7),  .g8(g8), .g9(g9),
					 .g10(g10),  .g11(g11),  .g12(g12), .g13(g13), .g14(g14), .g15(g15), .g16(g16),
				    
					 .link_1(link_1), .vc_id_1(vc_id_1),  .link_2(link_2),  .vc_id_2(vc_id_2), 
					 .link_3(link_3),  .vc_id_3(vc_id_3), .link_4(link_4),  .vc_id_4(vc_id_4),
				    
					 .b1(b1), .b2(b2), .b3(b3),  .b4(b4),  
					 
					 .tailer1(tailer_link1_vc1), .tailer2(tailer_link1_vc2), .tailer3(tailer_link1_vc3), .tailer4(tailer_link1_vc4),
					 .tailer5(tailer_link2_vc1), .tailer6(tailer_link2_vc2), .tailer7(tailer_link2_vc3), .tailer8(tailer_link2_vc4), 
					 .tailer9(tailer_link3_vc1), .tailer10(tailer_link3_vc2), .tailer11(tailer_link3_vc3), .tailer12(tailer_link3_vc4),
				    .tailer13(tailer_link4_vc1), .tailer14(tailer_link4_vc2),.tailer15(tailer_link4_vc3), .tailer16(tailer_link4_vc4),  
				    
					 .gnt_or(gnt_or), .ce_b1(ce_b1), .ce_b2(ce_b2), .ce_b3(ce_b3), .ce_b4(ce_b4), .clr_b1(clr_b1), .clr_b2(clr_b2), .clr_b3(clr_b3), .clr_b4(clr_b4)
					);
					/*assign mux_in =  {rok_link4_vc4, rok_link4_vc3, rok_link4_vc2, rok_link4_vc1, 
				                  rok_link3_vc4, rok_link3_vc3, rok_link3_vc2, rok_link3_vc1, 
										rok_link2_vc4, rok_link2_vc3, rok_link2_vc2, rok_link2_vc1,
				                  rok_link1_vc4, rok_link1_vc3, rok_link1_vc2, rok_link1_vc1 
									  };

				assign mux_rok_out_vc1 = mux_in[{link_1, vc_id_1}];
				assign mux_rok_out_vc2 = mux_in[{link_2, vc_id_2}];
				assign mux_rok_out_vc3 = mux_in[{link_3, vc_id_3}];
				assign mux_rok_out_vc4 = mux_in[{link_4, vc_id_4}];*/
				
				
		
wire   mux_in_l1[15:0];
                         wire  mux_in_l2[15:0];
                         wire  mux_in_l3[15:0];
                         wire  mux_in_l4[15:0];
                         
                         
                              assign mux_in_l1[0] = rok_link1_vc1;
                        assign mux_in_l1[1] = rok_link1_vc2;
                        assign mux_in_l1[2] = rok_link1_vc3;
                        assign mux_in_l1[3] = rok_link1_vc4;
                        assign mux_in_l1[4] = rok_link2_vc1;
                        assign mux_in_l1[5] = rok_link2_vc2;
                        assign mux_in_l1[6] = rok_link2_vc3;
                        assign mux_in_l1[7] = rok_link2_vc4;
                        assign mux_in_l1[8] = rok_link3_vc1;
                        assign mux_in_l1[9] = rok_link3_vc2;
                        assign mux_in_l1[10] = rok_link3_vc3;
                        assign mux_in_l1[11] = rok_link3_vc4;
                        assign mux_in_l1[12] = rok_link4_vc1;
                        assign mux_in_l1[13] = rok_link4_vc2;
                        assign mux_in_l1[14] = rok_link4_vc3;
                         assign mux_in_l1[15] = rok_link4_vc4;
                    
                    
                          assign mux_in_l2[0] = rok_link1_vc1;
                        assign mux_in_l2[1] = rok_link1_vc2;
                        assign mux_in_l2[2] = rok_link1_vc3;
                        assign mux_in_l2[3] = rok_link1_vc4;
                        assign mux_in_l2[4] = rok_link2_vc1;
                        assign mux_in_l2[5] = rok_link2_vc2;
                        assign mux_in_l2[6] = rok_link2_vc3;
                        assign mux_in_l2[7] = rok_link2_vc4;
                        assign mux_in_l2[8] = rok_link3_vc1;
                        assign mux_in_l2[9] = rok_link3_vc2;
                        assign mux_in_l2[10] = rok_link3_vc3;
                        assign mux_in_l2[11] = rok_link3_vc4;
                        assign mux_in_l2[12] = rok_link4_vc1;
                        assign mux_in_l2[13] = rok_link4_vc2;
                        assign mux_in_l2[14] = rok_link4_vc3;
                         assign mux_in_l2[15] =rok_link4_vc4;
                    
                    
                         assign mux_in_l3[0] = rok_link1_vc1;
                        assign mux_in_l3[1] = rok_link1_vc2;
                        assign mux_in_l3[2] = rok_link1_vc3;
                        assign mux_in_l3[3] = rok_link1_vc4;
                        assign mux_in_l3[4] = rok_link2_vc1;
                        assign mux_in_l3[5] = rok_link2_vc2;
                        assign mux_in_l3[6] = rok_link2_vc3;
                        assign mux_in_l3[7] = rok_link2_vc4;
                        assign mux_in_l3[8] = rok_link3_vc1;
                        assign mux_in_l3[9] = rok_link3_vc2;
                        assign mux_in_l3[10] = rok_link3_vc3;
                        assign mux_in_l3[11] = rok_link3_vc4;
                        assign mux_in_l3[12] = rok_link4_vc1;
                        assign mux_in_l3[13] = rok_link4_vc2;
                        assign mux_in_l3[14] = rok_link4_vc3;
                         assign mux_in_l3[15] = rok_link4_vc4;
                    
                    
                         assign mux_in_l4[0] = rok_link1_vc1;
                        assign mux_in_l4[1] = rok_link1_vc2;
                        assign mux_in_l4[2] = rok_link1_vc3;
                        assign mux_in_l4[3] = rok_link1_vc4;
                        assign mux_in_l4[4] = rok_link2_vc1;
                        assign mux_in_l4[5] = rok_link2_vc2;
                        assign mux_in_l4[6] = rok_link2_vc3;
                        assign mux_in_l4[7] = rok_link2_vc4;
                        assign mux_in_l4[8] = rok_link3_vc1;
                        assign mux_in_l4[9] = rok_link3_vc2;
                        assign mux_in_l4[10] = rok_link3_vc3;
                        assign mux_in_l4[11] = rok_link3_vc4;
                        assign mux_in_l4[12] = rok_link4_vc1;
                        assign mux_in_l4[13] = rok_link4_vc2;
                        assign mux_in_l4[14] = rok_link4_vc3;
                         assign mux_in_l4[15] = rok_link4_vc4;
                    
                    
                    
                    /////////////// *********** ???????????????? ***************** ///////////////////
                    
                         assign mux_rok_out_vc1 =  mux_in_l1[{link_1, vc_id_1}];
                         assign mux_rok_out_vc2 =  mux_in_l2[{link_2, vc_id_2}];
                         assign mux_rok_out_vc3 =  mux_in_l3[{link_3, vc_id_3}];
                         assign mux_rok_out_vc4 =  mux_in_l4[{link_4, vc_id_4}];
                         
                    
                    
                    /////////////////////////////////////
                    ///////////////////////////////////    
		
						
				
rr_comb_new rr_gnt (.reset(reset), .clk(rd_clk), .r1(ready_vc1), .r2(ready_vc2), .r3(ready_vc3), .r4(ready_vc4), 
            .g1(gnt_vc1), .g2(gnt_vc2), .g3(gnt_vc3), .g4(gnt_vc4) );
demux_16 dmux_opl1_1 (.ip(gnt_vc1), .sel({link_1,vc_id_1}), .op1(rd_en_vc1_link1_vc1), .op2(rd_en_vc1_link1_vc2), .op3(rd_en_vc1_link1_vc3), .op4(rd_en_vc1_link1_vc4), .op5(rd_en_vc1_link2_vc1), .op6(rd_en_vc1_link2_vc2), 
				.op7(rd_en_vc1_link2_vc3), .op8(rd_en_vc1_link2_vc4), .op9(rd_en_vc1_link3_vc1), .op10(rd_en_vc1_link3_vc2), .op11(rd_en_vc1_link3_vc3), .op12(rd_en_vc1_link3_vc4), .op13(rd_en_vc1_link4_vc1), .op14(rd_en_vc1_link4_vc2), .op15(rd_en_vc1_link4_vc3), .op16(rd_en_vc1_link4_vc4)	);
demux_16 dmux_opl1_2 (.ip(gnt_vc2), .sel({link_2,vc_id_2}), .op1(rd_en_vc2_link1_vc1), .op2(rd_en_vc2_link1_vc2), .op3(rd_en_vc2_link1_vc3), .op4(rd_en_vc2_link1_vc4), .op5(rd_en_vc2_link2_vc1), .op6(rd_en_vc2_link2_vc2), 
				.op7(rd_en_vc2_link2_vc3), .op8(rd_en_vc2_link2_vc4), .op9(rd_en_vc2_link3_vc1), .op10(rd_en_vc2_link3_vc2), .op11(rd_en_vc2_link3_vc3), .op12(rd_en_vc2_link3_vc4), .op13(rd_en_vc2_link4_vc1), .op14(rd_en_vc2_link4_vc2), .op15(rd_en_vc2_link4_vc3), .op16(rd_en_vc2_link4_vc4)	);
demux_16 dmux_opl1_3 (.ip(gnt_vc3), .sel({link_3,vc_id_3}), .op1(rd_en_vc3_link1_vc1), .op2(rd_en_vc3_link1_vc2), .op3(rd_en_vc3_link1_vc3), .op4(rd_en_vc3_link1_vc4), .op5(rd_en_vc3_link2_vc1), .op6(rd_en_vc3_link2_vc2), 
				.op7(rd_en_vc3_link2_vc3), .op8(rd_en_vc3_link2_vc4), .op9(rd_en_vc3_link3_vc1), .op10(rd_en_vc3_link3_vc2), .op11(rd_en_vc3_link3_vc3), .op12(rd_en_vc3_link3_vc4), .op13(rd_en_vc3_link4_vc1), .op14(rd_en_vc3_link4_vc2), .op15(rd_en_vc3_link4_vc3), .op16(rd_en_vc3_link4_vc4)	);
demux_16 dmux_opl1_4 (.ip(gnt_vc4), .sel({link_4,vc_id_4}), .op1(rd_en_vc4_link1_vc1), .op2(rd_en_vc4_link1_vc2), .op3(rd_en_vc4_link1_vc3), .op4(rd_en_vc4_link1_vc4), .op5(rd_en_vc4_link2_vc1), .op6(rd_en_vc4_link2_vc2), 
				.op7(rd_en_vc4_link2_vc3), .op8(rd_en_vc4_link2_vc4), .op9(rd_en_vc4_link3_vc1), .op10(rd_en_vc4_link3_vc2), .op11(rd_en_vc4_link3_vc3), .op12(rd_en_vc4_link3_vc4), .op13(rd_en_vc4_link4_vc1), .op14(rd_en_vc4_link4_vc2), .op15(rd_en_vc4_link4_vc3), .op16(rd_en_vc4_link4_vc4)	);
endmodule

