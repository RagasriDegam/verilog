module pattern_gen;
integer i,j;
initial begin 
for(i=5;i>=1; i=i-1)begin
for (j=5;j>=i;j=j-1)
for(i=1;i>=5; i=i-1)begin
for (j=i;j>=i;j=j-1)
end
$write("*");
$display("\n");
end
endmodule
