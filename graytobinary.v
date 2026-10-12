module gtob(g3,g2,g1,g0,b3,b2,b1,b0);
input g3,g2,g1,g0;
output b3,b2,b1,b0;
assign b3=g3;
assign b2=g3^g2;
assign b1=g2^g1;
assign b0=g1^g0;
endmodule
 

 module tb;
 reg g3,g2,g1,g0;
 wire b3,b2,b1,b0;
gtob dut (g3,g2,g1,g0,b3,b2,b1,b0);

initial begin
repeat(4)begin
{g3,g2,g1,g0}=$random;
#1;
$display("\t->g3=%b g2=%b g1=%b g0=%b b3=%b b2=%b b1=%b,b0=%b",g3,g2,g1,g0,b3,b2,b1,b0);
end
end
endmodule

