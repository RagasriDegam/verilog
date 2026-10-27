module jkff(clk,rst,j,k,q);
  input clk,rst;
  input j,k;
  output reg q;
  
  always @(posedge clk)begin
    if(rst==0)begin
      q<=0;
    end
    else begin
      case ({j,k})
        2'b00:q<=q;
        2'b01:q<=1'b1;
        2'b10:q<=1'b0;
        2'b11:q<=1'bx;
      endcase
    
  end
  end
endmodule
module tb;
  reg clk,rst;
  reg j,k;
  wire q;
  
  jkff dut(clk,rst,j,k,q);
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
      {j,k}=$random;
      #1;
    end
 
    #10;
    $finish;
  end
  initial begin 
    $monitor(" clk=%b rst=%b j=%b k=%b q=%b", clk, rst, j, k, q);
  end
  initial begin
    $dumpfile("tb.vcd");
    $dumpvars;
  end
endmodule
  

