`ifndef noc_if
`define noc_if
import noc_pkg::TOTAL_CORES;
interface noc_if ();

	logic[31:0] data_in[TOTAL_CORES];
	logic[31:0] data_out[TOTAL_CORES];
	logic clr;
	logic clk;
	initial begin 
		clk = 0;
		forever #5 clk = ~clk;
	end

endinterface
`endif