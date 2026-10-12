module tb;
  reg[2:0]a;
  reg[2:0]b;
  reg[25:0]c;
  initial begin
    a=3'b110;
    b=3'b001;
    c={{4{a}},b,{3{b}}};
    $display("c=%b %d",c,c);
  end
endmodule 

