module comp(a,b,gt,lt,eq);
input a,b;
output gt,lt,eq;
//output reg gt,lt,eq;

/*always @(*)begin
if(a>b)
$display("a is the greater than b");
elseif(a<b)
$display("a is lesser than b");
else
$display("a is equal than b");
end
endmodule*/

assign gt=(a&~b);
assign lt=(~a&b);
assign eq=(a~^b);
endmodule

and g1(gt,a,~b);
and g2(lt,~a,b);
xnor g3(eq,lt,gt);
endmodule



module tb;
reg a,b;
wire gt,lt,eq;

comp dut (a,b,gt,lt,eq);

initial begin
repeat(5)begin
{a,b}=$random;
#1;
$display("\t-->a=%b b=%b gt=%b lt=%b eq=%b",a,b,gt,lt,eq);
end
endmodule

