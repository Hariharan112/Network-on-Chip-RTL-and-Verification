module dff_synch_reset (d,reset,clk,q);
input d,reset,clk;
output reg q;

always@(posedge clk)
begin
if(reset)
	q=0;
else
	q=d;
end
endmodule
