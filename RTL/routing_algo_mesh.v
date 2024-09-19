

////////////////////////////////////////////////////////////////////////////////
module routing_algo_mesh( header_in, current_address, reset, req_link1, req_link2, req_core,  req_link3, req_link4);

input [31:0] header_in;
input [7:0] current_address; 
input reset;

output req_link1, req_link2, req_core,  req_link3, req_link4;

reg req_link1, req_link2, req_core,  req_link3, req_link4;

supply0 gnd;
supply1 vdd;

wire eop, bop, header;
wire [3:0] dest_rn, dest_cn, curr_rn, curr_cn;

assign eop = header_in[30];
assign bop = header_in[29];
assign dest_rn = header_in[7:4];
assign dest_cn = header_in[3:0];

assign curr_rn = current_address[7:4];
assign curr_cn = current_address[3:0];


assign header = !eop && bop;

always @ (reset, eop, bop, dest_rn, dest_cn, curr_rn, curr_cn,header) 
begin
	  if(reset)
	  begin
	  req_link1 <= gnd; 
	  req_link2 <= gnd; 
	  req_link3 <= gnd; 
	  req_link4 <= gnd; 
	  req_core <= gnd; 
	  end

	  else
	  begin
	  		if(header)
			begin
				if(dest_rn > curr_rn)
					begin
				   	req_link1 <= vdd; 
	  			   	req_link2 <= gnd; 
	            			req_link3 <= gnd; 
	    				req_link4 <= gnd; 
	  				req_core <= gnd; 
					end

				else if(dest_rn < curr_rn)
					begin
				   	req_link1 <= gnd; 
	  			   	req_link2 <= vdd; 
	            			req_link3 <= gnd; 
	    				req_link4 <= gnd; 
	  				req_core <= gnd; 
					end

				else //if(dest_rn == curr_rn)
					begin
						if(dest_cn > curr_cn)
							begin
							req_link1 <= gnd; 
				  			req_link2 <= gnd; 
			            			req_link3 <= vdd; 
			    				req_link4 <= gnd; 
			  				req_core <= gnd; 
							end

						else if(dest_cn < curr_cn)
							begin
						   	req_link1 <= gnd; 
			  			   	req_link2 <= gnd; 
			            			req_link3 <= gnd; 
			    				req_link4 <= vdd; 
			  				req_core <= gnd; 
							end

						else
							begin
						   	req_link1 <= gnd; 
			  			   	req_link2 <= gnd; 
			            			req_link3 <= gnd; 
			    				req_link4 <= gnd; 
			  				req_core <= vdd; 
							end
				end  // dest_cn == curr_cn
					
			end	 // header
			
			else		// if not  a header
				begin
				req_link1 <= gnd; 
		  		req_link2 <= gnd; 
		   		req_link3 <= gnd; 
		   		req_link4 <= gnd; 
		  		req_core <= gnd; 
			end
	 	end
end   // end of always	 		 
endmodule





