// The next 2 lines lets us avoid multiple file inclusions. Multiple inclusions can lead to redefinition errors in compilor
`ifndef noc_pkt
`define noc_pkt
class noc_pkt extends uvm_sequence_item; // Inheriting from uvm_seq class

/*-------------------------------------------------------------------------------
-- Interface, port, fields
-------------------------------------------------------------------------------*/
logic[31:0] header_flit,payload_flit[],tailer_flit,invalid_flit; // flits needed for 1 full packet of data. dynamic array for payload.

// metadata for each packet in randomizable fields
rand bit[1:0] vc_id;
rand bit[7:0] src_addr,dst_addr;
rand logic[26:0] payload[];
rand bit[7:0] payload_len;
rand bit [7:0] core_num; // Core involved in process

// Vars for constraints dependent on ROWS and COLUMNS
bit[3:0] rl = NO_OF_ROWS-1;
bit[3:0] cl = NO_OF_COLUMNS-1;

// Constraints for a valid flit
constraint addr_con {src_addr!=dst_addr;}
constraint len_con {payload.size == payload_len+1;}
constraint src_row_con {src_addr[7:4] inside {[4'h0:rl]};}
constraint dst_row_con {dst_addr[7:4] inside {[4'h0:rl]};}
constraint src_col_con {src_addr[3:0] inside {[4'h0:cl]};}
constraint dst_col_con {dst_addr[3:0] inside {[4'h0:cl]};}

/*-------------------------------------------------------------------------------
-- UVM Factory register
-------------------------------------------------------------------------------*/
	// Provide implementations of virtual methods such as get_type_name and create
	// Allows for dynamic object creation and type information
	`uvm_object_utils(noc_pkt)

/*-------------------------------------------------------------------------------
-- Functions
-------------------------------------------------------------------------------*/
	// New constructor. No changes, it just inherits from parent class' constructor
	function new(string name = "noc_pkt");
		super.new(name);
	endfunction : new

	// Called after randomization of pkt object. Constructs header, payload and tailer flits based on the random values
	function void post_randomize();
		//(we're using the noc_pkg to access it because direct access is not allowed)
		header_flit = {1'b0,1'b0,1'b1,vc_id,11'b0,src_addr,dst_addr};
		payload_flit = new[payload.size];
		foreach(payload[i]) // Write into payload flit with correct addresses, vc, and payload data
			begin	
				payload_flit[i][31:27] = {1'b0,1'b0,1'b0,vc_id};
				payload_flit[i][26:0] = payload[i];
			end
		tailer_flit = {1'b0,1'b1,1'b0,vc_id,27'h0};
		invalid_flit = 32'h7fffffff;

		foreach(payload[i]) begin // populate the payload array with randomized payload from noc_pkg. This array then feeds to payload_flit array
			payload[i] = noc_pkg::pld[i]; // payload[] is populated from pld[] from noc_pkg package
		end
	endfunction : post_randomize

endclass : noc_pkt
`endif
