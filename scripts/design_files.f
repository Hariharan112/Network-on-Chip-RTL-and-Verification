# Design files (in correct order)

# Flip-flops and basic elements
../src/dff_asynch_clr.v
../src/dff_synch_clr.v
../src/dff_synch_reset.v
../src/dff_synch_set.v
../src/jk_ff.v

# Registers
../src/register_1bit.v
../src/register_4bit.v
../src/register_32bit.v

# Logic gates and multiplexers
../src/mux.v
../src/encoder.v
../src/demux_16.v

# Control logic
../src/priority_encoder.v
../src/gray_mod6.v
../src/gray_mod8.v
../src/falling_edge_pulse_generator.v
../src/rr_arbiter.v
../src/rr_comb_new.v
../src/round_robin_req.v
../src/asynch_comparator.v

# Components
../src/router_fifo.v
../src/memory.v
../src/fop.v
../src/routing_algo_mesh.v
../src/ip_link.v
../src/ip_chnl.v
../src/op_link1.v
../src/op_link2.v
../src/op_link3.v
../src/op_link4.v
../src/op_data_path.v
../src/op_core.v
../src/allot_vc.v
../src/IRS.v
../src/Auto_Mesh.sv

# Top module
../src/top_module.v
