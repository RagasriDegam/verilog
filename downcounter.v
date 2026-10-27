module upcounter(clk,rst,count);
  input clk,rst;
  output reg [3:0]count;
  
  always @(posedge clk) begin
    if(rst==1)begin
      count <=0;
    end
      else 
        count<=count-1;
    end
    endmodule

module tb;
  reg clk,rst;
  wire [3:0]count;
  
  upcounter dut(clk,rst,count);
  
  initial begin
    clk=0;
  forever #5 clk=~clk;
  end
  
  initial begin
    rst=1;
    #10;
      rst=0;
    repeat(5)begin
    #10;
    end
    
    $finish;
  end
  initial begin 
    $monitor(" clk=%b rst=%b count=%b", clk, rst,count);
  end
  initial begin
    $dumpfile("tb.vcd");
    $dumpvars;
  end
endmodule
  
	
