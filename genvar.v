module fulladder(a,b,cin,sum,carry);
  input a,b;
  input cin;
  output sum;
  output carry;
  assign sum=a^b^cin;
  assign carry=(a&b)|(b&cin)|(cin&a);
endmodule



 module tb;
  reg[2:0]a,b;
  reg cin;
  wire [2:0]sum;
  wire [2:0]carry;
  genvar i;
  generate
    for(i=0; i<3;i=i+1)begin
    fulladder fa(.a(a[i]),.b(b[i]),.cin(cin),.sum(sum[i]),.carry(carry[i]));
  end
  endgenerate
  initial begin
    {a,b,cin}=$random;
    #1;
    $display("a=%b b=%b cin=%b sum=%b carry=%b",a,b,cin,sum,carry);
  end
  
endmodule
