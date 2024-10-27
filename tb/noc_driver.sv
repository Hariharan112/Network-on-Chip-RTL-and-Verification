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

	// Initialize event objects for each core
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
		begin
			@(posedge vif.clk);
			//`uvm_info("DIVER", "waited for posedge clk?", UVM_HIGH)
				vif.clr=1'b1;
			@(posedge vif.clk);
			//`uvm_info("DIVER", "waited for second posedge clk?", UVM_HIGH)
				vif.clr=1'b0;
			`uvm_info("DRIVER", "vif clear initiated. call?", UVM_LOW)
			drive_invalid(n);
			get_drive(n);
        end
		
	endtask : core_drive

	task get_drive(int n);
		forever begin
			`uvm_info("DRIVER", "waiting for seq item", UVM_HIGH)
			seq_item_port.get_next_item(req);
			`uvm_info("DRIVER", "got seq item", UVM_HIGH)
			// After getting a pkt, assign core no of seq to the packet
			assert(req.core_num == core_num)
		    drive_data_in(n);
		    `uvm_info("DRIVER", "finished drive_data_in", UVM_HIGH)
			@(posedge vif.clk);
			seq_item_port.item_done();
			end
	endtask:get_drive

	task drive_data_in(int n);
		`uvm_info("DRIVER", $sformatf("driving data (header): %h",req.header_flit), UVM_LOW)
		@(posedge vif.clk);
			vif.data_in[n] = req.header_flit;
			// Send trigger that header is sent
			trigger_events(n);
		        repeat(8) // Delay by 8 clock cycles. Give time for header to be processed
		@(posedge vif.clk);
		foreach(req.payload_flit[i])
		begin
			
		 	@(posedge vif.clk);
		 	`uvm_info("DRIVER", $sformatf("driving data (payload) line: %b",req.payload_flit[i]), UVM_HIGH)
			vif.data_in[n] = req.payload_flit[i];
			// Send trigger that a payload is sent
			trigger_events(n);
		end
		@(posedge vif.clk);
			`uvm_info("DRIVER", $sformatf("driving data (tailer): %b",req.tailer_flit), UVM_HIGH)
			vif.data_in[n] =  req.tailer_flit;
			// Send trigger that tailer is sent
			trigger_events(n);
		        repeat(1)		// wait for a clk cycle?
		@(posedge vif.clk);
			`uvm_info("DRIVER", $sformatf("driving data (invalid): %b",req.invalid_flit), UVM_HIGH)
			vif.data_in[n] =  req.invalid_flit;
			// Send trigger that invalid flit is sent
			trigger_events(n);
		@(posedge vif.clk);

	endtask:drive_data_in

	task drive_invalid(int n);
		`uvm_info("DRIVER", "Driving invalid data right now", UVM_HIGH)
		@(posedge vif.clk);
	    
		vif.data_in[n] = 32'h7fff_ffff;
			
	endtask:drive_invalid

	task trigger_events(int n);
		//@(posedge vif.clk);
		if(vif.data_in[n][31:29]==3'b001) noc_pkg::ev_001[n].trigger;  // header trigger
		if(vif.data_in[n][31:29]==3'b000) noc_pkg::ev_000[n].trigger;  // payload trigger
		if(vif.data_in[n][31:29]==3'b010) noc_pkg::ev_010[n].trigger;  // tailer trigger
	endtask : trigger_events

endclass : noc_driver
`endif