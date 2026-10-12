module mux2x1(i0,i1,s,y);
input i0,i1,s;
output y;
assign y=~s&i0|s&i1;
endmodule

module mux4x1(i0,i1,i2,i3,s0,s1,y);
input i0,i1,i2,i3,s0,s1;
output y;
assign y=~s0&~s1&i0|~s0&s1&i1|s0&~s1&i2|s0&s1&i3;
endmodule

module mux8x1(i0,i1,i2,i3,i4,i5,i6,i7,s0,s1,s2,y);
input i0,i1,i2,i3,i4,i5,i6,i7;
input s0,s1,s2;
output y;
wire n1,n2,n3,n4;
module mux2x1(.i0(i0),.i1(i1),.s(s0),.y(n1));
module mux2x1(.i0(i2),.i1(i3),.s(s0),.y(n2));
module mux2x1(.i0(i4),.i1(i5),.s(s0),.y(n3));
module mux2x1(.i0(i6),.i1(i7),.s(s0),.y(n4));
module mux4x1(.i0(n1),.i1(n2),.i2(n3),.i3(n4),.s0(s1),.s1(s2),.y(y));

endmodule

module tb;
reg i0,i1,i2,i3,i4,i5,i6,i7;
reg s0,s1,s2;
wire y;
mux8x1 dut (i0,i1,i2,i3,i4,i5,i6,i7,s0,s1,s2,y);

initial begin
repeate(8)begin
{i0,i1,i2,i3,i4,i5,i6,i7,s0,s1,s2}=$random;
#1;
$display("\t-->i0=%b i1=%b i2=%b i3=%b i4=%b i5=%b i6=%b i7=%b s0=%b s1=%b s2=%b y=%b",i0,i1,i2,i3,i4,i5,i6,i7,s0,s1,s2,y);
end
endmodule




