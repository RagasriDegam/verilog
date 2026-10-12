module tb;
  reg[2:0]a;
  reg[2:0]b;
  reg[2:0]c;
  initial begin
    a=3'b110;
    b=3'b001;
    c=&b;
    $display("and-> b=%b c=%b",b,c);
    c=|b;
    $display("or->b=%b c=%b",b,c);
    c=^b;
    $display("xor-> b=%b c=%b",b,c);
    c=~^ b;
    $display("xnor-> b=%b c=%b",b,c);
    c=~& b;
    $display("nand-> b=%b c=%b",b,c);
    c= ~| b;
    $display("nor-> b=%b c=%b",b,c);
  end
endmodule 
