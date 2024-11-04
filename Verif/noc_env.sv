`ifndef noc_env
`define noc_env

class noc_env extends uvm_env;

/*-------------------------------------------------------------------------------
-- Interface, port, fields
-------------------------------------------------------------------------------*/
	noc_agent agent[TOTAL_CORES];
	noc_coverage coverage;
	// noc_scoreboard scoreboard;
/*-------------------------------------------------------------------------------
-- UVM Factory register
-------------------------------------------------------------------------------*/
	// Provide implementations of virtual methods such as get_type_name and create
	`uvm_component_utils(noc_env)

/*-------------------------------------------------------------------------------
-- Functions
-------------------------------------------------------------------------------*/
	// Constructor
	function new(string name = "noc_env", uvm_component parent=null);
		super.new(name, parent);
	endfunction : new

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		foreach(agent[i]) begin
			agent[i] = noc_agent::type_id::create($sformatf("agent[%0d]",i), this);
			agent[i].core_addr = noc_pkg::arr[$sformatf("CORE%0d_ADDR",i)];
			agent[i].core_num = i;
		end
		coverage = noc_coverage::type_id::create("coverage", this);
		scoreboard = noc_scoreboard::type_id::create("scoreboard", this);
	endfunction : build_phase

	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		for(int i=0; i<TOTAL_CORES; i++) begin
			agent[i].monitor.in_port.connect(coverage.in_fifo[i].analysis_export);
			agent[i].monitor.out_port.connect(coverage.out_fifo[i].analysis_export);

			agent[i].monitor.in_port.connect(scoreboard.in_port);
			agent[i].monitor.out_port.connect(scoreboard.out_port);
		end

	endfunction : connect_phase

endclass : noc_env
`endif