`ifndef noc_scoreboard
`define noc_scoreboard

class noc_scoreboard extends uvm_scoreboard;
/*------------------------------------------------*/
  `uvm_component_utils(noc_scoreboard)
  uvm_analysis_export #(noc_pkt) in_port, out_port;
  uvm_tlm_analysis_fifo #(noc_pkt) in_fifo, out_fifo;

  // Hash tables to track expected and actual packets with a string key
  noc_pkt expected_packets[string]; 
  noc_pkt actual_packets[string]; 

  // track the order of packet IDs
  string expected_packet_ids[$];
  string actual_packet_ids[$];
 /*------------------------------------------------*/

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    in_port = new("in_port", this);
    out_port = new("out_port", this);

    in_fifo = new($sformatf("in_fifo_sb"), this);
    out_fifo = new($sformatf("out_fifo_sb"), this);
  endfunction

  // Connect Phase
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);

    // Connect the exports to the FIFOs
    in_port.connect(in_fifo.analysis_export);
    out_port.connect(out_fifo.analysis_export);
  endfunction

  task run_phase(uvm_phase phase);
    noc_pkt pkt_in, pkt_out;
    
    forever begin
      // Collect packets
      fork
        begin
          in_fifo.get(pkt_in);
          process_in_packet(pkt_in);
        end

        begin
          out_fifo.get(pkt_out);
          process_out_packet(pkt_out);
        end
      join

      compare_packets();
    end
  endtask

  task process_in_packet(noc_pkt pkt_in);
    string pkt_id = get_packet_id(pkt_in); // Get a unique packet ID 
    
    expected_packets[pkt_id] = pkt_in;  
    expected_packet_ids.push_back(pkt_id);  
  endtask


  task process_out_packet(noc_pkt pkt_out);
    string pkt_id = get_packet_id(pkt_out); 

    actual_packets[pkt_id] = pkt_out;  
    actual_packet_ids.push_back(pkt_id);
  endtask

  task compare_packets();
    string pkt_id;
    noc_pkt expected_pkt, actual_pkt;

    // Check for packets in both queues
    if (expected_packet_ids.size() > 0 /*&& actual_packet_ids.size() > 0*/) begin
      pkt_id = expected_packet_ids.pop_front();

      // Check if it came through router
      if (actual_packets.exists(pkt_id)) begin
        expected_pkt = expected_packets[pkt_id];
        actual_pkt = actual_packets[pkt_id];

        // Compare the packets for corruption or mismatch
        if (!expected_pkt.compare(actual_pkt)) begin
          `uvm_error("SCOREBOARD", $sformatf("Packet mismatch for header ID: %0s", pkt_id));
        end
        else begin
          `uvm_info("SCOREBOARD", $sformatf("Packet matched for header ID: %0s", pkt_id), UVM_INFO);
        end

        expected_packets.delete(pkt_id);
        actual_packets.delete(pkt_id);
      end

      // If it didnt come through router 
      else begin
        `uvm_warning("SCOREBOARD", $sformatf(" Packet with header %0s not arrived at output ", pkt_id));
        expected_packet_ids.push_back(pkt_id); // Pushed to end of queue for later comparison
      end
    end
  endtask

    // I need a new function to get proper IDS... Or is this enough?
  function string get_packet_id(noc_pkt pkt);
    return $sformatf("S:%h D:%h", pkt.header_flit[15:8], pkt.header_flit[7:0]);
  endfunction

endclass
`endif