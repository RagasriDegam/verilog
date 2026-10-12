module tb;
  reg a,b,cin;
  reg sum;
  reg carry;
  task fa(input reg a,input reg b,input reg cin,output reg sum,output reg carry);
    begin
      sum=a^b^cin;
      carry=(a&b)|(b&cin)|(cin&a);
    end
  endtask
  initial begin
    repeat(8)begin
    {a,b,cin}=$random;
    fa(a,b,cin,sum,carry);
    #1;
    $display("a=%b b=%b cin=%b sum=%b carry=%b",a,b,cin,sum,carry);
  end
  end
endmodule

