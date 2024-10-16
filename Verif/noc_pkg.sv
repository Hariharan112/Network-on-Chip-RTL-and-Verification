`ifndef noc_pkg
`define noc_pkg
package noc_pkg;
`include "uvm_macros.svh"

	import uvm_pkg::*;
parameter RANDOM_SEED = 5;

parameter NO_OF_ROWS =2;
parameter NO_OF_COLUMNS =2;


parameter TOTAL_CORES = NO_OF_ROWS * NO_OF_COLUMNS;
parameter TOTAL_PAYLOADS_PER_PACKET =2;
//parameter TOTAL_PAYLOADS_PER_PACKET =10;
parameter TOTAL_PACKET_SIZE =TOTAL_PAYLOADS_PER_PACKET+3;

bit core_selection_vector[TOTAL_CORES-1:0];
bit[26:0] pld[TOTAL_PAYLOADS_PER_PACKET];
bit[7:0] arr[string];

	
uvm_event ev_001[TOTAL_CORES];
uvm_event ev_000[TOTAL_CORES];
uvm_event ev_010[TOTAL_CORES];

	import uvm_pkg::*;
	`include "uvm_macros.svh"
	`include "my_noc_config.sv"
	`include "noc_pkt.sv"
	`include "noc_coverage.sv"
	`include "noc_sequence.sv"
	`include "noc_driver.sv"
	`include "noc_monitor.sv"
	`include "noc_agent.sv"
	`include "noc_scoreboard.sv"
	`include "noc_env.sv"
	`include "noc_test.sv"


endpackage
`endif