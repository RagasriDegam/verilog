module top;
  int inta[0:9];
  integer i;
  
  
  initial begin
    for(i=0;i<10 ;i++)begin
      inta[i]=$urandom_range(40,50);
      $display("inta[%0d]=%d",i,inta[i]);
    end
  end
endmodule
