module dff_synch_set (d,set,clk,q);
input d,set,clk;
output reg q;

always@(posedge clk)
begin
if(set)
	q=1;
else
	q=d;
end
endmodule
