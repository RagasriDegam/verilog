module mem(clk,rst,addr,wr_rd,wdata,rdata,valid,ready);
  parameter DEPTH=16;
  parameter WIDTH=8;
  parameter ADDR_WIDTH=$clog2(DEPTH);
  
  input clk,rst,wr_rd,valid;
  input [ADDR_WIDTH-1:0]addr;
  input [WIDTH-1:0]wdata;
  output reg[WIDTH-1:0]rdata;
  output reg ready;
  
  reg[WIDTH-1:0]mem[DEPTH-1:0];
  integer i;
  
  always@(posedge clk)begin
    if(rst==0)begin
      rdata<=0;
      ready<=0;
      for(i=0;i<DEPTH;i=i+1)begin
        mem[i]<=0;
      end
    end
    else begin
      if(valid==1)begin
        ready<=1;
        if(wr_rd==1)begin
          mem[addr]<=wdata;
        end
        else begin
          rdata<=mem[addr];
        end
      end
      ready=0;
    end
  end
endmodule








module tb;
  parameter DEPTH=16;
  parameter WIDTH=8;
  parameter ADDR_WIDTH=$clog2(DEPTH);
  reg clk,rst,wr_rd,valid;
  reg [ADDR_WIDTH-1:0]addr;
  reg [WIDTH-1:0]wdata;
  wire [WIDTH-1:0]rdata;
 wire ready;
  integer i;
  
  mem #(.DEPTH(DEPTH),.WIDTH(WIDTH),.ADDR_WIDTH(ADDR_WIDTH))dut
  (.clk(clk),.rst(rst),.addr(addr),.wr_rd(wr_rd),.wdata(wdata),.rdata(rdata),.valid(valid),.ready(ready));
  
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  initial begin
    mem_task();
    write();
    #20;
    $finish;
    
  end  

  task mem_task();
    begin
      rst=1;
      wr_rd=0;
      addr=0;
      wdata=0;valid=0;
      repeat(2)@(posedge clk);
      rst=0;
    end
  endtask
 
  task write();
    begin
    for(i=0;i<DEPTH;i=i+1)begin
      @(posedge clk);
    
      valid=1;
      wr_rd=1;
      addr=i;
      wdata=$random;
      wait(ready==1);
      $display("address=%0d wdata=%0h",addr,wdata);
    end
        @(posedge clk);
        valid=0;
        wr_rd=0;
        wdata=0;
        addr=0;
        
      end
      endtask    
    
   task read();
    begin
    for(i=0;i<DEPTH;i=i+1)begin
      @(posedge clk);
      valid=1;
      wr_rd=0;
      addr=i;
      wait(ready==1);
      $display("address=%0d rdata=%0h",addr,rdata);
    end
        @(posedge clk);
        valid=0;
        wr_rd=0;
        addr=0;
        
      end
      endtask    
  
  initial begin
    $dumpfile("tb.vcd");
    $dumpvars;
  end
endmodule
