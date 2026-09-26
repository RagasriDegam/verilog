module f_add(a,b,cin,sum,carry);
input a,b;
input cin;
//output reg sum;
//output reg carry;
output sum,carry;
//always @(*)begin
//sum = a ^ b ^cin;
//carry = (a&b)|(b&cin)|(cin&a);
//end
//assign sum = a^b^cin;
//assign carry = (a&b)|(b&cin)|(cin&a);
  wire w1,w2,w3;
  xor g1(w1,a,b);
  xor g2(sum,w1,cin);
  
  and g3(w2,a,b);
  and g4(w3,w1,cin);

or g5(carry,w2,w3);


endmodule


module tb;
reg a,b,cin;
wire sum,carry;

f_add dut(a,b,cin,sum,carry);

initial begin
repeat (8) begin
{a,b,cin}=$random;
#1;
$display("\t-->a=%b b=%b cin=%c sum=%b carry=%b",a,b,cin,sum,carry");
end
end
endmodule


