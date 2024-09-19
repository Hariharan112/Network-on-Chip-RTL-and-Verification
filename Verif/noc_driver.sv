`ifndef noc_driver
`define noc_driver
class noc_driver extends uvm_driver #(noc_pkt);

/*-------------------------------------------------------------------------------
-- Interface, port, fields
-------------------------------------------------------------------------------*/
	
virtual noc_if vif;
noc_pkt req;
int core_num;
/*-------------------------------------------------------------------------------
-- UVM Factory register
-------------------------------------------------------------------------------*/
	// Provide implementations of virtual methods such as get_type_name and create
	`uvm_component_utils(noc_driver)

/*-------------------------------------------------------------------------------
-- Functions
-------------------------------------------------------------------------------*/
	// Constructor
	function new(string name = "noc_driver", uvm_component parent=null);
		super.new(name, parent);
	endfunction : new

	// Initialize event objects for each core. Why? We'll find out soon
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		for(int i = 0; i<TOTAL_CORES; i++) begin 
			noc_pkg::ev_001[i] = new();
			noc_pkg::ev_000[i] = new();
			noc_pkg::ev_010[i] = new();
		end
	endfunction : build_phase

	/* calls objection first so sim doesnt end prematurely,
		then calls core_drive task, then drops objection*/
	virtual task run_phase(uvm_phase phase);
		super.run_phase(phase);
		phase.raise_objection(this);
			core_drive(core_num);
        phase.drop_objection(this);
	endtask:run_phase

	// Handle driving info to each core
	task core_drive(int n);

		//`uvm_info("DIVER", "diver down", UVM_HIGH)
		begin
			//`uvm_info("DIVER", "inside begin block?", UVM_HIGH)
			//`uvm_info("DIVER", $sformatf("printing vif values %d %d %d %d",vif.clk, vif.data_in, vif.data_out, vif.clr), UVM_HIGH)
			@(posedge vif.clk);
			//`uvm_info("DIVER", "waited for posedge clk?", UVM_HIGH)
				vif.clr=1'b1;
			@(posedge vif.clk);
			//`uvm_info("DIVER", "waited for second posedge clk?", UVM_HIGH)
				vif.clr=1'b0;
			//`uvm_info("DIVER", "call?", UVM_HIGH)
			drive_invalid(n);
			get_drive(n);
        end
		
	endtask : core_drive

	task get_drive(int n);
		forever begin
			`uvm_info("DIVER", "waiting for seq item", UVM_HIGH)
			seq_item_port.get_next_item(req);
			`uvm_info("DIVER", "got seq item", UVM_HIGH)
			assert(req.core_num == core_num)
		    drive_data_in(n);
		    `uvm_info("DIVER", "finished drive_data_in", UVM_HIGH)
			@(posedge vif.clk);
			seq_item_port.item_done();
			end
	endtask:get_drive

	task drive_data_in(int n);
		`uvm_info("DIVER", $sformatf("driving data (header): %b",req.header_flit), UVM_HIGH)
		@(posedge vif.clk);
			vif.data_in[n] = req.header_flit;
			trigger_events(n);
		        repeat(8) // Delay by 8 clock cycles. Give time for header to be processed
		@(posedge vif.clk);
		foreach(req.payload_flit[i])
		begin
			
		 	@(posedge vif.clk);
		 	`uvm_info("DIVER", $sformatf("driving data (payload): %b",req.payload_flit[i]), UVM_HIGH)
			vif.data_in[n] = req.payload_flit[i];
			trigger_events(n);
		end
		@(posedge vif.clk);
			`uvm_info("DIVER", $sformatf("driving data (tailer): %b",req.tailer_flit), UVM_HIGH)
			vif.data_in[n] =  req.tailer_flit;
			trigger_events(n);
		        repeat(1)		
		@(posedge vif.clk);
			`uvm_info("DIVER", $sformatf("driving data (invalid): %b",req.invalid_flit), UVM_HIGH)
			vif.data_in[n] =  req.invalid_flit;
			trigger_events(n);
		@(posedge vif.clk);

	endtask:drive_data_in

	task drive_invalid(int n);
		`uvm_info("DRIVER", "Driving invalid", UVM_HIGH)
		@(posedge vif.clk);
	    
		vif.data_in[n] = 32'h7fff_ffff;
			
	endtask:drive_invalid

	task trigger_events(int n);
		//@(posedge vif.clk);
		if(vif.data_in[n][31:29]==3'b001) noc_pkg::ev_001[n].trigger;
		if(vif.data_in[n][31:29]==3'b000) noc_pkg::ev_000[n].trigger;
		if(vif.data_in[n][31:29]==3'b010) noc_pkg::ev_010[n].trigger;
	endtask : trigger_events

endclass : noc_driver
`endif