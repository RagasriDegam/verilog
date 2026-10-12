module tb;
  reg [3:0]a,b;
  reg [2:0]op;
  reg [7:0]c;
  
  function reg[7:0] alu(input reg [3:0]a,b,input reg[2:0] op);
    begin
      case(op)
        3'b000:alu=a+b;
        3'b001:alu=a-b;
        3'b010:alu=a*b;
        3'b011:alu=a/b;
        3'b100:alu=a%b;
      endcase 
    end
  endfunction
  initial begin
    
    a=10;
    b=1;
    op=3'b010;
    c=alu(a,b,op);
    #1;
    $display("a=%d b=%d c=%d",a,b,c);
  end
endmodule
