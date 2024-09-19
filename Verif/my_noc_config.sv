/*---------------------------------------------------------------------------------------------------
-- 	Config file lets us hold config info to our project in a UVM bench.
-- 	Used to manage and pass configuration settings throughout the testbench. 
	Configuration classes are a powerful feature in UVM, 
	allowing for a flexible and scalable way to control various aspects of the test environment
-----------------------------------------------------------------------------------------------------*/

// The next 2 lines lets us avoid multiple file inclusions. Multiple inclusions can lead to redefinition errors in compilor
`ifndef my_noc_config
`define my_noc_config
`include "uvm_macros.svh" // File containing all common macros to simplify uvm tasks

import uvm_pkg::*; // Import all definitions from uvm_pkg
class my_noc_config extends uvm_object; //class inherited from uvm_object(base class for objects)

/*-------------------------------------------------------------------------------
-- Interface, port, fields
-------------------------------------------------------------------------------*/
	virtual noc_if vif;

/*-------------------------------------------------------------------------------
-- UVM Factory register
-------------------------------------------------------------------------------*/
	// Provide implementations of virtual methods such as get_type_name and create
	`uvm_object_utils(my_noc_config)

/*-------------------------------------------------------------------------------
-- Functions
-------------------------------------------------------------------------------*/
	// Constructor. Just inherit from super class
	function new(string name = "my_noc_config");
		super.new(name);
	endfunction : new

endclass : my_noc_config

`endif