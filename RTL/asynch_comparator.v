`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/30/2018 08:13:27 PM
// Design Name: 
// Module Name: asynch_comparator
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


module asynch_comparator(rd_ptr, wr_ptr, rd_dir, wr_dir, full_int, empty);

    input [2:0] rd_ptr;
    input [2:0] wr_ptr;
    input rd_dir;
    input wr_dir;
  
    output full_int;
    output empty;

	 reg full_int, empty ;
	

	 //assign full_int = ((rd_ptr == wr_ptr) && (rd_dir != wr_dir)) ? 1'b 1 : 1'b 0 ;
	 //assign empty = ((rd_ptr == wr_ptr) && (rd_dir == wr_dir)) ? 1'b 1 : 1'b 0 ;

	 always @ (rd_ptr or wr_ptr or rd_dir or wr_dir)
	 begin
	 
	 
	       
             if (((rd_ptr == wr_ptr) && (rd_dir != wr_dir)))
                 full_int=1;
             else full_int=0;
     
             if (((rd_ptr == wr_ptr) && (rd_dir == wr_dir)))
                 empty=1;
             else empty=0;
	
	 end // end always...
endmodule
