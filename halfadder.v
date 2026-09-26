module h_add(a,b,sum,carry);
input a,b;
output reg sum,carry;
//output sum,carry;
always @(*)begin
sum = a ^ b;
carry = a&b;
end
//assign sum = a^b;
//assign carry = a&b;
//xor g1(sum,a,b);
//and g2(carry,a,b);


endmodule


module tb;
reg a,b;
wire sum,carry;

h_add dut(a,b,sum,carry);

initial begin
repeat (5) begin
{a,b}=$random;
#1;
$display("\t-->a=%b b=%b sum=%b carry=%b",a,b,sum,carry);
end
end
endmodule


