module dlatch (d,en,q);
  input d,en;
  output reg q;
  always@(*)begin
    if(en==0)
      q=0;
      else 
        q=d;
    
  end
    endmodule

	module tb;
  reg d;
  wire q;
  dlatch dut(d,en,q);
  initial begin
    $monitor("Time=%0t d=%b q=%b", $time,d,q);
    d=0;
    #10;
     d=1;
    #10;
    $finish;
  end
endmodule
    
