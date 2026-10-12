module btog(g3,g2,g1,g0,b3,b2,b1,b0);
input b3,b2,b1,b0;
output g3,g2,g1,g0;
assign g3=b3;
assign g2=b3^b2;
assign g1=b2^b1;
assign g0=b1^b0;
endmodule
 

 module tb;
  reg b3,b2,b1,b0;
 wire g3,g2,g1,g0;

btog dut (g3,g2,g1,g0,b3,b2,b1,b0);

initial begin
repeat(4)begin
{b3,b2,b1,b0}=$random;
#1;
$display("\t->b3=%b b2=%b b1=%b b0=%b g3=%b g2=%b g1=%b g0=%b",g3,g2,g1,g0,b3,b2,b1,b0);
end
end
endmodule

