`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2024 11:34:17 PM
// Design Name: 
// Module Name: Auto_Mesh
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Auto_Mesh #(parameter M=2,N=2)(
    input clk, clr,
    input [31:0] data_in_core [0:M*N-1],
    output [31:0] data_out_core [0:M*N-1] 
);
 
//parameter M- Number of rows
//parameter N- Number of columns
 
// Define data_out_link as an array of arrays
wire [31:0] data_out_link[4:1][0:M-1][0:N-1]; // Why is this 32 bits in width? Causes warnings in the simulation...
wire full_out_vc1_link[4:1][0:M-1][0:N-1];
wire full_out_vc2_link[4:1][0:M-1][0:N-1];
wire full_out_vc3_link[4:1][0:M-1][0:N-1];
wire full_out_vc4_link[4:1][0:M-1][0:N-1];
wire full_out_core_vc[4:1][0:M-1][0:N-1];
 
 
// Parameterized constants
parameter DEFAULT_DATA = 32'h60000000;
 
wire gnd = 0;
wire vdd = 1;
// Instances of routers
genvar i, j;
generate
    for (i = 0; i < M; i = i + 1) begin : gen_rows
        for (j = 0; j < N; j = j + 1) begin : gen_columns
            top_module inst (
                .data_in_link1((i < M-1) ? data_out_link[2][i+1][j] : DEFAULT_DATA), // Link 2 of router below. done
                .data_in_link2((i > 0) ? data_out_link[1][i-1][j] : DEFAULT_DATA), // Link 1 of router to the right. done
                .data_in_link3((j < N-1) ? data_out_link[4][i][j+1] : DEFAULT_DATA),  // Link 4 of router to the right. done
                .data_in_link4((j > 0) ? data_out_link[3][i][j-1] : DEFAULT_DATA), // Link 3 of router to left
                .data_in_core(data_in_core[i*N+j]), 
                .clk(clk),
                .clr(clr),
                .current_address(((16*i)+j)&8'hff),
                .full_in_link1_vc1((i < M-1)?full_out_vc1_link[2][i+1][j]:gnd),
                .full_in_link1_vc2((i < M-1)?full_out_vc2_link[2][i+1][j]:gnd),
                .full_in_link1_vc3((i < M-1)?full_out_vc3_link[2][i+1][j]:gnd),
                .full_in_link1_vc4((i < M-1)?full_out_vc4_link[2][i+1][j]:gnd),
                .full_in_link2_vc1((i > 0 )?full_out_vc1_link[1][i-1][j]:gnd),
                .full_in_link2_vc2((i > 0 )?full_out_vc2_link[1][i-1][j]:gnd),
                .full_in_link2_vc3((i > 0 )?full_out_vc3_link[1][i-1][j]:gnd),
                .full_in_link2_vc4((i > 0 )?full_out_vc4_link[1][i-1][j]:gnd),
                .full_in_link3_vc1((j < N-1)?full_out_vc1_link[4][i][j+1]:gnd),
                .full_in_link3_vc2((j < N-1)?full_out_vc2_link[4][i][j+1]:gnd),
                .full_in_link3_vc3((j < N-1)?full_out_vc3_link[4][i][j+1]:gnd),
                .full_in_link3_vc4((j < N-1)?full_out_vc4_link[4][i][j+1]:gnd),
                .full_in_link4_vc1((j>0)? full_out_vc1_link[3][i][j-1]:gnd),
                .full_in_link4_vc2((j>0)? full_out_vc2_link[3][i][j-1]:gnd),
                .full_in_link4_vc3((j>0)? full_out_vc3_link[3][i][j-1]:gnd),
                .full_in_link4_vc4((j>0)? full_out_vc4_link[3][i][j-1]:gnd),
                .full_in_core_vc1(1'b0),//done
                .full_in_core_vc2(1'b0),//done
                .full_in_core_vc3(1'b0),//done
                .full_in_core_vc4(1'b0),//done
                .data_out_link1(data_out_link[1][i][j]),  // done
                .data_out_link2(data_out_link[2][i][j]), // done
                .data_out_link3(data_out_link[3][i][j]),  // done
                .data_out_link4(data_out_link[4][i][j]), // done
                .data_out_core(data_out_core[i*N+j]),  //done
                .full_out_link1_vc1(full_out_vc1_link[1][i][j]),
                .full_out_link1_vc2(full_out_vc2_link[1][i][j]),
                .full_out_link1_vc3(full_out_vc3_link[1][i][j]),
                .full_out_link1_vc4(full_out_vc4_link[1][i][j]),
                .full_out_link2_vc1(full_out_vc1_link[2][i][j]),
                .full_out_link2_vc2(full_out_vc2_link[2][i][j]),
                .full_out_link2_vc3(full_out_vc3_link[2][i][j]),
                .full_out_link2_vc4(full_out_vc4_link[2][i][j]),
                .full_out_link3_vc1(full_out_vc1_link[3][i][j]),
                .full_out_link3_vc2(full_out_vc2_link[3][i][j]),
                .full_out_link3_vc3(full_out_vc3_link[3][i][j]),
                .full_out_link3_vc4(full_out_vc4_link[3][i][j]),
                .full_out_link4_vc1(full_out_vc1_link[4][i][j]),
                .full_out_link4_vc2(full_out_vc2_link[4][i][j]),
                .full_out_link4_vc3(full_out_vc3_link[4][i][j]),
                .full_out_link4_vc4(full_out_vc4_link[4][i][j]),
                .full_out_core_vc1(full_out_core_vc[1][i][j]),
                .full_out_core_vc2(full_out_core_vc[2][i][j]),
                .full_out_core_vc3(full_out_core_vc[3][i][j]),
                .full_out_core_vc4(full_out_core_vc[4][i][j])
            );
//            new1 (rd_clk,wr_clk,data_in_risc[i][j],reset,wr_en,destination[i][j],((16*i)+j)&8'hff,empty,full_int,data_in_core[i][j],wr_o); 
        end
    end
    
endgenerate
endmodule
