`ifndef noc_coverage
`define noc_coverage
class noc_coverage extends uvm_agent;
	/*-------------------------------------------------------------------------------
	-- Interface, port, fields
	-------------------------------------------------------------------------------*/

   uvm_tlm_analysis_fifo#(noc_pkt) in_fifo[TOTAL_CORES];
   uvm_tlm_analysis_fifo#(noc_pkt) out_fifo[TOTAL_CORES];


   bit[7:0] src_addr_in[TOTAL_CORES];
   bit[7:0] dst_addr_in[TOTAL_CORES];
   bit[7:0] src_addr_out[TOTAL_CORES];
   bit[7:0] dst_addr_out[TOTAL_CORES];
   bit[1:0] vc_id_in[TOTAL_CORES];
   bit[1:0] vc_id_out[TOTAL_CORES];

   //Variables for bin creation. Need to change if we change addressing sizes
   typedef bit[7:0] validB[TOTAL_CORES];
   typedef bit[7:0] illegalB[16*16 - TOTAL_CORES];
   validB valid_bins; // For valid
   illegalB ill_bins; // For illegal

   noc_pkt txns_in[TOTAL_CORES];
   noc_pkt txns_out[TOTAL_CORES];

   int in_pkts = 0, out_pkts = 0;

//    bit[15:0] glob_illegal[8] = '{{8'h00,8'h00},{8'h11,8'h11},{8'h22,8'h22},{8'h33,8'h33},{8'h44,8'h44},{8'h55,8'h55},{8'h66,8'h66},{8'h77,8'h77}};
   /*-------------------------------------------------------------------------------
   -- UVM Factory register
   -------------------------------------------------------------------------------*/
  // Provide implementations of virtual methods such as get_type_name and create
  `uvm_component_utils(noc_coverage)

  /*-------------------------------------------------------------------------------
  -- Functions
  -------------------------------------------------------------------------------*/
	// Convert the functions to tasks
	function automatic validB get_valid_bins();
	int index = 0;
    for (int row = 0; row < NO_OF_ROWS; row++) begin
      for (int column = 0; column < NO_OF_COLUMNS; column++) begin
        valid_bins[index] = (row << 4) | column;  // Shift row by 4 bits to the left and OR with column
        index++;
      end
    end
    return valid_bins;
  endfunction

	function automatic illegalB get_illegal_bins();
		int index =0;
		for(int row=0; row<16; row++) begin
			for(int column=0; column<16; column++) begin
				if(((row>=NO_OF_ROWS) || (column>=NO_OF_COLUMNS))) begin
					ill_bins[index] = (row << 4) | column;
					index++;
				end
			end
		end
		return ill_bins;
	endfunction

 covergroup mesh_cg_in with function sample(int index);
	 //option.per_instance = 1;
	SRC_ADDR: coverpoint (src_addr_in[index]) {
        bins valid[] = valid_bins;
        illegal_bins ib = ill_bins;
		 //option.weight=0;
	 }
	 DST_ADDR: coverpoint (dst_addr_in[index]) {
        bins valid[] = valid_bins;
        illegal_bins ib = ill_bins;
		 //option.weight=0;
	 }
	 // VC_ID: coverpoint (vc_id_in[index]) {
	 //   bins valid[] = {2'b00,2'b01,2'b10,2'b11};
	 //   //option.weight=0;
	 // }
	 CROSS_COV: cross SRC_ADDR, DST_ADDR {
		// illegal_bins ib = binsof(SRC_ADDR) intersect binsof(DST_ADDR) iff(src_addr_in[index] == dst_addr_in[index]);
		illegal_bins ib = {
			{8'h00,8'h00},{8'h01,8'h01},{8'h10,8'h10},{8'h11,8'h11}
		};
 }
  endgroup

  covergroup mesh_cg_out with function sample(int index);
	  //option.per_instance = 1;
	  SRC_ADDR: coverpoint (src_addr_out[index]) {
        bins valid[] = valid_bins;
        illegal_bins ib = ill_bins;
		  //option.weight=0;
	  }
	  DST_ADDR: coverpoint (dst_addr_out[index]) {
        bins valid[] = valid_bins;
        illegal_bins ib = ill_bins;
		  //option.weight=0;
	  }
	  // VC_ID: coverpoint (vc_id_out[index]) {
	  //   bins valid[] = {2'b00,2'b01,2'b10,2'b11};
	  //   //option.weight=0;
	  // }
	  CROSS_COV: cross SRC_ADDR, DST_ADDR {
		// illegal_bins ib = binsof(SRC_ADDR) intersect binsof(DST_ADDR);
		// illegal_bins ib = CROSS_COV with (src_addr_out[index] == dst_addr_out[index]);
  }
  endgroup

  function new(string name = "noc_coverage", uvm_component parent=null);
	  super.new(name, parent);
	  get_valid_bins();
	  get_illegal_bins();
	  mesh_cg_in = new();
	  mesh_cg_out = new();
  endfunction : new

  function void build_phase(uvm_phase phase);
	  super.build_phase(phase);
	  for(int i = 0; i<TOTAL_CORES; i++) begin
		  in_fifo[i] = new($sformatf("in_fifo[%d]",i), this);
		  out_fifo[i] = new($sformatf("out_fifo[%d]",i), this);
		  txns_in[i] = new();
		  txns_out[i] = new();
	  end
  endfunction : build_phase

  task run_phase(uvm_phase phase);
	  super.run_phase(phase);
	  foreach(in_fifo[i]) begin
		  automatic int var_i = i;
		  fork
			  test_coverage_in(var_i);
			  test_coverage_out(var_i);
		  join_none
	  end
  endtask : run_phase

  task test_coverage_in(int n);
	  forever begin
		  in_fifo[n].get(txns_in[n]);
		  in_pkts++;
		  `uvm_info("COVERAGE", $sformatf("Got a txn to sample for core %d", n), UVM_HIGH)
		  vc_id_in[n] = txns_in[n].header_flit[28:27];
	  src_addr_in[n] = txns_in[n].header_flit[15:8];
	  dst_addr_in[n] = txns_in[n].header_flit[7:0];
	  `uvm_info("COVERAGE", $sformatf("INPUT: vc_id:%b, src_addr:%h, dst_addr:%h",vc_id_in[n], src_addr_in[n], dst_addr_in[n]), UVM_INFO)
	  mesh_cg_in.sample(n);
	  `uvm_info("COVERAGE", $sformatf("MESH PACKET Coverage IN is %0f, packets sent so far: %d",mesh_cg_in.get_coverage(), in_pkts), UVM_INFO);
  end
  endtask : test_coverage_in

  task test_coverage_out(int n);
	  forever begin
		  out_fifo[n].get(txns_out[n]);
		  out_pkts++;
		  vc_id_out[n] = txns_out[n].header_flit[28:27];
		  src_addr_out[n] = txns_out[n].header_flit[15:8];
		  dst_addr_out[n] = txns_out[n].header_flit[7:0];
		  `uvm_info("COVERAGE", $sformatf("OUTPUT: vc_id:%b, src_addr:%h, dst_addr:%h",vc_id_out[n], src_addr_out[n], dst_addr_out[n]), UVM_INFO)
		  mesh_cg_out.sample(n);
		  `uvm_info("COVERAGE", $sformatf("MESH PACKET Coverage OUT is %0f, packets sent so far: %d",mesh_cg_out.get_coverage(), out_pkts), UVM_INFO);
	  end
  endtask : test_coverage_out


endclass : noc_coverage
`endif