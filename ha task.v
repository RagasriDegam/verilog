module tb;
  reg a;
  reg b;
  reg sum;
  reg carry;
  task ha(input reg a,input reg b,output reg sum,output reg carry);
    begin
      sum=a^b;
      carry=a&b;
    end
  endtask
  initial begin
    repeat(4)begin
      {a,b}=$random;
      ha(a,b,sum,carry);
      #1;
      $display("a=%b b=%b sum=%b carry=%b",a,b,sum,carry);
    end
  end
endmodule

