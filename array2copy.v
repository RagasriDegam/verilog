module top;
  int inta[0:9];
  int intA1[0:9];
  integer i;
  integer j;
  initial begin
    for(i=0;i<10 ;i++)begin
      inta[i]=$urandom_range(40,50);
      $display("inta[%0d]=%0d",i,inta[i]);
    end
    
    for(j=0;j<10;j++)begin
     intA1[j]=$urandom_range(40,50);
      intA1[j]=inta[j];
    $display("intA1[%0d]=%0d",j,intA1[j]);
               end
   
  end
endmodule
