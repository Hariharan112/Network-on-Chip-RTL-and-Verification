`ifndef noc_monitor
`define noc_monitor
class noc_monitor extends uvm_monitor;

/*-------------------------------------------------------------------------------
-- Interface, port, fields
-------------------------------------------------------------------------------*/
virtual noc_if vif;
int core_num;

uvm_analysis_port#(noc_pkt) in_port;
uvm_analysis_port#(noc_pkt) out_port;

uvm_event ev_001 = new();
uvm_event ev_000 = new();
uvm_event ev_010 = new();

/*-------------------------------------------------------------------------------
-- UVM Factory register
-------------------------------------------------------------------------------*/
	// Provide implementations of virtual methods such as get_type_name and create
	`uvm_component_utils(noc_monitor)

/*-------------------------------------------------------------------------------
-- Functions
-------------------------------------------------------------------------------*/
	// Constructor
	function new(string name = "noc_monitor", uvm_component parent=null);
		super.new(name, parent);
	endfunction : new

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
	    in_port=new("in_port",this);
		out_port=new("out_port",this);

	endfunction:build_phase

	virtual task run_phase(uvm_phase phase);
	phase.raise_objection(this);
	fork
		begin
			data_in_collect(core_num);
		end
		begin
			data_out_collect(core_num);
		end
		begin
			out_collect_triggers(core_num);
		end
	join_none
	phase.drop_objection(this);
	endtask:run_phase

task data_in_collect(int n);
	
	uvm_queue #(logic [31:0]) data_in_payloads = new(); // temp queue to store payload lines
	noc_pkt in_collect = new();

	forever begin 
		@(posedge vif.clk); #1;
		if(vif.clr == 0) begin // start looking if vif is cleared
			//wait for header flit
			`uvm_info("MONITOR", "Waiting for header_flit (001)", UVM_LOW)
			noc_pkg::ev_001[n].wait_trigger;
			`uvm_info("MONITOR", "Got header_flit (001)", UVM_LOW)
			//load flit into pkt
			in_collect.header_flit = vif.data_in[n];
			`uvm_info("MONITOR", "Header in in_collect: %0b",in_collect.header_flit, UVM_LOW)
			//wait for payloads
			`uvm_info("MONITOR", "Waiting for payload_flit (000)",UVM_LOW)
			noc_pkg::ev_000[n].wait_trigger;
			`uvm_info("MONITOR", "Got payload_flit (000)",UVM_LOW)
			//load paylaods into q
			while(vif.data_in[n][31:29] == 000) begin 
				data_in_payloads.push_back(vif.data_in[n]);
				`uvm_info("MONITOR", "payload line into queue: %0b",vif.data_in[n], UVM_LOW)
				@(posedge vif.clk); 
			end
			//empty q into pkt
			in_collect.payload_flit = new[data_in_payloads.size];
			for(int i = 0; i < data_in_payloads.size; i++) begin 
				in_collect.payload_flit[i] = data_in_payloads.pop_front();
				`uvm_info("MONITOR", "payload line in in_collect: %0b",in_collect.payload_flit[i], UVM_LOW)
			end

			//wait for tailer
			`uvm_info("MONITOR", "Waiting for tailer_flit (010)", UVM_LOW)
			noc_pkg::ev_010[n].wait_trigger;
			`uvm_info("MONITOR", "Got tailer_flit (010)", UVM_LOW)
			//load flit into pkt
			in_collect.tailer_flit = vif.data_in[n];
			`uvm_info("MONITOR", "Tailer in in_collect: %0b",in_collect.tailer_flit, UVM_LOW)
			//send pkt over port
			in_port.write(in_collect);
			`uvm_info("MONITOR", "Sent in pkt to scb", UVM_LOW)

		end

	end
		
endtask:data_in_collect

task data_out_collect(int n);

	uvm_queue #(logic [31:0]) data_out_payloads = new();
	noc_pkt out_collect = new();

	forever begin 
		if(vif.clr == 0) begin 

			//wait for header flit
			`uvm_info("MONITOR_OUT", "Waiting for header_flit", UVM_LOW)
			ev_001.wait_trigger;
			`uvm_info("MONITOR_OUT", "Got header_flit", UVM_LOW)
			//load it
			out_collect.header_flit = vif.data_out[n];
			`uvm_info("MONITOR_OUT", "Header in out_collect: %0b",out_collect.header_flit, UVM_LOW)

			//wait for payloads
			`uvm_info("MONITOR_OUT", "Waiting for payload_flit", UVM_LOW)
			ev_000.wait_trigger;
			while(vif.data_out[n][31:29] == 3'b000) begin 
				data_out_payloads.push_back(vif.data_out[n]);
				`uvm_info("MONITOR_OUT", "Got a payload_flit line in queue: %0b",vif.data_out[n], UVM_LOW)
				@(posedge vif.clk);
			end
			out_collect.payload_flit = new[data_out_payloads.size];
			for(int i = 0; i<data_out_payloads.size; i++) begin 
				out_collect.payload_flit[i] = data_out_payloads.pop_front();
				`uvm_info("MONITOR_OUT", "Got a payload_flit in out_collect: %0b",out_collect.payload_flit[i], UVM_LOW)
			end

			`uvm_info("MONITOR_OUT", "Waiting for tailer_flit", UVM_LOW)
			ev_010.wait_trigger;
			//since we're here, tailer arrived
			`uvm_info("MONITOR_OUT", "Got tailer_flit", UVM_LOW)
			out_collect.tailer_flit = vif.data_out[n];

			//send it
			out_port.write(out_collect);
			`uvm_info("MONITOR_OUT", "Sent out pkt to scb", UVM_LOW)

		end
	end

endtask:data_out_collect

task out_collect_triggers(int n);
	
	forever begin 

		@(vif.data_out[n]);
		if(vif.data_out[n][31:29]==3'b001) begin ev_001.trigger; `uvm_info("MONITOR_OUT", "Triggered header", UVM_HIGH) end
		if(vif.data_out[n][31:29]==3'b000) begin ev_000.trigger; `uvm_info("MONITOR_OUT", "Triggered payload", UVM_HIGH) end
		if(vif.data_out[n][31:29]==3'b010) begin ev_010.trigger; `uvm_info("MONITOR_OUT", "Triggered tailer", UVM_HIGH) end

	end

endtask : out_collect_triggers

endclass : noc_monitor
`endif