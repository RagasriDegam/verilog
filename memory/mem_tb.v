//imple test bench
`include "memory.v"
module top;
parameter DEPTH=16;
parameter WIDTH=16;
parameter ADDR_WIDTH=$clog2(DEPTH);


reg clk_i,rst_i,wr_rd_i,valid_i;
reg [ADDR_WIDTH-1:0]addr_i;
reg [WIDTH-1:0] wdata_i;
wire [WIDTH-1:0]rdata_o;
wire ready_o;

integer i;

 memory #(.DEPTH(DEPTH),.WIDTH(WIDTH))dut(
 .clk_i  (clk_i),
 .rst_i   (rst_i),
 .wr_rd_i (wr_rd_i),
 .addr_i  (addr_i),
 .wdata_i (wdata_i),
 .rdata_o (rdata_o),
 .valid_i (valid_i),
 .ready_o (ready_o));

 initial begin
 clk_i=0;//1 change after
 forever #5 clk_i=~clk_i;
 end
 
initial begin
reset();
write();
read();
#100;
$finish();
end


//reset task
task reset();
begin
rst_i=1;//rst==1 means reg variables will be 0
wr_rd_i=0;
addr_i=0;
wdata_i=0;
valid_i=0;
repeat(2)@(posedge clk_i);
rst_i=0;
end
endtask


//write task
task write();
begin
for(i=0; i<DEPTH;i=i+1)begin
@(posedge clk_i);
valid_i=1;
wr_rd_i=1;
addr_i=i;
wdata_i=$random;
wait(ready_o==1);
$display("\t-->address=%0d || write_data=%0h",addr_i,wdata_i);
end
@(posedge clk_i);
valid_i=0;
wr_rd_i=0;
addr_i=0;
wdata_i=0;
end
endtask



//read task
task read();
begin
for(i=0; i<DEPTH;i=i+1)begin
@(posedge clk_i);
valid_i=1;
wr_rd_i=0;
addr_i=i;
wait(ready_o==1);
$display("\t-->address=%0d || read_data=%0h",addr_i,rdata_o);

end
@(posedge clk_i);
valid_i=0;
wr_rd_i=0;
addr_i=0;
end
endtask



endmodule
