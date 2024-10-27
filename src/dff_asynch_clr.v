 `timescale 1ns / 1ps

module dff_asynch_clr (d,clr,clk,q);
input d,clr,clk;
output reg q;

always@(posedge clk, posedge clr)
begin
if(clr)
q=0;
else
q=d;
end
endmodule
