module op_data_path(data_from_link1_ch1, data_from_link1_ch2, data_from_link1_ch3, data_from_link1_ch4,
						  data_from_link2_ch1, data_from_link2_ch2, data_from_link2_ch3, data_from_link2_ch4,
						  data_from_link3_ch1, data_from_link3_ch2, data_from_link3_ch3, data_from_link3_ch4, 
                    data_from_link4_ch1, data_from_link4_ch2, data_from_link4_ch3, data_from_link4_ch4,
						  data_from_core_ch1, data_from_core_ch2, data_from_core_ch3, data_from_core_ch4,
						  sel_vc_link1, sel_vc_link2, sel_vc_link3, sel_vc_link4, sel_vc_core, 
						  gnt_vc_link1_ch1, gnt_vc_link1_ch2, gnt_vc_link1_ch3, gnt_vc_link1_ch4,
						  gnt_vc_link2_ch1, gnt_vc_link2_ch2, gnt_vc_link2_ch3, gnt_vc_link2_ch4,
						  gnt_vc_link3_ch1, gnt_vc_link3_ch2, gnt_vc_link3_ch3, gnt_vc_link3_ch4,
						  gnt_vc_link4_ch1, gnt_vc_link4_ch2, gnt_vc_link4_ch3, gnt_vc_link4_ch4, 
						  gnt_vc_core_ch1, gnt_vc_core_ch2, gnt_vc_core_ch3, gnt_vc_core_ch4,
						  data_out_link1 , data_out_link2, data_out_link3, data_out_link4, data_out_core,
						  data_out_l1, data_out_l2, data_out_l3, data_out_l4, data_out_c
						  ,rd_clk1, rd_clk2, rd_clk3, rd_clk4, rd_clk_core);
					 
    input [31:0] data_from_link1_ch1;    
    input [31:0] data_from_link1_ch2;
    input [31:0] data_from_link1_ch3;
    input [31:0] data_from_link1_ch4;
    input [31:0] data_from_link2_ch1;
    input [31:0] data_from_link2_ch2;
    input [31:0] data_from_link2_ch3;
    input [31:0] data_from_link2_ch4;
    input [31:0] data_from_link3_ch1;
    input [31:0] data_from_link3_ch2;
    input [31:0] data_from_link3_ch3;
    input [31:0] data_from_link3_ch4;
    input [31:0] data_from_link4_ch1;
    input [31:0] data_from_link4_ch2;
    input [31:0] data_from_link4_ch3;
    input [31:0] data_from_link4_ch4, data_from_core_ch1, data_from_core_ch2, data_from_core_ch3, data_from_core_ch4;
	 input [3:0] sel_vc_link1, sel_vc_link2, sel_vc_link3, sel_vc_link4, sel_vc_core;
	 	 
	 input gnt_vc_link1_ch1, gnt_vc_link1_ch2, gnt_vc_link1_ch3, gnt_vc_link1_ch4;
	 input gnt_vc_link2_ch1, gnt_vc_link2_ch2, gnt_vc_link2_ch3, gnt_vc_link2_ch4;
	 input gnt_vc_link3_ch1, gnt_vc_link3_ch2, gnt_vc_link3_ch3, gnt_vc_link3_ch4;
	 input gnt_vc_link4_ch1, gnt_vc_link4_ch2, gnt_vc_link4_ch3, gnt_vc_link4_ch4;
	 input gnt_vc_core_ch1, gnt_vc_core_ch2, gnt_vc_core_ch3, gnt_vc_core_ch4;
	 input rd_clk1, rd_clk2, rd_clk3, rd_clk4, rd_clk_core;
	 
	 
	 output [31:0] data_out_link1 , data_out_link2, data_out_link3, data_out_link4, data_out_core;
	 wire [31:0] mux_in_l1[15:0];
	 wire [31:0] mux_in_l2[15:0];
	 wire [31:0] mux_in_l3[15:0];
	 wire [31:0] mux_in_l4[15:0];
	 wire [31:0] mux_in_c[15:0];
	 
	 
	 ////////////////////////////////
	  output [31:0] data_out_l1, data_out_l2, data_out_l3, data_out_l4, data_out_c;
	 
	 wire l1_b1, l1_b0, l2_b1, l2_b0, l3_b1, l3_b0, l4_b1, l4_b0, c_b1, c_b0;
	 	 assign mux_in_l1[0] = data_from_link2_ch1;
    assign mux_in_l1[1] = data_from_link2_ch2;
    assign mux_in_l1[2] = data_from_link2_ch3;
    assign mux_in_l1[3] = data_from_link2_ch4;
    assign mux_in_l1[4] = data_from_link3_ch1;
    assign mux_in_l1[5] = data_from_link3_ch2;
    assign mux_in_l1[6] = data_from_link3_ch3;
    assign mux_in_l1[7] = data_from_link3_ch4;
    assign mux_in_l1[8] = data_from_link4_ch1;
    assign mux_in_l1[9] = data_from_link4_ch2;
    assign mux_in_l1[10] = data_from_link4_ch3;
    assign mux_in_l1[11] = data_from_link4_ch4;
    assign mux_in_l1[12] = data_from_core_ch1;
    assign mux_in_l1[13] = data_from_core_ch2;
    assign mux_in_l1[14] = data_from_core_ch3;
	 assign mux_in_l1[15] = data_from_core_ch4;


 	 assign mux_in_l2[0] = data_from_link1_ch1;
    assign mux_in_l2[1] = data_from_link1_ch2;
    assign mux_in_l2[2] = data_from_link1_ch3;
    assign mux_in_l2[3] = data_from_link1_ch4;
    assign mux_in_l2[4] = data_from_link3_ch1;
    assign mux_in_l2[5] = data_from_link3_ch2;
    assign mux_in_l2[6] = data_from_link3_ch3;
    assign mux_in_l2[7] = data_from_link3_ch4;
    assign mux_in_l2[8] = data_from_link4_ch1;
    assign mux_in_l2[9] = data_from_link4_ch2;
    assign mux_in_l2[10] = data_from_link4_ch3;
    assign mux_in_l2[11] = data_from_link4_ch4;
    assign mux_in_l2[12] = data_from_core_ch1;
    assign mux_in_l2[13] = data_from_core_ch2;
    assign mux_in_l2[14] = data_from_core_ch3;
	 assign mux_in_l2[15] = data_from_core_ch4;


	 assign mux_in_l3[0] = data_from_link1_ch1;
    assign mux_in_l3[1] = data_from_link1_ch2;
    assign mux_in_l3[2] = data_from_link1_ch3;
    assign mux_in_l3[3] = data_from_link1_ch4;
    assign mux_in_l3[4] = data_from_link2_ch1;
    assign mux_in_l3[5] = data_from_link2_ch2;
    assign mux_in_l3[6] = data_from_link2_ch3;
    assign mux_in_l3[7] = data_from_link2_ch4;
    assign mux_in_l3[8] = data_from_link4_ch1;
    assign mux_in_l3[9] = data_from_link4_ch2;
    assign mux_in_l3[10] = data_from_link4_ch3;
    assign mux_in_l3[11] = data_from_link4_ch4;
    assign mux_in_l3[12] = data_from_core_ch1;
    assign mux_in_l3[13] = data_from_core_ch2;
    assign mux_in_l3[14] = data_from_core_ch3;
	 assign mux_in_l3[15] = data_from_core_ch4;


	 assign mux_in_l4[0] = data_from_link1_ch1;
    assign mux_in_l4[1] = data_from_link1_ch2;
    assign mux_in_l4[2] = data_from_link1_ch3;
    assign mux_in_l4[3] = data_from_link1_ch4;
    assign mux_in_l4[4] = data_from_link2_ch1;
    assign mux_in_l4[5] = data_from_link2_ch2;
    assign mux_in_l4[6] = data_from_link2_ch3;
    assign mux_in_l4[7] = data_from_link2_ch4;
    assign mux_in_l4[8] = data_from_link3_ch1;
    assign mux_in_l4[9] = data_from_link3_ch2;
    assign mux_in_l4[10] = data_from_link3_ch3;
    assign mux_in_l4[11] = data_from_link3_ch4;
    assign mux_in_l4[12] = data_from_core_ch1;
    assign mux_in_l4[13] = data_from_core_ch2;
    assign mux_in_l4[14] = data_from_core_ch3;
	 assign mux_in_l4[15] = data_from_core_ch4;


	 assign mux_in_c[0] = data_from_link1_ch1;
    assign mux_in_c[1] = data_from_link1_ch2;
    assign mux_in_c[2] = data_from_link1_ch3;
    assign mux_in_c[3] = data_from_link1_ch4;
    assign mux_in_c[4] = data_from_link2_ch1;
    assign mux_in_c[5] = data_from_link2_ch2;
    assign mux_in_c[6] = data_from_link2_ch3;
    assign mux_in_c[7] = data_from_link2_ch4;
    assign mux_in_c[8] = data_from_link3_ch1;
    assign mux_in_c[9] = data_from_link3_ch2;
    assign mux_in_c[10] = data_from_link3_ch3;
    assign mux_in_c[11] = data_from_link3_ch4;
    assign mux_in_c[12] = data_from_link4_ch1;
    assign mux_in_c[13] = data_from_link4_ch2;
    assign mux_in_c[14] = data_from_link4_ch3;
	 assign mux_in_c[15] = data_from_link4_ch4;

/////////////// *********** ???????????????? ***************** ///////////////////

	 assign data_out_l1 =  mux_in_l1[sel_vc_link1];
	 assign data_out_l2 =  mux_in_l2[sel_vc_link2];
	 assign data_out_l3 =  mux_in_l3[sel_vc_link3];
	 assign data_out_l4 =  mux_in_l4[sel_vc_link4];
	 assign data_out_c  =  mux_in_c [sel_vc_core] ;

	
	 assign l1_b1 =  (gnt_vc_link1_ch3 | gnt_vc_link1_ch4);
	 assign l1_b0 =  (gnt_vc_link1_ch2 | gnt_vc_link1_ch4);

	 assign l2_b1 =  (gnt_vc_link2_ch3 | gnt_vc_link2_ch4);
	 assign l2_b0 =  (gnt_vc_link2_ch2 | gnt_vc_link2_ch4);

	 assign l3_b1 =  (gnt_vc_link3_ch3 | gnt_vc_link3_ch4);
	 assign l3_b0 =  (gnt_vc_link3_ch2 | gnt_vc_link3_ch4);

	 assign l4_b1 =  (gnt_vc_link4_ch3 | gnt_vc_link4_ch4);
	 assign l4_b0 =  (gnt_vc_link4_ch2 | gnt_vc_link4_ch4);

	 assign c_b1 =  (gnt_vc_core_ch3 | gnt_vc_core_ch4);
	 assign c_b0 =  (gnt_vc_core_ch2 | gnt_vc_core_ch4);

	 assign gnt_or_l1 = (gnt_vc_link1_ch1 | gnt_vc_link1_ch2 | gnt_vc_link1_ch3 | gnt_vc_link1_ch4);
	 assign gnt_or_l2 = (gnt_vc_link2_ch1 | gnt_vc_link2_ch2 | gnt_vc_link2_ch3 | gnt_vc_link2_ch4);
	 assign gnt_or_l3 = (gnt_vc_link3_ch1 | gnt_vc_link3_ch2 | gnt_vc_link3_ch3 | gnt_vc_link3_ch4);
	 assign gnt_or_l4 = (gnt_vc_link4_ch1 | gnt_vc_link4_ch2 | gnt_vc_link4_ch3 | gnt_vc_link4_ch4);
	 assign gnt_or_c  = (gnt_vc_core_ch1 | gnt_vc_core_ch2 | gnt_vc_core_ch3 | gnt_vc_core_ch4);
final_op_data fop_l1 (.data_in(data_out_l1), .vc_id({l1_b1, l1_b0}), .gnt_or(gnt_or_l1), .data_out(data_out_link1) );
final_op_data fop_l2 (.data_in(data_out_l2), .vc_id({l2_b1, l2_b0}), .gnt_or(gnt_or_l2), .data_out(data_out_link2) );
final_op_data fop_l3 (.data_in(data_out_l3), .vc_id({l3_b1, l3_b0}), .gnt_or(gnt_or_l3), .data_out(data_out_link3) );
final_op_data fop_l4 (.data_in(data_out_l4), .vc_id({l4_b1, l4_b0}), .gnt_or(gnt_or_l4), .data_out(data_out_link4) );
final_op_data fop_c (.data_in(data_out_c), .vc_id({c_b1, c_b0}), .gnt_or(gnt_or_c), .data_out(data_out_core) );

endmodule


