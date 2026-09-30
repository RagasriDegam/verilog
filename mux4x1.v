module mux4x1(i0,i1,i2,i3,s0,s1,y);
input i0,i1,i2,i3,s0,s1;
output reg y;
always @(*)begin
 case (s)
 2'b00:y=i0;
 2'b01:y=i1;
 2'b10:y=i2;
 2'b11:y=i3;
 default:2'bxx;
 endcase
 end
endmodule

output y;
assign y=(~s0&~s1&i0)|(~s0&s1&i1)|(s0&~s1&i2)|(s0&s1&i3);
endmodule


module tb;
reg i0,i1,i2,i3;
reg s0,s1;
wire y;
 mux4x1 dut (i0,i1,i2,i3,s0,s1,y);

initial begin
repeat (4)begin
{s0,s1,i0,i1,i2,i3}=$random;
#1;
$display("\t-->i0=%b i1=%b i2=%b i3=%b s0=%b s1=%b y=%b",i0,i1,i2,i3,s0,s1,y);
end
end
endmodule


