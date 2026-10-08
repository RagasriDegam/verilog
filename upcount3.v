module counter(clk,rst,count);
input clk,rst;
output reg [2:0]count;
always @(posedge clk)
if(rst==1)
count=0;
else
count=count+1;
end
endmodule

module tb;
  reg clk;
  reg rst;
  wire[2:0] count;
  counter dut(.clk(clk),.rst(rst),.count(count));
  
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  initial begin
    rst=1;
    #10;
    rst=0;
    
  end
  initial begin
    $monitor("time=%t count =%b ",$time,count);
    #100;
    $finish;
  end
  
endmodule
