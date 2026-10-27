module tff(clk,rst,t,q,qbar);
  input clk,rst;
  input t;
  output reg q,qbar;
  
  always @(posedge clk)begin
    if(rst==0)begin
      q<=0;
      qbar<=1;
    end
    else begin
      if(t==0)
        q<=q;
     
      else 
        qbar<=~q; 
    end
  end
endmodule


module tb;
  reg clk,rst;
  reg t;
  wire q,qbar;
  
  tff dut(clk,rst,t,q,qbar);
  
  initial begin
    clk=0;
  forever #5 clk=~clk;
  end
  
  initial begin
    rst=0;
    t=0;
    #10;
      rst=1;
    
    repeat (2)begin
      t=$random;
      #1;
    end
 
    #10;
    $finish;
  end
  initial begin 
    $monitor(" clk=%b rst=%b t=%b q=%b qbar=%b", clk, rst, t, q, qbar);
  end
  initial begin
    $dumpfile("tb.vcd");
    $dumpvars;
  end
endmodule
  

