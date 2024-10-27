 `timescale 1ns / 1ps

module allot_vc(reset, rd_clk, encoded_addr, g1, g2, g3, g4, g5, g6, g7, g8, g9, g10, g11, 
                g12, g13, g14, g15, g16, link_1, vc_id_1, link_2, vc_id_2, link_3, vc_id_3, 
					 link_4, vc_id_4, b1, b2, b3, b4, tailer1, tailer2, tailer3, tailer4, tailer5,
					 tailer6, tailer7, tailer8, tailer9, tailer10, tailer11, tailer12, tailer13, 
					 tailer14, tailer15, tailer16, gnt_or, ce_b1, ce_b2, ce_b3, ce_b4, clr_b1, 
					 clr_b2, clr_b3, clr_b4,e1,e2,e3,e4 
					);

	input reset, rd_clk;
	input [3:0] encoded_addr;

	input g1, g2, g3, g4 ;
   input g5, g6, g7, g8 ;
   input g9, g10, g11, g12 ;
   input g13, g14, g15, g16 ;
	 
	input tailer1, tailer2, tailer3, tailer4 ;
	input tailer5, tailer6, tailer7, tailer8 ;
	input tailer9, tailer10, tailer11, tailer12 ;
	input tailer13, tailer14, tailer15, tailer16 ;

	output  [1:0] link_1, link_2, link_3, link_4 ;
	wire [1:0] alink_1, alink_2, alink_3, alink_4  ;
   output [1:0] vc_id_1, vc_id_2, vc_id_3, vc_id_4; 
   wire [1:0] avc_id_1, avc_id_2, avc_id_3, avc_id_4 ;

   output b1, b2, b3, b4 ;

   output  gnt_or;
   output ce_b1, ce_b2, ce_b3, ce_b4;
   output clr_b1, clr_b2, clr_b3, clr_b4;
 output  [3:0] e1,e2,e3,e4;
 reg ce_b1, ce_b2, ce_b3, ce_b4;
  reg clr_b1,clr_b2,clr_b3,clr_b4 ;
  //reg clr_b1,clr_b2,clr_b3,clr_b4 ;
	
	
	wire mux_out1,mux_out2,mux_out3,mux_out4;  
   //wire mux_in [15:0] ;
   
   assign gnt_or=g1|g2|g3|g4|g5|g6|g7|g8|g9|g10|g11|g12|g13|g14|g15|g16;
   
  // always@(e1,e2,e3,e4,rd_clk)
	//begin
		//high.write(true);

		
		
		assign avc_id_1[0]=e1[0];
		assign avc_id_1[1]=e1[1];		
		assign alink_1[0]=e1[2];
		assign alink_1[1]=e1[3];
		assign avc_id_2[0]=e2[0];
		assign avc_id_2[1]=e2[1];		
		assign alink_2[0]=e2[2];
		assign alink_2[1]=e2[3];
		assign avc_id_3[0]=e3[0];
		assign avc_id_3[1]=e3[1];		
		assign alink_3[0]=e3[2];
		assign alink_3[1]=e3[3];
		assign avc_id_4[0]=e4[0];
		assign avc_id_4[1]=e4[1];		
		assign alink_4[0]=e4[2];
		assign alink_4[1]=e4[3];
		assign vc_id_1=avc_id_1;
		assign vc_id_2=avc_id_2;
		assign vc_id_3=avc_id_3;
		assign vc_id_4=avc_id_4;
		assign link_1=alink_1;
		assign link_2=alink_2;
		assign link_3=alink_3;
		assign link_4=alink_4;
//	end

always@(gnt_or,b1,b2,b3,b4,rd_clk/*,mux_out1,mux_out2,mux_out3,mux_out4*/)
	begin
		ce_b1<=/*@(posedge rd_clk)*/(!b1) & gnt_or;
		ce_b2<=/*@(posedge rd_clk)*/ b1 & (!b2) & gnt_or;
		ce_b3<=/*@(posedge rd_clk)*/ b1 & b2 & (!b3) & gnt_or;
		ce_b4<=/*@(posedge rd_clk)*/b1 & b2 & b3 & (!b4) & gnt_or;

        
           
        		

	end
	  
/*
	assign ce_b1 = !b1 &&  gnt_or ;
    assign ce_b2 =  b1 && !b2 && gnt_or ;  
    assign ce_b3 =  b1 &&  b2 && !b3 && gnt_or ;
    assign ce_b4 =  b1 &&  b2 &&  b3 && !b4 & gnt_or ;
	                 
     assign clr_b1 = mux_out1;
     assign clr_b2 = mux_out2;
     assign clr_b3 = mux_out3;
     assign clr_b4 = mux_out4;
    */ 
                                    
   
  always@(mux_out1,mux_out2,mux_out3,mux_out4,rd_clk,reset)
   begin
      if(reset)
      begin
       clr_b1=0;clr_b2=0;clr_b3=0;clr_b4=0;
      end
   
   else
   
   begin
   clr_b1<=/*@(posedge rd_clk)*/mux_out1;
           clr_b2<=/*@(posedge rd_clk)*/mux_out2;
           clr_b3<=/*@(posedge rd_clk)*/mux_out3;
           clr_b4<=/*@(posedge rd_clk)*/mux_out4;
   end
   end
   
   
   
   
/*
	assign gnt_or = (g1 | g2 | g3 | g4 | g5 | g6 | g7 | g8 | g9 | g10 | g11 | g12 | g13 | g14 | g15 | g16); 

	always @ (rd_clk,gnt_or,b1,b2,b3,b4,link_1, vc_id_1,link_2, vc_id_2,
	          link_3, vc_id_3,link_4, vc_id_4)   
	begin
   		ce_b1 = !b1 &  gnt_or ;
			ce_b2 =  b1 & !b2 & gnt_or ;  
			ce_b3 =  b1 &  b2 & !b3 & gnt_or ;
			ce_b4 =  b1 &  b2 &  b3 & !b4 & gnt_or ;
			
			
 	end
		
	register_1bit r1_1(.din(1'b 1), .clk(rd_clk), .ce(ce_b1), .clr(clr_b1), .dout(b1));
         register_1bit r1_2(.din(1'b 1), .clk(rd_clk), .ce(ce_b2), .clr(clr_b2), .dout(b2));
         register_1bit r1_3(.din(1'b 1), .clk(rd_clk), .ce(ce_b3), .clr(clr_b3), .dout(b3));
         register_1bit r1_4(.din(1'b 1), .clk(rd_clk), .ce(ce_b4), .clr(clr_b4), .dout(b4));
     
         register_4bit r4_1(.din(encoded_addr), .clk(rd_clk), .ce(ce_b1), .clr(reset), .dout({link_1,vc_id_1}));
         register_4bit r4_2(.din(encoded_addr), .clk(rd_clk), .ce(ce_b2), .clr(reset), .dout({link_2,vc_id_2}));
         register_4bit r4_3(.din(encoded_addr), .clk(rd_clk), .ce(ce_b3), .clr(reset), .dout({link_3,vc_id_3}));
         register_4bit r4_4(.din(encoded_addr), .clk(rd_clk), .ce(ce_b4), .clr(reset), .dout({link_4,vc_id_4}));
     
     */
     
     register_1bit r1_1(.din(1'b1),
		.clk(rd_clk),
		.ce(ce_b1),
		.clr(clr_b1),
		.reset(reset),
		.dout(b1));

		register_1bit r1_2(.din(1'b1),
		.clk(rd_clk),
		.ce(ce_b2),
		.clr(clr_b2),
		.reset(reset),
		.dout(b2));

		register_1bit r1_3(.din(1'b1),
		.clk(rd_clk),
		.ce(ce_b3),
		.clr(clr_b3),
		.reset(reset),
		.dout(b3));

		register_1bit r1_4(.din(1'b1),
		.clk(rd_clk),
		.ce(ce_b4),
		.clr(clr_b4),
		.reset(reset),
		.dout(b4));

		register_4bit r4_1(.din(encoded_addr),
		.clk(rd_clk),
		.ce(ce_b1),
		.clr(reset),
		.dout(e1));

		register_4bit r4_2(.din(encoded_addr),
		.clk(rd_clk),
		.ce(ce_b2),
		.clr(reset),
		.dout(e2));

		register_4bit r4_3(.din(encoded_addr),
		.clk(rd_clk),
		.ce(ce_b3),
		.clr(reset),
		.dout(e3));

		register_4bit r4_4(.din(encoded_addr),
		.clk(rd_clk),
		.ce(ce_b4),
		.clr(reset),
		.dout(e4));

		mux m1(.t1(tailer1),
		.t2(tailer2),
		.t3(tailer3),
		.t4(tailer4),
		.t5(tailer5),
		.t6(tailer6),
		.t7(tailer7),
		.t8(tailer8),	
		.t9(tailer9),		
		.t10(tailer10),
		.t11(tailer11),
		.t12(tailer12),
		.t13(tailer13),
		.t14(tailer14),
		.t15(tailer15),
		.t16(tailer16),
		.sel(e1),
		.clk(rd_clk),
		.m_out(mux_out1));
		


		mux m2(.t1(tailer1),
		.t2(tailer2),
		.t3(tailer3),
		.t4(tailer4),
		.t5(tailer5),
		.t6(tailer6),
		.t7(tailer7),
		.t8(tailer8),	
		.t9(tailer9),		
		.t10(tailer10),
		.t11(tailer11),
		.t12(tailer12),
		.t13(tailer13),
		.t14(tailer14),
		.t15(tailer15),
		.t16(tailer16),
		.sel(e2),
		.clk(rd_clk),
		.m_out(mux_out2));


		mux m3(.t1(tailer1),
		.t2(tailer2),
		.t3(tailer3),
		.t4(tailer4),
		.t5(tailer5),
		.t6(tailer6),
		.t7(tailer7),
		.t8(tailer8),	
		.t9(tailer9),		
		.t10(tailer10),
		.t11(tailer11),
		.t12(tailer12),
		.t13(tailer13),
		.t14(tailer14),
		.t15(tailer15),
		.t16(tailer16),
		.sel(e3),
		.clk(rd_clk),
		.m_out(mux_out3));


		mux m4(.t1(tailer1),
		.t2(tailer2),
		.t3(tailer3),
		.t4(tailer4),
		.t5(tailer5),
		.t6(tailer6),
		.t7(tailer7),
		.t8(tailer8),	
		.t9(tailer9),		
		.t10(tailer10),
		.t11(tailer11),
		.t12(tailer12),
		.t13(tailer13),
		.t14(tailer14),
		.t15(tailer15),
		.t16(tailer16),
		.clk(rd_clk),
		.sel(e4),
		.m_out(mux_out4));

    // always@(rd_clk,g1,g2,g3,g4,g5,g6,g7,g8,g9,g10,g11,g12,g13,g14,g15,g16,tailer16, tailer15, tailer14, tailer13, tailer12, tailer11, tailer10, 
      //                             tailer9, tailer8, tailer7, tailer6, tailer5, tailer4, tailer3, tailer2, 
        //                                tailer1)
     //begin
       //assign  mux_in = {tailer16, tailer15, tailer14, tailer13, tailer12, tailer11, tailer10, 
         //                 tailer9, tailer8, tailer7, tailer6, tailer5, tailer4, tailer3, tailer2, 
           //                    tailer1 };
     //end
     
    // assign  mux_in = {tailer1, tailer2, tailer3, tailer4, tailer5, tailer6, tailer7, 
      //                         tailer8, tailer9, tailer10, tailer11, tailer12, tailer13, tailer14, tailer15, 
        //                            tailer16 };
      /*   
     assign mux_in[0] = tailer1;
            assign mux_in[1] = tailer2;
            assign mux_in[2] = tailer3;
            assign mux_in[3] = tailer4;
            assign mux_in[4] = tailer5;
            assign mux_in[5] = tailer6;
            assign mux_in[6] = tailer7;
            assign mux_in[7] = tailer8;
            assign mux_in[8] = tailer9;
            assign mux_in[9] = tailer10;
            assign mux_in[10] = tailer11;
            assign mux_in[11] = tailer12;
            assign mux_in[12] = tailer13;
            assign mux_in[13] = tailer14;
            assign mux_in[14] = tailer15;
             assign mux_in[15] = tailer16;    
         
         
     assign clr_b1 = mux_in[{link_1, vc_id_1}];
     assign clr_b2 = mux_in[{link_2, vc_id_2}];
     assign clr_b3 = mux_in[{link_3, vc_id_3}];
     assign clr_b4 = mux_in[{link_4, vc_id_4}];  
	
*/
endmodule
