 `timescale 1ns / 1ps

module ip_link(reset, rd_clk, wr_clk, data_in, current_address,

					data_out_vc1, data_out_vc2, data_out_vc3, data_out_vc4,					 
					
					full_vc1, full_vc2, full_vc3, full_vc4, 
					
					req_l1_vc1, req_l1_vc2, req_l1_vc3, req_l1_vc4, 
					req_l2_vc1, req_l2_vc2, req_l2_vc3, req_l2_vc4, 
					req_l3_vc1, req_l3_vc2,	req_l3_vc3, req_l3_vc4, 
					req_l4_vc1, req_l4_vc2, req_l4_vc3, req_l4_vc4,
					req_c_vc1, req_c_vc2, req_c_vc3, req_c_vc4,

					rd_en1, rd_en2, rd_en3, rd_en4, rd_en5, rd_en6, rd_en7, rd_en8, rd_en9,
					rd_en10, rd_en11, rd_en12, rd_en13, rd_en14, rd_en15, rd_en16, rd_en17, 
					rd_en18, rd_en19, rd_en20, rd_en21, rd_en22, rd_en23, rd_en24, rd_en25, 
					rd_en26, rd_en27, rd_en28, rd_en29, rd_en30, rd_en31, rd_en32, rd_en33, 
					rd_en34, rd_en35, rd_en36, rd_en37, rd_en38, rd_en39, rd_en40, rd_en41, 
					rd_en42, rd_en43, rd_en44, rd_en45, rd_en46, rd_en47, rd_en48, rd_en49, 
					rd_en50, rd_en51, rd_en52, rd_en53, rd_en54, rd_en55, rd_en56, rd_en57, 
					rd_en58, rd_en59, rd_en60, rd_en61, rd_en62, rd_en63, rd_en64, 
					
					tailer_vc1, tailer_vc2, tailer_vc3, tailer_vc4,

					rok_vc1, rok_vc2, rok_vc3, rok_vc4 ); 
					input reset, rd_clk, wr_clk;
	 input [31:0] data_in;
	 input [7:0] current_address; 
	 input rd_en1, rd_en2, rd_en3, rd_en4, rd_en5, rd_en6, rd_en7, rd_en8, rd_en9, rd_en10;
	 input rd_en11, rd_en12, rd_en13, rd_en14, rd_en15, rd_en16, rd_en17, rd_en18, rd_en19, rd_en20;
	 input rd_en21, rd_en22, rd_en23, rd_en24, rd_en25, rd_en26, rd_en27, rd_en28, rd_en29, rd_en30;
	 input rd_en31, rd_en32, rd_en33, rd_en34, rd_en35, rd_en36, rd_en37, rd_en38, rd_en39, rd_en40;
	 input rd_en41, rd_en42, rd_en43, rd_en44, rd_en45, rd_en46, rd_en47, rd_en48;
	 input rd_en49, rd_en50, rd_en51, rd_en52, rd_en53, rd_en54, rd_en55, rd_en56, rd_en57, rd_en58, rd_en59, rd_en60, rd_en61, rd_en62, rd_en63, rd_en64;
	 output [31:0] data_out_vc1, data_out_vc2, data_out_vc3, data_out_vc4;
	 output req_l1_vc1, req_l1_vc2, req_l1_vc3, req_l1_vc4, req_l2_vc1, req_l2_vc2, req_l2_vc3, req_l2_vc4, req_l3_vc1, req_l3_vc2, req_l3_vc3, req_l3_vc4, req_l4_vc1, req_l4_vc2, req_l4_vc3, req_l4_vc4,
	        req_c_vc1, req_c_vc2, req_c_vc3, req_c_vc4;  	
	 output tailer_vc1, tailer_vc2, tailer_vc3, tailer_vc4;
	 output full_vc1, full_vc2, full_vc3, full_vc4;
	 output rok_vc1, rok_vc2, rok_vc3, rok_vc4; 
	 wire rd_en_vc1, rd_en_vc2, rd_en_vc3, rd_en_vc4 ;
	 wire wr_en_vc1, wr_en_vc2, wr_en_vc3, wr_en_vc4 ;
    wire empty_vc1, empty_vc2, empty_vc3, empty_vc4 ;
	 wire sel_vc1, sel_vc2, sel_vc3, sel_vc4, in_val ; 
	 assign in_val = !(data_in[30] & data_in[29]) ;
	 assign sel_vc1 = (! data_in[28] & ! data_in[27]) ;
	 assign sel_vc2 = (! data_in[28] &   data_in[27]) ;
	 assign sel_vc3 = (  data_in[28] & ! data_in[27]) ;
	 assign sel_vc4 = (  data_in[28] &   data_in[27]) ;
	 assign wr_en_vc1 = sel_vc1 & in_val ;
	 assign wr_en_vc2 = sel_vc2 & in_val ;
	 assign wr_en_vc3 = sel_vc3 & in_val ;
	 assign wr_en_vc4 = sel_vc4 & in_val ;
	 assign rok_vc1 = ! empty_vc1 ;
	 assign rok_vc2 = ! empty_vc2 ;
	 assign rok_vc3 = ! empty_vc3 ;
	 assign rok_vc4 = ! empty_vc4 ;
	 assign rd_en_vc1 = | {rd_en1, rd_en2, rd_en3, rd_en4, rd_en5, rd_en6, rd_en7, rd_en8, rd_en9, rd_en10, rd_en11, rd_en12, rd_en13, rd_en14, rd_en15, rd_en16}; 
	 assign rd_en_vc2 = | {rd_en17, rd_en18, rd_en19, rd_en20, rd_en21, rd_en22, rd_en23, rd_en24, rd_en25, rd_en26, rd_en27, rd_en28, rd_en29, rd_en30, rd_en31, rd_en32};
    assign rd_en_vc3 = | {rd_en33, rd_en34, rd_en35, rd_en36, rd_en37, rd_en38, rd_en39, rd_en40, rd_en41, rd_en42, rd_en43, rd_en44, rd_en45, rd_en46, rd_en47, rd_en48};
	 assign rd_en_vc4 = | {rd_en49, rd_en50, rd_en51, rd_en52, rd_en53, rd_en54, rd_en55, rd_en56, rd_en57, rd_en58, rd_en59, rd_en60, rd_en61, rd_en62, rd_en63, rd_en64};
	 ip_chnl vc1 (
    .reset(reset), 
    .data_in(data_in), 
    .wr_clk(wr_clk), 
    .full_ext(full_vc1), 
    .rd_clk(rd_clk), 
    .rd_en(rd_en_vc1), 
	 .wr_en(wr_en_vc1), 
    .data_out(data_out_vc1), 
    .empty_synch_rdclk(empty_vc1), 
    .current_address(current_address), 
    .req_l1(req_l1_vc1), 
    .req_l2(req_l2_vc1), 
    .req_l3(req_l3_vc1), 
    .req_l4(req_l4_vc1),
	 .req_c(req_c_vc1),  
    .tailer(tailer_vc1)
    );
    ip_chnl vc2 (
    .reset(reset), 
    .rd_clk(rd_clk), 
    .wr_clk(wr_clk), 
    .rd_en(rd_en_vc2), 
	 .wr_en(wr_en_vc2), 
    .data_in(data_in), 
    .data_out(data_out_vc2), 
    .full_ext(full_vc2), 
    .empty_synch_rdclk(empty_vc2), 
    .current_address(current_address), 
    .req_l1(req_l1_vc2), 
    .req_l2(req_l2_vc2), 
	 .req_l3(req_l3_vc2), 
    .req_l4(req_l4_vc2), 
    .req_c(req_c_vc2),
	 .tailer(tailer_vc2)
    ); 
    ip_chnl vc3 (
    .reset(reset), 
    .rd_clk(rd_clk), 
    .wr_clk(wr_clk), 
    .rd_en(rd_en_vc3), 
	 .wr_en(wr_en_vc3), 
    .data_in(data_in), 
    .data_out(data_out_vc3), 
    .full_ext(full_vc3), 
    .empty_synch_rdclk(empty_vc3), 
    .current_address(current_address), 
    .req_l1(req_l1_vc3), 
    .req_l2(req_l2_vc3), 
	 .req_l3(req_l3_vc3), 
    .req_l4(req_l4_vc3), 
    .req_c(req_c_vc3),
	 .tailer(tailer_vc3)
    );
    ip_chnl vc4 (
    .reset(reset), 
    .rd_clk(rd_clk), 
    .wr_clk(wr_clk), 
    .rd_en(rd_en_vc4), 
	 .wr_en(wr_en_vc4),
    .data_in(data_in), 
    .data_out(data_out_vc4), 
    .full_ext(full_vc4), 
    .empty_synch_rdclk(empty_vc4), 
    .current_address(current_address), 
    .req_l1(req_l1_vc4), 
    .req_l2(req_l2_vc4), 
	 .req_l3(req_l3_vc4), 
    .req_l4(req_l4_vc4), 
    .req_c(req_c_vc4),
	 .tailer(tailer_vc4)
    );

endmodule

