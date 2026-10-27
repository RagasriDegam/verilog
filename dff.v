module dff(clk,rst,d,q);
  input clk,rst;
  input d;
  output reg q;
  
  always @(posedge clk)begin
    if(rst==0)begin
      q=0;
    end
    else begin
      q=d;
    
  end
  end
endmodule

module tb;
  reg clk,rst;
  reg d;
  wire q;
  
  dff dut(clk,rst,d,q);
  initial begin
    clk=0;
  forever 
   #5 clk=~clk;
  end
  initial begin
    rst=0;
    #10;
      rst=1;
    repeat (3)begin
      d=$random;
      #1;
    end
 
    #10;
    $finish;
  end
  initial begin 
    $monitor(" clk=%b rst=%b d=%b q=%b", clk, rst, d, q);
  end
  initial begin
    $dumpfile("tb.vcd");
    $dumpvars;
  end
endmodule
  

