module encoder4x2(i0,i1,i2,i3,a,b);
input i0,i1,i2,i3;
output reg a,b;
  always @(*)begin
    case({i0,i1,i2,i3})
      4'b0001:{a,b}=2'b00;
      4'b001x:{a,b}=2'b01;
      4'b01xx:{a,b}=2'b10;
      4'b1xxx:{a,b}=2'b11;
      default:{a,b}=2'bxx;
    endcase
  end
    endmodule

module tb;
reg i0,i1,i2,i3;
wire a,b;
encoder4x2 dut (i0,i1,i2,i3,a,b);

initial begin
repeat (4)begin
{i0,i1,i2,i3}=$random;
#1;
$display("\t->i0=%b i1=%b i2=%b i3=%b a=%b b=%b",i0,i1,i2,i3,a,b);
end
end
endmodule
