
`timescale 1ns/1ps
`ifndef tb_top
`define tb_top
module tb_top;
	`include "uvm_macros.svh"

	import uvm_pkg::*;
	import noc_pkg::*;
	bit[7:0] arr[string];
//	logic clr;
	noc_if vif();

	Auto_Mesh #(NO_OF_ROWS,NO_OF_COLUMNS) router_2x2(
		.clk(vif.clk),
		.clr(vif.clr),
		.data_in_core(vif.data_in),
		.data_out_core(vif.data_out)
	);
	
initial
	begin
		vif.clr=0;
	end

initial
	begin
		bit[7:0] a;
		for(bit[3:0] i=0; i<NO_OF_ROWS;i++) begin
			for(bit[3:0] j=0; j<NO_OF_COLUMNS;j++) begin
				arr[$sformatf("CORE%0d_ADDR",a)] = {i,j};
				a++;
			end
		end

		foreach(arr[i]) begin
			$display("arr[%s]=%h",i,arr[i]);
			noc_pkg::arr[i] = arr[i];
		end


	end
	
initial begin 
	uvm_config_db#(virtual noc_if)::set(uvm_root::get(), "*", "vif", vif);
	run_test("noc_test");
end
endmodule : tb_top
`endif