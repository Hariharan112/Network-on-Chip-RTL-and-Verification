 `timescale 1ns / 1ps

module encoder (g1, g2, g3, g4, g5, g6, g7, g8,	g9, g10, g11, g12, g13, g14, g15, g16, encoded_addr);

						
					 
					 input g1, g2, g3, g4, g5, g6, g7, g8,	g9, g10, g11, g12, g13, g14, g15, g16;
					 output[3:0] encoded_addr;

					 assign  encoded_addr[0] = (g2 | g4 | g6 | g8 | g10 | g12 | g14 | g16);
					 assign  encoded_addr[1] = (g3 | g4 | g7 | g8 | g11 | g12 | g15 | g16);
					 assign  encoded_addr[2] = (g5 | g6 | g7 | g8 | g13 | g14 | g15 | g16);
					 assign  encoded_addr[3] = (g9 | g10 | g11 | g12 | g13 | g14 | g15 | g16);

endmodule
