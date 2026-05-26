module moor(clk_i,rst_i,d_in,pattern_o);
parameter S_RST  =6'b000001;
parameter S_B    =6'b000010;
parameter S_BB   =6'b000100;
parameter S_BBC  =6'b001000;
parameter S_BBCB =6'b010000;
parameter S_BBCBC=6'b100000;

parameter B=1'b1;
parameter C=1'b0;

input clk_i,rst_i,d_in;
output reg pattern_o;

reg[4:0]state,nxt_state;

always @(posedge clk_i)begin
if(rst_i)begin
pattern_o=0;
state=S_RST;
nxt_state=S_RST;
end 

else begin
state=nxt_state;
pattern_o=0;
case(state)
S_RST:begin
if(d_in==B)nxt_state=S_B;
else nxt_state=S_RST;
end
S_B:begin
if(d_in==B)nxt_state=S_BB;
else nxt_state=S_RST;
end
S_BB:begin
if(d_in==B)nxt_state=S_BBC;
else nxt_state=S_RST;
end
S_BBC:begin
if(d_in==B)nxt_state=S_BBCB;
else nxt_state=S_RST;
end
S_BBCB:begin
if(d_in==B)nxt_state=S_BBCBC;
else nxt_state=S_BB;
end
S_BBCBC:begin
pattern_o=1;
if(d_in==B)nxt_state=S_B;
else nxt_state=S_RST;
end
endcase
end
end
endmodule



