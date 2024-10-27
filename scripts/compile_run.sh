#!/bin/bash

# Set UVM home if not already set
export UVM_HOME=$CDS_INST_DIR/tools/inca/files/uvm

# Set simulation options
SIM_OPTIONS="+access+rwc -timescale 1ns/1ps"

# Include directories
INCLUDE_DIRS="-incdir ../tb"

# Add coverage option
COVERAGE_OPTIONS="-coverage all"

# Compile and run simulation with UVM support
xrun $SIM_OPTIONS $COVERAGE_OPTIONS $INCLUDE_DIRS -uvm -f design_files.f -f testbench_files.f -covoverwrite -svseed "$seed" +access+rw 
