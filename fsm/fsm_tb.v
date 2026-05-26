`include "fsm.v"
module top;
reg clk_i,rst_i,d_in;
reg[5:0]state,nxt_state;
wire pattern_o;
integer count=0;
moor dut(.clk_i(clk_i),.rst_i(rst_i),.d_in(d_in),.pattern_o(pattern_o));


initial begin
clk_i=0;
forever #5 clk_i=~clk_i;
end

initial begin
rst_i=1;
d_in=0;
repeat(2)@(posedge clk_i);
rst_i=0;
repeat(200) begin
@(posedge clk_i);
d_in=$random;
end
@(posedge clk_i);
d_in=0;
#1000;
$display("total no of times=%d",count);
$finish();
end
always@(posedge pattern_o)
count=count+1;
endmodule
