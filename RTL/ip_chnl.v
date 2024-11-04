module ip_chnl (reset, rd_clk, wr_clk, rd_en, wr_en,  data_in, current_address, full_ext, empty_synch_rdclk, req_l1, req_l2, req_l3, req_l4, req_c, data_out, tailer, tailer_org, nxt_reset, data_sel, header, empty, fifo_out, header_flit, reg_out, mux_data_out, header_out);
	input reset, rd_clk, wr_clk, rd_en, wr_en ;
	 input [31:0] data_in ;
	 input [7:0] current_address ; 

	 output full_ext, empty_synch_rdclk ;
	 output req_l1, req_l2, req_l3, req_l4, req_c ;
    output [31:0] data_out ; 

	 output tailer ;
  
	 supply1 vdd ;
  	 output tailer_org, nxt_reset, data_sel ;
	 output header, empty ;
	 output [31:0] fifo_out, header_flit, reg_out, mux_data_out, header_out ; 
    
     reg [31:0] mux_data_out,header_out,data_out;
     reg clr1,header,tailer_org;

wire rd_en_out;
 
always@(fifo_out,reset,rd_en_out,rd_en,rd_clk,wr_clk)
begin
 header = (!fifo_out[30]) & fifo_out[29];
 tailer_org=(fifo_out[30] & (!fifo_out[29]));	
end	 


	

always@(reset,header,tailer,header_flit,fifo_out,rd_clk,wr_clk)
		begin
		clr1= reset | tailer;
//	assign header_out = (header == 1'b1 ) ? fifo_out : header_flit;

		if(header)
			header_out=fifo_out;
		else
			header_out=header_flit;
          
       end   

		





always@(data_sel,rd_en,header_flit,fifo_out,rd_clk )
	//void ip_chnl1_process()
//	assign mux_data_out = (data_sel == 1'b1) ? header_flit : fifo_out;
begin
if(rd_en)
	begin	
		if(data_sel)
			mux_data_out=header_flit;
		else
			mux_data_out=fifo_out;
	end	
else
			mux_data_out=32'b01100000000000000000000000000000;
end


always@(mux_data_out)
begin
data_out = mux_data_out;
end

//assign data_out = mux_data_out;


router_fifo  r1(.reset(reset), .rd_clk(rd_clk), .rd_en(rd_en_out), .data_in(data_in), 
   	.wr_clk(wr_clk), .wr_en(wr_en), .data_out(fifo_out), .full_int(full_ext), .empty(empty)) ;

register_32bit reg2(.dout(header_flit), .din(fifo_out), .clk(rd_clk), 
	                    .clr(clr1), .ce(header));
 
routing_algo_mesh mesh_logic(.header_in(header_out), .current_address(current_address), .reset(reset), .req_link1(req_l1), .req_link2(req_l2),.req_core(req_c),  .req_link3(req_l3),.req_link4(req_l4));
  
irs irs1 (.reset(reset), .empty(empty), .rd_en(rd_en), .rd_clk(rd_clk), .tailer_org(tailer_org), 
	.tailer(tailer), .rd_en_out(rd_en_out), .header(header), .data_sel(data_sel) );

dff_synch_reset dff_tailer (.d(tailer_org), .clk(rd_clk), .reset(reset), .q(tailer)) ;

dff_synch_set dff_empty(.d(empty), .clk(rd_clk), .set(reset), .q(empty_synch_rdclk)) ;

endmodule
