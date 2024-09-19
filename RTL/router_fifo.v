 ////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////

module router_fifo(reset, rd_clk, rd_en, data_in, wr_clk,  wr_en,rd_add, wr_add, wr_dir, rd_dir
                   ,data_out,full_int, empty) ; 
    input reset ;
    input rd_clk ; 	 
	 input rd_en ;
	 input [31:0] data_in ;
    input wr_clk ;
    input wr_en ;
     
     output wr_dir, rd_dir;
     output [2:0] rd_add, wr_add;
	 output [31:0] data_out ;
	 output full_int, empty ;

	 assign wen_int = wr_en & (! full_int) ;
	 assign ren_int = rd_en & (! empty) ;
	 
	 gray_mod8 wr_counter (.clk(wr_clk), .reset(reset), .en(wen_int), 
	                       .gray_out(wr_add), .dir(wr_dir));

	 gray_mod8 rd_counter (.clk(rd_clk), .reset(reset), .en(ren_int), 
	                       .gray_out(rd_add), .dir(rd_dir));
	 
	 memory m1(.reset(reset), .rd_clk(rd_clk), .rd_add(rd_add), .wr_clk(wr_clk), 
	 .wr_add(wr_add), .data_in(data_in), .wr_en(wen_int), .rd_en(ren_int), .data_out(data_out));
	 
	 asynch_comparator comp1 (.rd_ptr(rd_add), .wr_ptr(wr_add), .rd_dir(rd_dir), 
	 .wr_dir(wr_dir), .full_int(full_int), .empty(empty)); 
	 
endmodule
