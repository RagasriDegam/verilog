  module srlatch (s,r,en,q);
  input s,r,en;
  output reg q;
  always@(*)begin
    if(s==1'b1 && r==1'b0)
      q=1'b1;
      else if(s==1'b0 && r==1'b1)
        q=1'b0;
    
  end
    endmodule


	module tb;
  reg s,r;
  wire q;
  srlatch dut(s,r,en,q);
  initial begin
    $monitor("Time=%0t s=%b r=%b q=%b", $time,s,r,q);
    s=0;r=0;
    #10;
     s=0;r=1;
    #10;
    s=1;r=0;
    #10;
     s=1;r=1;
    #10;
    $finish;
  end
endmodule
    
