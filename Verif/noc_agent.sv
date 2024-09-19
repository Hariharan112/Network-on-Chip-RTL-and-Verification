// Agent covers the driver, sequencer and monitor

`ifndef noc_agent
`define noc_agent
class noc_agent extends uvm_agent;

/*-------------------------------------------------------------------------------
-- Interface, port, fields
-------------------------------------------------------------------------------*/
	noc_driver driver;
	noc_monitor monitor;
	uvm_sequencer #(noc_pkt) sequencer; // Generate sequences of transactions of noc_pkt type. A standard sequencer from UVM factory is used here
	my_noc_config noc_config0;
	bit[7:0] core_addr;
	int core_num; // Used to differentiate multiple agents in a multi core environment
/*-------------------------------------------------------------------------------
-- UVM Factory register
-------------------------------------------------------------------------------*/
	// Provide implementations of virtual methods such as get_type_name and create
	`uvm_component_utils(noc_agent)

/*-------------------------------------------------------------------------------
-- Functions
-------------------------------------------------------------------------------*/
	// Constructor default one
	function new(string name = "noc_agent", uvm_component parent=null);
		super.new(name, parent);
	endfunction : new

	// Components of agent(driver, seq, monitor) are created and configured here
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);

		// Create a driver and sequencer object
		driver = noc_driver::type_id::create("driver", this);
		sequencer = uvm_sequencer#(noc_pkt)::type_id::create("sequencer", this);

		// Retrieve congif parameters and attach vif to monitor and driver.
		noc_config0 = my_noc_config::type_id::create("noc_config0", this);
		uvm_config_db#(my_noc_config)::get(this, "*", "noc_config0", noc_config0);
		driver.vif = noc_config0.vif;
		monitor = noc_monitor::type_id::create("monitor", this);
		monitor.vif = noc_config0.vif;
	endfunction : build_phase

	// Estabilish connections between components in agent
	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);

		// Connect driver to sequencer
		driver.seq_item_port.connect(sequencer.seq_item_export);

		// Connect core no of driver and monitor to the agent's core no
		driver.core_num = core_num;
		monitor.core_num = core_num;
	endfunction : connect_phase

endclass : noc_agent
`endif