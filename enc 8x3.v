module encoder8x3(i,a);
input [7:0]i;
//output [2:0]a;
//assign a[0]=i4|i5|i6|i7;
//assign a[1]=i2|i3|i6|i7;
//assign a[2]=i1|i3|i5|i7;
//endmodule

output reg a,b;
  always @(*)begin
    case({i})
      8'b0000_0001:{a}=3'b000;
      8'b0000_0010:{a}=3'b001;
      8'b0000_0100:{a}=3'b010;
      8'b0000_1000:{a}=3'b011;
      8'b0001_0000:{a}=3'b100;   
	  8'b0010_0000:{a}=3'b101;  
	  8'b0100_1000:{a}=3'b110;   
	  8'b1000_1000:{a}=3'b111;     
	        default:{a}=3'bxx;
    endcase
  end
    endmodule


module tb;
reg [7:0]i;
wire [2:0]a;
 encoder8x3 dut (i,a);

initial begin
repeat (8)begin
{i}=$random;
#1;
$display("\t->i=%b a=%b" ,i,a);
end
endmodule

