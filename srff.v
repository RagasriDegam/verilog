module srff(clk,rst,s,r,q);
  input clk,rst;
  input s,r;
  output reg q;
  always @(posedge clk)begin
    if(rst==0)begin
      q<=0;
    end
    else begin
      case ({s,r})
        2'b00:q<=q;
        2'b01:q<=1'b0;
        2'b10:q<=1'b1;
        2'b11:q<=1'bx;
      endcase
  end
  end
endmodule

module tb;
  reg clk,rst;
  reg s,r;
  wire q;
  srff dut(clk,rst,s,r,q);
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
      @(posedge clk)
      {s,r}=$random;
    end
    #10;
    $finish;
  end
  initial begin 
    $monitor("Time=%0t clk=%b rst=%b s=%b r=%b q=%b", $time, clk, rst, s, r, q);
  end
endmodule  
