module mux2x1(i0,i1,s,y);
input i0,i1,s;
output reg y;
always @(*)begin
  if (s==1'b0) 
    y=i0;
  else y=i1;
end
endmodule

output y;
assign y=(~s& i0 )|(s&i1);
endmodule

output y;
wire w1,w2;
and g1(w1,s,i0);
and g2(w2,s,i1);
or g3(y,w1,w2);
endmodule

module tb;
reg i0,i1;
reg s;
wire y;
mux2x1 dut (i0,i1,s,y);

initial begin
repeat (4)begin
{s}=$random;
#1;
$display("\t-->i0=%b i1=%b s=%b y=%b",i0,i1,s,y);
end
end
endmodule



