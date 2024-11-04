module gray_mod8(clk, reset, en, gray_out, dir);
	input clk ;
	input reset ;
	input en ;
	output [2:0] gray_out ;
	output dir ;
   supply1 vcc;

	wire [2:0] gray_out ;
	wire dir, x ;
	wire j0, k0, j1, k1, j2, k2 ;
	wire q0, q1, q2, q0_bar, q1_bar, q2_bar, q3_bar ;

	assign j0 = ~(q1 ^ q2);
	assign k0 = (q1 ^ q2);
	
	assign j1 = q2_bar & q0;
	assign k1 = q0 & q2 ;

	assign j2 = (q1 & q0_bar);
	assign k2 = (q0_bar & q1_bar) ;

	jk_ff jk0(.j(j0), .k(k0), .reset(reset), .en(en), .clk(clk), .q(q0), .qbar(q0_bar));
	jk_ff jk1(.j(j1), .k(k1), .reset(reset), .en(en), .clk(clk), .q(q1), .qbar(q1_bar));
	jk_ff jk2(.j(j2), .k(k2), .reset(reset), .en(en), .clk(clk), .q(q2), .qbar(q2_bar));

	assign gray_out[2] = q2 ;
	assign gray_out[1] = q1 ;
	assign gray_out[0] = q0 ;

	assign x = ((q2 & q1_bar & q0_bar) == 1'b 1) ? 1'b 1 : 1'b 0 ;
	jk_ff jk3(.j(vcc), .k(vcc), .reset(reset), .en(vcc), .clk(! x), .q(dir), .qbar(q3_bar));



endmodule
