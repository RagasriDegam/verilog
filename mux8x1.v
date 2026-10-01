module mux8x1(i,s,y);
input[7:0] i;
input [2:0]s;
output reg y;
always @(*)begin
  case (s) 
    3'b000:y=i[0];
	3'b001:y=i[1];
	3'b010:y=i[2];
	3'b011:y=i[3];
	3'b100:y=i[4];
	3'b101:y=i[5];
	3'b110:y=i[6];
	3'b111:y=i[7];
	default:y=1'b0;
	endcase
endmodule

output y;
assign y=(~s[0]&~s[1]&~s[2]&i[0]|
	     ~s[0]&~s[1]&s[2]&i[1]|
		 ~s[0]&s[1]&~s[2]&i[2]|
		 ~s[0]&s[1]&s[2]&i[3]|
		 s[0]&~s[1]&~s[2]&i[4]|
		 s[0]&~s[1]&s[2]&i[5]|
		 s[0]&s[1]&~s[2]&i[6]|
		 s[0]&s[1]&s[2]&i[7]);
endmodule


module tb;
reg [7:0]i;
reg [2:0]s;
wire y;
 mux8x1 dut (i,s,y);

initial begin
repeat (10)begin
{s,i}=$random;
#1;
$display("\t-->i=%b s=%b y=%b",i,s,y);
end
end
endmodule

