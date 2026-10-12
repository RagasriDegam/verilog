module tb;
  reg[2:0]a;
  reg[2:0]b;
  reg[2:0]c;
  initial begin
    a=3'b110;
    b=3'b001;
    c=a&b;
    $display("and->a=%b b=%b c=%b",a,b,c);
    c=a|b;
    $display("or->a=%b b=%b c=%b",a,b,c);
    c=a^b;
    $display("xor->a=%b b=%b c=%b",a,b,c);
    c=a ~^ b;
    $display("xnor->a=%b b=%b c=%b",a,b,c);
    c=a ~& b;
    $display("nand->a=%b b=%b c=%b",a,b,c);
    c=a ~| b;
    $display("nor->a=%b b=%b c=%b",a,b,c);
  end
endmodule 
