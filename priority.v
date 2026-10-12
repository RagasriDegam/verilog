module encoder8x3(i,a);
input [7:0]i;
output reg a;


  always @(*)begin
    case(i)
      8'b0000_0001:a=3'b000;
      8'b0000_001x:a=3'b001;
      8'b0000_01xx:a=3'b010;
      8'b0000_1xxx:a=3'b011;
      8'b0001_xxxx:a=3'b100;   
	  8'b001x_xxxx:a=3'b101;  
	  8'b01xx_xxxx:a=3'b110;   
	  8'b1xxx_xxxx:a=3'b111;     
	        default:a=3'bxxx;
    endcase
  end
    endmodule


module tb;
reg [7:0]i;
wire [2:0]a;
 encoder8x3 dut (i,a);

initial begin
repeat (8)begin
i=$random;
#1;
$display("\t->i=%b a=%b" ,i,a);
end
endmodule

