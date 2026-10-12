module tb;
  reg[2:0]a;
  reg[2:0]b;
  reg[2:0]c;
  
  
  initial begin
    a=3'b111;
    b=3'b101;
    c=a&&b;
    $display("and->a=%b b=%b c=%b",a,b,c);
    c=a||b;
    $display("or->a=%b b=%b c=%b",a,b,c);
    c=!a;
    $display("not->a=%b  c=%b",a,c);
    
    
  end
endmodule 
