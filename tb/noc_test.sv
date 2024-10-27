`ifndef noc_test
`define noc_test
class noc_test extends uvm_test;
/*-------------------------------------------------------------------------------
-- Interface, port, fields
-------------------------------------------------------------------------------*/
	noc_env env;
	noc_sequence seq[TOTAL_CORES];
	my_noc_config noc_config0;
	bit core_selection_vector[TOTAL_CORES-1:0];
	int rand_seed;
	int pkt_cnt;
	int index;
	int file_red;
/*-------------------------------------------------------------------------------
-- UVM Factory register
-------------------------------------------------------------------------------*/
	// Provide implementations of virtual methods such as get_type_name and create
	`uvm_component_utils(noc_test)

/*-------------------------------------------------------------------------------
-- Functions
-------------------------------------------------------------------------------*/
	// Constructor
	function new(string name = "noc_test", uvm_component parent=null);
		super.new(name, parent);
	endfunction : new

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		env = noc_env::type_id::create("env", this);
		noc_config0 = my_noc_config::type_id::create("noc_config0", this);
		uvm_config_db#(virtual noc_if)::get(this, "*", "vif", noc_config0.vif);
		uvm_config_db#(my_noc_config)::set(this, "*", "noc_config0", noc_config0);
		foreach(seq[i]) begin
			seq[i] = noc_sequence::type_id::create($sformatf("seq[%0d]",i), this);
			seq[i].core_seq_num = i;
			seq[i].core_seq_addr = noc_pkg::arr[$sformatf("CORE%0d_ADDR",i)];
		end

		//file_red = $fopen("packet_num.txt","r");
		//$fscanf(file_red, "%d\n", pkt_cnt);
		pkt_cnt = 200;
	endfunction : build_phase

	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
	endfunction : connect_phase

	task run_phase(uvm_phase phase);
		super.run_phase(phase);
		`uvm_info("TEST", "Test runphase", UVM_INFO)
		phase.raise_objection(this);
			for (int i = 0; i < pkt_cnt; i++) begin
				// For running CRV
				index = $urandom()%TOTAL_CORES;

				// For running with files
				// index = i;
				seq[index].start(env.agent[index].sequencer);
				// #100ns; // it increases sim time SIGNIFICANTLY
			end
		`uvm_info("TEST", "All packets sent. Waiting for DUT to process...", UVM_INFO)
  		#200ns;
		phase.drop_objection(this);
		$finish;
	endtask : run_phase

endclass : noc_test
`endif