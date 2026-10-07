module comparator(a,b,gt,lt,eq);
input [3:0]a,b;
output reg gt,lt,eq;
always @(*)begin
if(a<b)
gt=1;
elseif(a>b)
lt=1;
else eq=1;
end
endmodule

module tb;
reg [3:0] a,b;
wire gt,lt,eq;
 comparator dut (a,b,gt,lt,eq);
 initial begin
 repeat(9)begin
 {a,b}=$random;
 #1;
 $display("a=%b b=%b gt=%b lt=%b eq=%b",a,b,gt,lt,eq);
 end
 endmodule

